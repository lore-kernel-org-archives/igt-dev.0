Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF8AEA4FAE
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:38:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A77F10E38E;
	Mon, 23 Feb 2026 12:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DwqGqER4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C780710E382;
 Mon, 23 Feb 2026 12:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771850310; x=1803386310;
 h=content-transfer-encoding:date:message-id:subject:from:
 to:references:in-reply-to:mime-version;
 bh=59+6D8AjXgx07GlPY25RnSxVbquNPaJPduxUKy6Xv2Q=;
 b=DwqGqER4soV6B7VkW1hno60WU72uYYE7apCV9V+s4wfvtgTdJg1/jmQp
 zUUs0MSW0AMK0fkurJ5H8SK/NNS0zPfQNoTlrruKiBEVwNJ+RCTiM9uIU
 cAhwqNuevluxf+RUyu8IIikg+Xb8YjYWS3uOxOGcbS7OT7X4pUrDDRTAC
 meZ7p7mfsTv5en6F7/2BnW2YBPVukjn3m92YhXAyrjGB6zZrpQHk1GMHf
 5hgLZ0uFDQ3TAgqvRl9OaCNg4qp3hDgXn4nJ+ap8sftsK8/Zppj+Dk1Ra
 +32Zy6gjddExTpj2QxvT21TUGZ895GxJ7wKkd+JGiZzuJalQmMokI5t7Z Q==;
X-CSE-ConnectionGUID: Uuiomc+LQUSgTj3ng6XHuw==
X-CSE-MsgGUID: msKvJldWSSGtNT9FoSJ6Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72719725"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72719725"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 04:38:28 -0800
X-CSE-ConnectionGUID: yzjik/qcTvmDwerBZ2X1Sw==
X-CSE-MsgGUID: FQ6r6kM9QO2Cs8e2B58q1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="238520831"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 04:38:27 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 04:38:26 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 04:38:26 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.55) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 04:38:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MfRCMscwPxMx5ux/9QPBzYPFfDmtG8FEyywZq+nfD0t226qBTKV25e0+g3LGsCm5UIKKlJfmiAMNWg7eirH89OWvPK4on7/0NpIQyfcTbHHhpdf/NH7WOkWvj4xEyaucCNfcxSjvVWHuQOe0Z+W0gxYNXgdxiyolrjLJoUguST9EhWAlm3QiEPYLCDZbFYupoWWm71kwF8U+uHQf1nPioIAJPdaDRaUFs79Q8kCsrz/JVEAGA8hGaE0FUcdU4ed0g/kx20L7j0FlhZLaCw0abnTVaPR/+/MzMExQwAd+G7/t+lNSptaaBoNNKiObxUXTXFZFH5QKfAS1X5giot4R8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Doea9p8PwE7P3iqZd8yvMVrT/uZIo5yyIO65jWve6nY=;
 b=XfAhj60l2VyvFbOAfbr0mDH6IQMky+9375VeuaAAuZBzTtNoW1xcyH1hb/HuCSjJx/HzJ8OtG3kPLMbP74th5CxEJkX/0t2N8R2evonEfUfDwmyOP8FI5AQRkVAR9Wvi79/CBIvLJ4uTfMIvT274gwxWxzp3CCF92IsXQhze0PSBNG+RxcvILRM4vaPpr69nq4ONtkfdNB2P7OBv4uXnn/8GHE3Wnf8WPqCuUaGCFTxbqifwgmOr4J6GD1rxFvBnHvKir9JDFf2ZtcUO5QlwlH4/Sa9ai7udw71iAWgUIKCYYCpMdc5Pj2uvmtKlMffjV3L8zJ4ir7tvjyJyuh4khA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DM3PPFE441933A2.namprd11.prod.outlook.com (2603:10b6:f:fc00::f56)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 12:38:24 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 12:38:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Feb 2026 13:38:49 +0100
