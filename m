Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E001C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 11:27:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2EA10E7B8;
	Mon, 25 Mar 2024 11:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gjIgzm9t";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FFC10E7B8
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 11:27:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMg8qKxuVjCPPCgXYiYJcbt4PsVPuCZyslL+aqJe/G+ny3Bv00y81DtRqlIxBa19lDvmFA5h76TyhRE5nGZmRVhPuXuPSlAlxB9Dxa/MY0sTrBBI43pefo4kIsQopaoWDcMZfO9Sca7ge5NbMqMaLB7+nQFlLaRm1Ywm/d12f+Rku5b240W/IjBA0L826sa8Rppsahn7Ni1N6mtoz1/7ziWwSGLs00xq7Y63zPvVCXnVCQIkRklKHP758HjAWZwbVH9WhxXjfVTonFqSmJE2R2+Wrwi7yDp0yL7luV4tlvNHe2Y9GdIe96oIiK02SQs3xl8Yp9EjaPkfDaNPoxyEKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaOmA/KzE7aTi0TteXUaDA1oh3AHYcT/d2e6G0oCHM0=;
 b=jzuiFXtciaAEvs+uNYii5dPc2rpooNTAxTgvxKgHbukWcFdUDXGdWLN4OnzkRVsGMShE/DLO38w9zfZkalPaXmJ1XW1FMFky3osFNQqxoF2WbGr/uli2tBKSEsmMh4gp5BkFzVO5awwTGzd1gQph844gKlEhn82Oq3+pLdnJAWPvNcNYy61LHRf7l+d3NRHXWmtHDkVERIUP8rnwqoC1vkt539pwLIq03nvDqXIYKRv9eBJml49KqIR9iCOLTwCE69W1P3PZFZMyme37xGbgLfphIVs042Tr1TS53YNR+ZJG8dzKcv1LhG8iRRAJxBGRysJG4aO11GBhcvE1xyrOOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaOmA/KzE7aTi0TteXUaDA1oh3AHYcT/d2e6G0oCHM0=;
 b=gjIgzm9tjPRB487lhTVeNPmf1tYZVoeqgN96ub53ZeAakC5GgoLIMrtoMF/hZjQl7XbB6dr5ptlV3VZ4Ly33rDkDvJnaFgmH+nRhjz3W5OU8gpm5YbPZqjf7N2kVgj8NXxATJlSrfV1t+bhzEfGpZ6EzAUU+b6g2W30GSCgt1oU=
