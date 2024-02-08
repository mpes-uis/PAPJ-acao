library("devtools")
library(sendmailR)

#texto email

email <- (as.character(df[linha, 4]))
nome <- (as.character(df[linha, 5]))
texto <- paste("Exmo(a) Dr(a) ", nome, ", ","\n","\n", "Segue em anexo o documento em PDF contendo uma ação do Plano de Atuação de Promotoria de Justiça (PAPJ). Este arquivo foi gerado com base nas informações inseridas no formulário na ferramenta Microsoft Forms e será parte do PAPJ.","\n","\n", "Siga os passos abaixo para formalizar o seu Plano de Atuação:","\n","\n", "   1. Instaure um procedimento do Sei!, utilizando o Tipo de Processo: Plano de Atuação de Promotoria de Justiça;","\n","   2. Em seguida, insira os documentos recebidos em seu e-mail funcional (Identificação e Diagnósticos e as Ações Propostas) utilizando, para cada um deles, documento do tipo “Externo” e a opção “Plano de Ação/Atuação”.","\n","   3. Inseridos todos os documentos recebidos, encaminhe, simultaneamente, o procedimento para a Unidade de Planejamento e Projetos (UPP) e para o(s) Centro(s) de Apoio Operacional, Núcleos, Grupo(s) Especial(ais) de Trabalho e/ou unidades similares relacionada(s) à(s) temática(s).","\n","\n","Após a análise dessas unidades o procedimento será remetido para apreciação prévia do Secretário-Geral e posterior validação da Procuradora-Geral de Justiça.","\n","\n","Para mais informações, acesse o link https://intranet.mpes.mp.br/age/papj-2024/ e caso precise de esclarecimento adicional ou assistência, entre contato com os servidores Ana Paula Senna Dan Rossoni ou Fabricio Ferraz Pêgo (equipe da Unidade de Planejamento e Projetos) da AGE","\n","\n","Respeitosamente","\n","\n","Equipe da Assessoria de Gestão Estratégica (AGE)", sep="")

cat("Processando linha", nrow(df), "|", "email:", email)

#### Envia o e-mail com authentication and SSL
sendmail(from="age@mpes.mp.br", 
         to=c(email), 
         subject="Formulário do Plano de Atuação das Promotorias de Justiça", 
         msg=list(mime_part(texto), mime_part(filename_pdf)), 
         #msg=list(mime_part(texto), mime_part(filename_pdf), mime_part(filename_word)), 
         engine = "curl", 
         engineopts = list(username = username, password = password), 
         control=list(smtpServer="smtp://smtp.office365.com:587", verbose = TRUE) 
)