Message-ID: <DGMCIS98JEHD.3B5C5W82HJOMU@intel.com>
Subject: =?utf-8?q?Re:_=E2=9C=97_Xe.CI.FULL:_failure_for_meson/tools:_split_lightw?=
 =?utf-8?q?eight_igt_core_and_reduce_tool_dependencies_(rev4)?=
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, <I915-ci-infra@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <cover.1771510028.git.sebastian.brzezinka@intel.com>
 <177152892562.267869.2589743434745222219@a3b018990fe9>
In-Reply-To: <177152892562.267869.2589743434745222219@a3b018990fe9>
X-ClientProxiedBy: WA2P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::24) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DM3PPFE441933A2:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2661b0-7b42-42ce-0d6b-08de72d86fb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aStJbnlCNVJhNkxFVFdNNGY4MmZDRDVkeG1GZFordm1ZQmxaOUVzdzdJQVpk?=
 =?utf-8?B?bytCUy85M1RHYUxCSDdvZVliTmJHUHhwWVVVQzd2eDlhMXpXbEthYzJNS3dv?=
 =?utf-8?B?U2ZwTGtpY0krdmdPdldYdk9SMVlPamdwMGt6MzQwN20weGhtQXRFbHgxRksy?=
 =?utf-8?B?bSszTmRuUnhGU1JNbGtUdjZwSThpUWNVU3BNWmxEMVl6VU11T1d2bXZMekZs?=
 =?utf-8?B?eDl1SWJ6dVYwZmJZTUhrTWFlV2tseTVLUFhiZklWUnQwYW5hazRFcVYxMHlI?=
 =?utf-8?B?SGxBUCtmaVdLZ2VkUUsxSTRHL0prc0t6VGpRYU4vTWhFazRNblhBdStYMVZ5?=
 =?utf-8?B?aTFzNFJXSDhaaitncEVyUmo5bGVPeUlVeHhkbExidkw5S2pkQjl3Z1c1TmFk?=
 =?utf-8?B?RFNoS2FTTVBEOU9zQ2txemtSOGlGNjltcjlCNXRpaGdPcUYyaGM3bGhDV3ky?=
 =?utf-8?B?d0dGVW00ZTdGZ0xNRXJ6MWRpYUJXSEdlM2ZKWGpFYzN5MTBMbWRGeHFBSHlW?=
 =?utf-8?B?OVBsaGRxT09EMXZuUUxzNnFtWVJjVnd0bFlXbG5UTVZPSEpjNHFuZXBTVDJW?=
 =?utf-8?B?QXR6WVdROW5NWWVmS2dLNDlSM3Bsc0MyNzRMSVdNZXZPc1BWZ20zbThGWWg0?=
 =?utf-8?B?N3Z2TjBpVitDT2ZLYisveGVRRStuMDVTYlJpL3dSNjR0SlVFMHhFQ1FaZXVw?=
 =?utf-8?B?K3NWVlcxYVJRTVVKUktnNmpwaWJMbk9QTmh6ci92clF4OGdDMlY1eHMzN0pi?=
 =?utf-8?B?cDhFazViZWRMNUtJOGtJQ24zMUxGcjc1T2NNZVdSQ3RreGczZFhxWEs5Q0RE?=
 =?utf-8?B?eEwzc3dhQk9wV0VlNTBoWUlpS2dpc3d6RHA3a3hZWTRaVDU1THNndmxnMllT?=
 =?utf-8?B?THdRTnhja2J2VEs5bzhIc3hEZTZWZmRRTEd4bmRQYWVEQWNnTGRCU0lrbWNM?=
 =?utf-8?B?ZmgwU0FpWCtDTU12NS9MbnRGZWFSTzBCWnhrNjk3aTdBQ0Z3akZYSEN2eTc2?=
 =?utf-8?B?dDhLK0FoelJxQmtqVTNkVHpTUlFlMlpYNjRYV0ZtcTFwTGV3UzBEclFhcnhC?=
 =?utf-8?B?bHl5QjkwazllUHpnT2EvbHE1T2hUeFZSeU1xSmVyTUhvcWRWV0xVV0F5WE0y?=
 =?utf-8?B?SEpPdEJIaVZ1ZEZRWTBlL3JTczNRNHMrRUpZNTZhT2lKNFpHRHgyVHM4NGd2?=
 =?utf-8?B?bHlBYmlkTldYdW5TdkxpcXlNcitZR2ZLdVZmb05MV1JLcCtnQnMyYVJDQmlL?=
 =?utf-8?B?cnBmaDBVY0JFQk44YTBZL1ZOWmRhNnR2VTlaeHdjQlNZbk5Ub0FRTHI3bWtu?=
 =?utf-8?B?TUhyd1NwMzZYNk14b3lyVzVZMUFkMis5U0FlTEpIZHU2R1ZzNlVWT09JbWZS?=
 =?utf-8?B?TnR2UDA1UjdzZ2NFUUtEMkJFd2RSK0FYazhTamRKa2RIVGJDdGtiOTRtUk1C?=
 =?utf-8?B?bUgzQnFZeG1MSnc0Q1BHRFFGQVZjMUJQWjRLTUFrV1E0N3Y5RFJDUDc1MjJO?=
 =?utf-8?B?aURQUHloaUcvMTRwV09SeWFGZW1GeDRkOGNnb2RRaXpCVE5ralpIWWtOSkND?=
 =?utf-8?B?ZkZTaFI2eVpMUXRCLzlRa0VHcjIvdmhNdjlJc1k2VEl1aExpajVwRUpkZzY3?=
 =?utf-8?B?dXpHZDNhUHNEcXpiUHZBZ2pnSVB4RzBDemZOdU1FVHg1UVF1UEtuaElEbVo4?=
 =?utf-8?B?eHR6NnRmRUZLQytjMlUzT3R6OU91UFVqVmJzV0dJL0phOUt5SDB0ckRxVEUr?=
 =?utf-8?B?NEx2MGhaMkJrT0U3RCtTR2dHWDNXOWFUa0RLVC9EN0lEWW84Wm9oM0VtVFBt?=
 =?utf-8?B?QWJLeVdDeHhncVJKSnNIZGRmZnNmOFBlK2VwNjVIN2NueTZuMDBaYUtPOXRJ?=
 =?utf-8?B?R3J0RSsxMVpCcjVqUUYvYTNFSnhHam8wSFl1SGQ5VVovWStsMm9neU1mMmV1?=
 =?utf-8?B?NUY0MUdmNXJwdDIvbkU5UnloUllkeEEzdkU0Z1V6V245YUU4WDFyaTBpcnVY?=
 =?utf-8?B?WnhNWFVCZitCTkRLUUxwNnVMQkRnbzJzZk04VkNOSHlOd01Qc3RUT1BGQm5E?=
 =?utf-8?Q?vVLuI0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHgzQUZ1VmlkOUxWQXRYbGJCZ1d5SWhKam9RVjl6aVdGcXRUZlZzTUxLaksr?=
 =?utf-8?B?dWJ5dmhBeHhvSzIzNHBrYXVoMFhRMXBOQjZtRFgwd2JwYXUvNjFGNGlDRlpI?=
 =?utf-8?B?aytUb0lQa055azFJTC9yK1dRTTQ0dlg4U2RJOGlNVkpFVGVjc1AzSHRWdGVM?=
 =?utf-8?B?Q2tVUTBtUWJ2KzQvWnlaRDVlSlUrYzJYQlpaaCtKZ3kvTHkrZHBhdWR6NHkx?=
 =?utf-8?B?ZU56N3lRVFAyN2VNckdQQlZTQ0pEeHpxNjloUmc1Y20raGtoVW40Y3E4WEJz?=
 =?utf-8?B?Q0F5TmlKTTRDdGZmUkdTUWtwTzR2QzNtbmVJOW92eFRGVDlnYWgxTUVaUVRp?=
 =?utf-8?B?a0g2TXEwYSt2WmQwQjVmQW1WYUxaRnlqVksvaU9EYlpHUCt3ZE8ybCsvMnVm?=
 =?utf-8?B?aUhOQWs0UTFJUzJTMUNoK3liZEpVT2lLc2t2VTVqZ1FQd3R6NVN2NHN0TVQw?=
 =?utf-8?B?WTkybmJEZ29MTTVCcFlrTFhkTEpYVlFwK2VCMlo4MFlBckdiNmNGZEVya3Mr?=
 =?utf-8?B?d09HcFVQM3JZZzg5OGMvbGFYcmVmWmQ4UXo1TlR4VE1UZnd0b2hUdVNPQTBD?=
 =?utf-8?B?Zkt5SURXZEg4QXVjV2ZHUW9YYlA1YjFPa05nd1NUbEdaY1l6TS9TVU1rbnJr?=
 =?utf-8?B?dlFMc1k5OVBVTGhhYTg5Vy91eDFLRzd5anZHb1YrdXFVNEN0VmlPRDltZG5Y?=
 =?utf-8?B?SHBXUitTUUpGL1ZvYkpRMURYcFlOd2FXSkZPTk1TT2FmVFlkbERYNUNqVXBx?=
 =?utf-8?B?RVNvbTh5bDh6OXNWdGlWb0V3ald3d1VVa2c5VnpwRGU2Vm1rVDR5em52aDd6?=
 =?utf-8?B?NURscDhnK3RkWXBRTFBYZjM3SGNhNjRVNzR6d2wwK1hyOWRDeUxEZUExMWtR?=
 =?utf-8?B?NjdpYlZ5bWFoNGVGbG43K0V1bzNxR1l3UTdtRk51M2NtT2FOTS9MV0QwdDV2?=
 =?utf-8?B?QUtMZytCdU9XSlh2UFdxZDdaOHpUN0IzMU1XSHp0dGlibDNjWmJ5TERkYjBO?=
 =?utf-8?B?NDFYUGpsS0tZU1NQSkQ0bXRUbGk3NERaeUk5Y0xLZ0JZTzdPRVByZEV3dXBV?=
 =?utf-8?B?eEJYR1d5TWpSREh2Tnd2TXFZMEFkZUwyZ2F6VTJVb3llNHNCUzdtakxlNjB3?=
 =?utf-8?B?MUk3djBXbEx4a1pwaGp3Vlk5NEt4a1BOT2IrTW8rcTN5Tit6YlYySU9qYTBw?=
 =?utf-8?B?aGNERmNMNHM4OGZnbDNyNFd1c0tSNHZUb1hHdXhnRzE0YTRnNll3U2puVll5?=
 =?utf-8?B?S21NZWp6RjZWclhrQVlXR2drcjNvWUVKbkxhVGhXV1Z0eEltZkxFWGdvVTM3?=
 =?utf-8?B?S1JNOFV5TUFkNVlRZ1VRTzJWZE5DWC9tck04Mmtza09VMytDTUVpMjdMdTgv?=
 =?utf-8?B?QllhVlV0d24yQnhnT09JOUZ3UEJpTEhSU0Y5YzBJMkNXNzNzWnBNMWNTSlhU?=
 =?utf-8?B?eVNnOUFmRUxxeThrWUJqOThOUG1nQWRXREk2T3d0TlB6WDZQSTFHbU5zaFRj?=
 =?utf-8?B?aEF5UmthcFBqYys0Ry83VHpGRFExOXN0RVphTnU3OVcwdjN0TmtJbFNNak9D?=
 =?utf-8?B?bUFBZDBkMmdHZGlLRVlQeU94MGJ5M1I0VTJ2MmRkdHZ1RVU1QUg5MERhdk50?=
 =?utf-8?B?UFdrQkM1RGlVYzVtUDV6bExkMUtkUFY5TWthSmhJcE1RUVhXWmdCa2U5NEZI?=
 =?utf-8?B?Vk9MSG9qOUNybFlhZTh6L29OMFRTT3ZJQkFBNXV5b1FzQTBNQWVFTTdPdnFB?=
 =?utf-8?B?TEFnUWdQZG0veE1qaGhkZFAyNllad2puTlhDY3pNemIvaWJXTXRFSGdLQnVs?=
 =?utf-8?B?ZXNBYUYzaGxFbWpMZWJRRVFnZ2JQWFpzVTN2YlFDbzZXOGdOOUlQZUpGRDk2?=
 =?utf-8?B?QW0yMDlZS1IrMk8ybDJNa0ZOUUFTSklFVjdRYzQzOGFpbmd6ODZqRVgvWHha?=
 =?utf-8?B?aForbndydUI4aUVsSkZLdzY1ZHI1QXdHVHU2UzllSVIwYkxzWmdJbmlhM2dD?=
 =?utf-8?B?RlFYMXA5OVdRbE9PZHBpMlA3d2NSR1Urd0JMaHpwZ0pUUUhxLzRKeldXTERU?=
 =?utf-8?B?Y3FYRVNSaXhKaThqeEc0Q3VkUWZ4T1VSUmM2S2lhSlQxSGRjRVp2S1RFUmxH?=
 =?utf-8?B?eHdEN2UvdmJtbHZZT2lhWWc4UWxralIrNnNMTTNnNTg2cWQwWjlkMElzRHda?=
 =?utf-8?B?QllJU3R1S1Y1MWlkQ1lhbTRUdHYyMFZpQlhMZ3ZZV1ErVjk5VEMycmdCVk1i?=
 =?utf-8?B?TitSTXdjUERqV1kwOWYrVDhDdVBvaWxiU241TkxIQURmUHZ5YktKbXpwUkdN?=
 =?utf-8?B?TkpwckNObGdFQkFvbWRlVHhJYWx3dmV2MmpZN3d3dkpNSGRKampUWkQ2VUp6?=
 =?utf-8?Q?9fzbZz0Nwe3nlpn0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2661b0-7b42-42ce-0d6b-08de72d86fb2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 12:38:24.6704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+6OuO2cEzsEQJuwylCL1prBDcef9+wMxZxpEkpYeeP2SIXUkB7Om9n/iHSZifaxj3zfRXhcnwNyCMVhWR/i8YMZwCcjzZb/P33VjAQjLOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE441933A2