Received: from PH8PR12MB6962.namprd12.prod.outlook.com (2603:10b6:510:1bd::18)
 by PH7PR12MB6395.namprd12.prod.outlook.com (2603:10b6:510:1fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 11:27:22 +0000
Received: from PH8PR12MB6962.namprd12.prod.outlook.com
 ([fe80::dd5a:9555:315f:55e0]) by PH8PR12MB6962.namprd12.prod.outlook.com
 ([fe80::dd5a:9555:315f:55e0%4]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 11:27:22 +0000
From: "Wu, Hersen" <hersenxs.wu@amd.com>
To: "Hung, Alex" <Alex.Hung@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>
Subject: RE: [PATCH 2/3] lib/amd: Return false if dp_fec or dp_dsc is not
 supported
Thread-Topic: [PATCH 2/3] lib/amd: Return false if dp_fec or dp_dsc is not
 supported
Thread-Index: AQHae+HmgVL2fQCLeUa7kvsWFGTZybFIVwJQ
Date: Mon, 25 Mar 2024 11:27:22 +0000
Message-ID: <PH8PR12MB69628B243E27BF3E34471543FD362@PH8PR12MB6962.namprd12.prod.outlook.com>
References: <20240321224758.1531610-1-alex.hung@amd.com>
 <20240321224758.1531610-2-alex.hung@amd.com>
In-Reply-To: <20240321224758.1531610-2-alex.hung@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=821a5e4f-8a16-4e14-bcaf-1ba66c7eb0b0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-03-25T11:27:14Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR12MB6962:EE_|PH7PR12MB6395:EE_
x-ms-office365-filtering-correlation-id: cc10b962-3b38-4011-1d04-08dc4cbe8a26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5+mBztv59Tdb4vELNEVSnRoyKsnIh5648IoGvfdlQsH9fWuk/q2kK8aJo0in7hDSA5azopcVhyapajWa9r6XmiIqOMQthUpMx9wgP+ymv5G9cTbykug6LGepHIoYiXqN6o6/GfByFlp18gGYqMMwDtse/NtBSdlvzKVZHZxKmwNvfZ3yDj+x9bvXDQTjSaRkrQAQmYpN1IikRVsj3VmzML0vbzUtgAOdpjFMpNxDpg2wSQG66VcQwsRn6sSZj8tFLq/xjQm6cSm64mySvukKzNJ+xGv/JMeuNMrdYGOKUkkb3NOj8FBrgo2tWFO3NsGEyFrGpHB2v5TyHm1NLdJ2R1GLlnZ6pT3O0wPy12Kfbn4CzmhZWLQYkrzmfFKw461cRHZcp7hPQUu07mzzZKZwkY9fOj6uLdr0vzGJP7HqxAGu2Df79H8cAsm94g9uRsCBjImJwKeofOkj0f2SYxOdoE5pRx7C/N8tO/UuItjvXqQTEjoU2mxGlHmGgRQwzebUhka7lqNeSkvLr1buY1JVkwWIiI68LWaUWrQ2wc33X5FHwpmvuMsM9BLwrrtoAiOI+lbzN7YTtBuKFnLFpeKipCID94vorgnM7yPgiUXjlQKy9iERSxu7sZo0KOMYvkgzC1c5DsmVsW79y+K8RCJDOMPgAKQPHj8tfJxjoMnry+L9RH0uWmxGhXsGlBNebR6XmA3sOWCZOHb7ODGfPMuvlg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB6962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z7ONdCEm0sHdvSQqFvE3hfG23BNLP+i1BDyZfrqD4MQP4mrbKrM2+6WT9a5s?=
 =?us-ascii?Q?wZeJHwB/FhrH7vwaJrXhtX40IJBaJmMKGbTw75pEt7KQ/7jTTAppKCSYpxrW?=
 =?us-ascii?Q?0ssISwUMRV1pH769NASzv1PU4ctmdxiZ2iMoySGxj1aIDA4tW9rXilJLgAV+?=
 =?us-ascii?Q?VAyIBxGCxVum4LrWS6r8sb0omR+v7+uKQA/qQW0t+e4R/537cPYcjWjGPEsE?=
 =?us-ascii?Q?FCARONxP5ZtnWLuKTPxQ1TplF20wWE6Ygo0ZKhYVekSpklN4pc2v55MdJtG/?=
 =?us-ascii?Q?cc1YEHiqojjQYQXIwmQWlqKsym8dwjh/qxVJ6qTl8zZqhVlyByNEmvjC23XB?=
 =?us-ascii?Q?qCK1tJnWf6pVkj0F2nfTI48ROj7cBPhuDk7mio0VTur54oDg1EASTIAO9/iS?=
 =?us-ascii?Q?YDcT8wcJQVQ23vitRein5uLZXfzUDbw42Pc0/IZKnTtPC/SU6uyGtH7FqQI5?=
 =?us-ascii?Q?8zWmIXcbvoDuQLTQ+YtA+GqXL+5cWz2VFle/M6AKWdvaglsFr4CzfjRVvkiH?=
 =?us-ascii?Q?ZZ0B58UwnLMBM8+3wRC5NmEY/4Rudpyz2X+z5VKPFYfF/ReXpj3RtSrifSLu?=
 =?us-ascii?Q?MC932I/FgTX2WmTUD7VDehDImw60DjU1AcQMxIhX/uyZLd9poufmjtcNM/ha?=
 =?us-ascii?Q?C5/BmBSLT4W4d0EQpTKR4i3jWzHnazaBFj5TBKGvsEK0hcno7x2wEeVVczpc?=
 =?us-ascii?Q?p0lKBab0kAqJusgp4xXlI5ReHNdf/kf6DKAyYUufIaT82dmknM/21+4F9w/f?=
 =?us-ascii?Q?ZBYe+Kqb9ezXCVmiLm4CB93RFAGmu81keq7G0p51z7hZPAnqUmH8hLWH/EuI?=
 =?us-ascii?Q?l7cYmZwZo1tLaUVxH5CansrHyVZ+NlzHQEea4t496dsosU/9RU9YE3Stj1uk?=
 =?us-ascii?Q?M3aKTLBoFos1HnkBM4IHANhwgeKc1ED+XJ93As2HtpBjIa9NGtq1U4aettUA?=
 =?us-ascii?Q?/1t9T9VxxgCpTVpJm9t1Eq3vQh2VwCo20YgjtcRb9F2Q5Lr2BWo7/Tsm3khc?=
 =?us-ascii?Q?B2hnEs/MB8A8YTP2gsgfOIGSE7trud5AWYlWt1SmbJHtaWDk32GvxNA/4qVF?=
 =?us-ascii?Q?9A7Xw6gD3MTkEoq1DlTPBfCIW2vGHoJQrWlDfTSl9xqa+4qEpUaSwx+6mUsl?=
 =?us-ascii?Q?voWOa2jQumvlVuyisSE1huos1zP2SnJPAbGW1x2BDXHx+o0zN2/pjE38Kc4p?=
 =?us-ascii?Q?+kROoGrGB+e3fND6jFgyk1rZ1XtBMfvTKwBrQF56DY5IEawEqPvFMuwr/64T?=
 =?us-ascii?Q?dSvrmfw3nyTOTMo0LoCPrItFfRKFbyuMPiiBaT2cTXhpgLT0h8OvoS3f9Rrh?=
 =?us-ascii?Q?PGoIEQ1jutymo6PLhpgl4rxZyZewFQlO3HXxgDuPX/FPn74UP32ZN+NDr1XD?=
 =?us-ascii?Q?MTwxivMe7ulhlaPzLilFOHrG8zxG+25xH3+/kpGKHVS610NODn07/PCKJUfC?=
 =?us-ascii?Q?8uyklKYM8bjQUW86gIVipHbSqzTrpiQIThaLHqrcsqOf8Z/jpXoh2MjUJUoR?=
 =?us-ascii?Q?lUfhGKFj+l9RuNDc3f+bPWNCOaOtIQIUu0UEE/5gJy5qHGYfnblnqUOYIUm5?=
 =?us-ascii?Q?XmgTuScCEfFeqigNb1o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc10b962-3b38-4011-1d04-08dc4cbe8a26
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 11:27:22.4641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: psxFNU7UfEcTJclYe6QL8jIkI9b94gMJGJoFeJ+kFydGoZK6dGu6LVBsJUa0BaOnO7FnHIYq83sPDWBnI7CrEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6395
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Reviewed-by: Hersen Wu <Hersenxs.Wu@amd.com>

-----Original Message-----
From: Hung, Alex <Alex.Hung@amd.com>
Sent: Thursday, March 21, 2024 6:48 PM
To: igt-dev@lists.freedesktop.org
Cc: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Wentland, Harry <Harry.We=
ntland@amd.com>; Wu, Hersen <hersenxs.wu@amd.com>; Hung, Alex <Alex.Hung@am=
d.com>
Subject: [PATCH 2/3] lib/amd: Return false if dp_fec or dp_dsc is not suppo=
rted

Stop assertion but return accordingly when dp_fec or dp_dsc is not supporte=
d.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 lib/igt_amd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c index 623883dbc..a321da335 10064=
4
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -353,10 +353,10 @@ bool is_dp_dsc_supported(int drm_fd, char *connector_=
name)
        }

        ret =3D igt_debugfs_simple_read(fd, DEBUGFS_DSC_FEC_SUPPORT, buf, s=
izeof(buf));
-       close(fd);
+       if (ret < 0)
+               igt_info("Reading %s for connector %s failed.\n",
+DEBUGFS_DSC_FEC_SUPPORT, connector_name);

-       igt_assert_f(ret >=3D 0, "Reading %s for connector %s failed.\n",
-                    DEBUGFS_DSC_FEC_SUPPORT, connector_name);
+       close(fd);

        return strstr(buf, "DSC_Sink_Support: yes");  } @@ -380,10 +380,10 =
@@ bool is_dp_fec_supported(int drm_fd, char *connector_name)
        }

        ret =3D igt_debugfs_simple_read(fd, DEBUGFS_DSC_FEC_SUPPORT, buf, s=
izeof(buf));
-       close(fd);
+       if (ret < 0)
+               igt_info("Reading %s for connector %s failed.\n",
+DEBUGFS_DSC_FEC_SUPPORT, connector_name);

-       igt_assert_f(ret >=3D 0, "Reading %s for connector %s failed.\n",
-                    DEBUGFS_DSC_FEC_SUPPORT, connector_name);
+       close(fd);

        return strstr(buf, "FEC_Sink_Support: yes");  }
--
2.34.1