X-OriginatorOrg: intel.com
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

Hi CI-infra team,

On Thu Feb 19, 2026 at 8:22 PM CET, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>
> Series: meson/tools: split lightweight igt core and reduce tool dependenc=
ies (rev4)
> URL   : https://patchwork.freedesktop.org/series/161146/
> State : failure
>
> =3D=3D Summary =3D=3D
>
> CI Bug Log - changes from XEIGT_8762_FULL -> XEIGTPW_14575_FULL
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with XEIGTPW_14575_FULL absolutely need =
to be
>   verified manually.
>  =20
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14575_FULL, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in=
 CI.
>
>  =20
>
> Participating hosts (2 -> 2)
> ------------------------------
>
>   No changes in participating hosts
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in XEIGTPW_1=
4575_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@kms_pm_dc@dc5-dpms:
>     - shard-lnl:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8762/shard-lnl-1/ig=
t@kms_pm_dc@dc5-dpms.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14575/shard-lnl-6=
/igt@kms_pm_dc@dc5-dpms.html
>
>   * igt@kms_vblank@query-forked:
>     - shard-bmg:          [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8762/shard-bmg-5/ig=
t@kms_vblank@query-forked.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14575/shard-bmg-1=
/igt@kms_vblank@query-forked.html
>
>   * igt@kms_vblank@query-forked@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [ABORT][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14575/shard-bmg-1=
/igt@kms_vblank@query-forked@pipe-a-dp-2.html
>
>   * igt@kms_vblank@query-forked@pipe-d-dp-2:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][6]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14575/shard-bmg-1=
/igt@kms_vblank@query-forked@pipe-d-dp-2.html
>
>   * igt@kms_vblank@query-forked@pipe-d-hdmi-a-3:
>     - shard-bmg:          [PASS][7] -> [DMESG-WARN][8] +1 other test dmes=
g-warn
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8762/shard-bmg-5/ig=
t@kms_vblank@query-forked@pipe-d-hdmi-a-3.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14575/shard-bmg-1=
/igt@kms_vblank@query-forked@pipe-d-hdmi-a-3.html
>
>  =20
These failures are not related to the patch content. The patch solely modif=
ies tool dependencies.

--=20
Best regards,
Sebastian

