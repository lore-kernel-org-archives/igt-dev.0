Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3DCE77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 14:28:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28ED610EBB2;
	Wed, 18 Dec 2024 14:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D5SYjKRB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7A310EBB2
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 14:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734532092; x=1766068092;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=D8HHChOy36/n4JGK4rAKFgyrMPucWmXNRqu/1xYMSw0=;
 b=D5SYjKRBUaBwBRRBkyIfTFOsLHOhV7szXXwyYz32TrBjtvnFVcT4MFMJ
 o6IjG62idIkrC+ptxF0UihfFqtN51pFGmRVdt+IqZzvDA9VFzrHXMe4KZ
 DC2VaU8LDl38/ZJdJs0ixBTO5DUxE8mKFiW62I/Ci1erK6Q/1LgG91t+b
 DsCFJ6zuM/jK2sDP/cUbsZ1lQlitZJC07ETKE4kYsURq3obYnrN3Rxinn
 7I6JebWVw+qcAbyHJJ6nDrGN3j/ARexcWPcJJaNrASfbua+MLZ+octuxO
 0q2iSpItB98TYUyw1Q3gB9Okkrv96DvxOtC4FIN66AlH3TJBol3JBFAiE g==;
X-CSE-ConnectionGUID: Cf0/EyKNSF6TqYslnLy28g==
X-CSE-MsgGUID: ylw+selWRC6r/rlFnDgnxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="46426392"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208,217";a="46426392"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:28:11 -0800
X-CSE-ConnectionGUID: krgZbsivRLaolIRy3G8y0A==
X-CSE-MsgGUID: IRvUbxzLTmi/5ri77hnUJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208,217";a="98697258"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 06:28:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 06:28:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 06:28:11 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 06:28:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jv8LJp7XRHOQaGl4mqnoxudK35NfW0kby58Hriln0Yi+X7YdcdDnjzuLi/X0rC4SA/PfClYwPWKnw/JWASgNFpb+3LrLIpu0paP1tzTNVRH1Y19+lCjl/ygdNnAxFNB96xfcx8XhzbKjqBf2fhCMx6nXCdbl7JDCNzfwGXFbJwb5R/l9ry10ajesZRDXVtxvRkr8/4mCFO8fYx1Muif3uM0C/jalLE1kFECURBuK40ebbUJXmDuAI1skghZotW40DGf60V6LAM8q26veiHct2qkiTaXyrJcxIov8YXaxPbpIpSdYAT3xOB7jD3XuK5FAydZX8idWkyfgKNPXNJzq7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpsWnDxkkWzy7Ewzw534i+LvMd/maR4YguJ6j7kU14s=;
 b=mD3iYRjcPnIHNYrbdKIV1u639ZsyZwXen73Gx0bRBD7XPcoViOhbOemmL8pQE4ZKNF/a6ehMkLEdbBWVMrVhrO+bEujr//ggWeiyR0yj5yQJPwwcmMx1D2vAG1NDCFCl/M7/WWleJK+TR0MXTDr8iAODI82Fm4dkJhuQdlLWE70AhefxNT6r6O1PqYXtorr32zX+BXbtNnACidLtOini5lbX/gJ65/0emvzX7hLXHEUXQmzs9XxRc8BeAUbnfgivsB5CotXkSRzxCias2mku2tEHmJn19ms7W/VoOmrvSJkAXmipT0DoQwjiQqKULX5slhLB3Vh4M3358/jGeHi2XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by PH8PR11MB6951.namprd11.prod.outlook.com (2603:10b6:510:225::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 14:28:08 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 14:28:08 +0000
Content-Type: multipart/alternative;
 boundary="------------VTAcjvU0uAEWO3gGyCN4g046"
Message-ID: <8243db83-99c5-45c8-9889-f352b3bed1fa@intel.com>
Date: Wed, 18 Dec 2024 15:28:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/5] lib/xe/xe_sriov_provisioning: Add accessors for
 quota/spare attributes
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
References: <20241218120056.779962-1-marcin.bernatowicz@linux.intel.com>
 <20241218120056.779962-3-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20241218120056.779962-3-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: VI1PR07CA0217.eurprd07.prod.outlook.com
 (2603:10a6:802:58::20) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|PH8PR11MB6951:EE_
X-MS-Office365-Filtering-Correlation-Id: 82df7ce4-c9c2-4ea8-d555-08dd1f70315d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2R1QnFnVWJ6OFFYaFpVSyt4am41ZmJ1QVh6RlNEK0R5bG90aFhWYXEyRTNG?=
 =?utf-8?B?TXVnR3VSM1ZiQ2hMQXBOWUs3R015TlVXSTNuYmNReDBucWd3V1h3TjByY0Y3?=
 =?utf-8?B?T054QUtMenh1WEZjWHB6LzdhSmRWc1VFNERkSUZkLzd2MHd6OFFMZ1A4Z000?=
 =?utf-8?B?MDVxVzljQ0NNNjBvWG1qZ29VcjNMUmtEKzEreTJWLzUvblBZdzVxR3BGLzNC?=
 =?utf-8?B?R2NpOVBuV1JiT1pPMkQzL0I0Uk9RMmpFaXJlNDJlOU11UU5BUmJuV2taRkk0?=
 =?utf-8?B?dlJVNjloVWtMd3puYTRPdFphMzB2RGpUOW5qMDdQcWIvVzBDRUtkYnRwWVNN?=
 =?utf-8?B?L1JaekFIUmZaWVlZRnFxMEpaZlB4YkpKaVIvTUkwcEJvSndmVktXakp6TGx3?=
 =?utf-8?B?M01WcFVsT3FISWpXZllMQm81RFlBVFdXb2RGeXNXY3FQaUNYVVlWOFRkZ2h4?=
 =?utf-8?B?YUZYeE92N1B5ZVJSamo0V2xVdS83bWdKVzdjV1ExVDFyM2lsbFpvRndpVGxx?=
 =?utf-8?B?UnNQVlZGcVpxZkdRTnVqRXk0b2EyRnF6TDZxSGhrUXNHQ0RadjNON3Uxck1G?=
 =?utf-8?B?a09GcHJ6R2ZldXdkWktWQ200VXg3MVNXdG5Sc3UzdVB0alQ5RmJ2b3VPU3Zx?=
 =?utf-8?B?YnBPRW8yTzFrUnZaN3ZKL2VhNC9oSkJYbmsvWjArTkNJVEJTNHUwTEFiUHVJ?=
 =?utf-8?B?Z3ZuNjdjK1V2Y0tpVWNNTFpCSXVuM0Y5eE5mbHE5MU10M3l3Wkt1R3dhaWZH?=
 =?utf-8?B?Y1U5QUdlOGxzZHVncXdGZ0tCRG51OElQeWdpbCszaXJEcElEYWNzZVUwblhT?=
 =?utf-8?B?anVBTi9vd0ptZ3Jtbmx0dGpnU09TYi9xNnd2NHBSQS9JV2pST0RGSFFSbE1R?=
 =?utf-8?B?d1FtYnlVRUtkMC9wVlRGWmRWZnd3d2FVNWxrRnBMbmxvczduRUlkYXRvRG5J?=
 =?utf-8?B?K1pwMEtOWWV3c2VZTzM3MUxkZXVNeVNrQzdiYUZ6L2NQVnNkNVFDWFoxZWQ3?=
 =?utf-8?B?WWxRczNKZjVTRzNpTmZveERSS2ZPRUpmMDBHSnVWeVA3QW5KUFFHOTVwNllP?=
 =?utf-8?B?QjJNQldYZEpSQVZLZ0NyMmRSRWJJU2FHMHB1bHZUQlhoK1AwYk8yV0NHdEtk?=
 =?utf-8?B?Q2U1Nm5KWDBUTWhqOTBKV1c0THBSTkQwdm5Nam0wQ2dpdmZFaWVudU1tTU1S?=
 =?utf-8?B?L0FKcVN1MkNlYjhzeVpteVJYTXFkREdHTVlVVjF2NExyK1FrdENBYUM1RHpq?=
 =?utf-8?B?SWtEcHZJQUhTYzFtUGpOdGV1QkNVazZMd1pZY29zeWt0NkJNWkU0cklrRE9l?=
 =?utf-8?B?Rkdrc3R1OWcxT2NrQTU1RDduYjZJd0xYZ2NzcVZxUlBhOEtxajBmRWp6cUlV?=
 =?utf-8?B?cWdLZTJNc3lLSlhVNlhzSHhPTGZBV1l6dUFZZ1NBQjJ6dmIrdU8rREJvaU9J?=
 =?utf-8?B?cUhmRkZqTzVYbFRla0ZYZXE5aU5JQ0xMSXNWTXZ0QTNIUUxFR3JoR0VySXZi?=
 =?utf-8?B?TjBlV0QxbGIxTDhib255OGFMa3lGV3N1MFppT29BWDg5Y2lKT3JlYklseHpS?=
 =?utf-8?B?UE1qZ0dLSEx0a2Y3NTZSOGJFUUpjN3BtZUJUelBybXpmSTlvdXJWYTRhRUxu?=
 =?utf-8?B?QTNnVHF1eUg1NnZOTko5QXNLVzJwZDFLVXhaK2Q0cklER3hlKzM1QTkrOWk1?=
 =?utf-8?B?V3NrYndjOXB5dFl3cmROQUJST2hBMzFLSzg3QnNiRTNRM2RvdXQrQ2pncTBT?=
 =?utf-8?B?Ym42R1JCZFVjdlMwK3RnaHE2V1l6eWM1akV2WWVQTEdWTTFUMWE0bVV0UWdD?=
 =?utf-8?B?Ulp3TGVScExzR3UycDJoMmhwd1lYbXdRUmd3OFR5dklyTm9MS2hWTWxsaU8w?=
 =?utf-8?Q?iRPA2P83FjBKM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXk5MUUvZlJGdW5QVE5OZ3c3QUVaM2k0eWJXa0xIR0w0YVVIV29tNEFjYXMy?=
 =?utf-8?B?R1hRbThSaklrMG1HWlRuRjduUVBTb3lTQ1dZR2VUNzA4VnZrZHZSTG41RFVQ?=
 =?utf-8?B?ak52YXA3ZWdQeXhNZUVmN1MrTGlwZy9OeTNtOXE3dTdrcmlFTXFxQW5ITlFr?=
 =?utf-8?B?VjZhclQvczdUOTVUMEhXOFdPYVo4dGhsTEV2bHo5cHgvTGxjQXF1OXFBUERk?=
 =?utf-8?B?QnBVVHRlcXNJaDZ4QktTcWVCUXUyMkViU1MzbVB0QUtsZFp1K2JNWklNdzZI?=
 =?utf-8?B?ejdZOEtDN2o0UXFzKzdkck1lVDViS1Nob3c2RXJuRGFVM3oxSkFQQktFMmQ1?=
 =?utf-8?B?Ty9JVy9mYXhJTldyc2R2UUtxajBjMFJqYWczNldoK2xQN2dqdFhlTlY3ZnJG?=
 =?utf-8?B?UmE2bHg2aDZJbThZV0FZR0pCcGRZb1lxUkRIRUNXQzFZU2gvYzN2Q1RHVHpj?=
 =?utf-8?B?bis4T3ZmSk03RkpqNEViNUZ1bVJEYlhzQzZ1K1VzRGR5cElBK2FackE1SVNH?=
 =?utf-8?B?MWhBUHpEUDVDSlhnaHU1aUVsaTFuODh0Z2xORm9EcTd5M1pwWjY0eXJuNGlz?=
 =?utf-8?B?bFJONWdjWDA4QzBMaTAzdGRnTk1rd0VFaXJ2cVEzUUs4WmUrU3F5RzdKQzBK?=
 =?utf-8?B?NWRFWVNsRFVrWHU0dDFEM0t3VC9hNm84V0ZacFpXYllXL1Q2ZHl6WmpjbWJM?=
 =?utf-8?B?Tys3TjB5RGYyaTJZQUJjNXo4ckZtSWUybWxTbWtSRmVZOFZ3YnVhTHNGemd6?=
 =?utf-8?B?U3k5WFJBZnBVV1lTd3NiQ2ZGYUM5WkJxL2U4d2N0bHF1U0RRSFZnM2ZoY0NK?=
 =?utf-8?B?MkJDWjBLNDJrS0twaFNvc01UTmVrNmNJMWRxRXNyTVNnVFJYVDEzY1lmSnJK?=
 =?utf-8?B?Tk8xSnMvR0hVYUhwVUVDendpUkxKTEVySXhUMVU1TWlGSXA4Qzl5Vy9TVVB6?=
 =?utf-8?B?M0gzKzdYZEdSdGZGdStNUFlBblBZdkV4Z3BGU3oySE9OWVU0cFNFemhoS3I4?=
 =?utf-8?B?SDErVEc2TkNYd3kxTEcrN3huQVdlZnc4WDY5SUZZb2QvdEVqMmFRcVdRcGs2?=
 =?utf-8?B?b2QyWkdRYm5vejVVZmhkVGVjVmRYVHh6Y0pJWkxPZVZCazVEZFhKeXoyTGdz?=
 =?utf-8?B?eG1iL0FsdkxFLzU1TXFvM3Z0Q0ZWNkdTclZ5Y1ZFSVZDU3ByU0taaVRlaTc5?=
 =?utf-8?B?NE5qQnk2eVRXNWQ1VnRqR0pCOWo4cmY1NVZ0ODlWVVpFei80ZnVteUd1UUEv?=
 =?utf-8?B?MWFESFNvTk5rSjBxSDVaWFpCSzBLZjQ5ejd1ZHVPOHVMNWFIaDZPTWdFeWR4?=
 =?utf-8?B?aXNRZDAwMENFd2RLSmNKN0sxWGU5SjFkSDA4dXc2c3kxUHp5ektxekh1cUVG?=
 =?utf-8?B?T2J5b2lwbjB6L1NMNzB3aThMN1BucGdiaWQ3YVIzdFpVUk1uaUpVN2lPS0cy?=
 =?utf-8?B?TTJoWG5BL2piZzVIaVB6Q085QkhSMExMYUlySlBObFI2S3JnWUlxT3FuSFRU?=
 =?utf-8?B?QnZMT21YOGNTcFZGVWtHNUtYSlJsRnMzZHZGRjQ5ZFVCbWRoNEtiSlhZRkJ2?=
 =?utf-8?B?MVBPdGFhSCtSdXVjamp1UTVLcFBpSmp6NmV6M3hUQVN1TXkrT3hRRDVEOC9h?=
 =?utf-8?B?bkFJcmVQeDh6ajFDZmFOTWgxM0tqY01ET1YyVTNGNG9QSlVCNDFRSitWNExq?=
 =?utf-8?B?NUhsVW95Rjd4Z3MzL2JQSjlKZjNFYlZoVW1ETjdmZmQ0L2FocDFOL2Robk14?=
 =?utf-8?B?NVpaVzF4dkx3elNYMURuVkE3RkJOQkllT2NQV2djSjVobFNZQWNmdDBhS0hT?=
 =?utf-8?B?WUZtZFprUmVSWVkyUDVzUmwrWTZsanp1TzZscjROZlNlR3pMNXpXeXRsbnNj?=
 =?utf-8?B?MXJTYU9vOHNVNHExMXNYdlc2Z01pT3RHQXdja3JXVVRSdVdhVWZZSWlGUk5E?=
 =?utf-8?B?RFZlalNrUndpQ3lXN1RFSEJBTVB1WlNzeGM1ZUVESVF4a1J5R2t6N0VqNWIz?=
 =?utf-8?B?cXVEZ0U0MnVTb2F4ZUYySkVMUGthQ0Zvek1pc3gvbk5Hb0d3VFNaUjVDNzBO?=
 =?utf-8?B?VnZaZEJkS0RzcFNFbkNuNlJDRnJ2cCtjZVcxVWFjd1UvdXlsQldXMm0yU3pL?=
 =?utf-8?B?djMrQ04rTXZLVURCd2R5dlJCTHpJOE5jR0xVMG9xRkQ4Q3IvMmpSYkZJSGxV?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82df7ce4-c9c2-4ea8-d555-08dd1f70315d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 14:28:08.4036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rRb3WmpiwclgCoaujDtA0flFYpplxrVBEJboah20eZUaVSJMXozGANFIObiqYKjl8CL3rgkBecY6j3nUAFzsiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6951
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

--------------VTAcjvU0uAEWO3gGyCN4g046
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 12/18/2024 13:00, Marcin Bernatowicz wrote:
> Introduce functions to get and set SR-IOV provisioning quota and spare
> attributes. These functions provide access to shared resource attributes
> such as GGTT, LMEM, contexts, and doorbells for both PF and VF contexts.
>
> Add returning and asserting variants to allow flexible error handling
> based on usage scenarios.
>
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski<jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Michał Winiarski<michal.winiarski@intel.com>
> Cc: Narasimha C V<narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis<tomasz.lis@intel.com>
> ---
>   lib/xe/xe_sriov_provisioning.c | 124 +++++++++++++++++++++++++++++++++
>   lib/xe/xe_sriov_provisioning.h |  14 ++++
>   2 files changed, 138 insertions(+)
>
> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
> index 67ae9cf54..536121931 100644
> --- a/lib/xe/xe_sriov_provisioning.c
> +++ b/lib/xe/xe_sriov_provisioning.c
> @@ -9,6 +9,7 @@
>   #include "intel_chipset.h"
>   #include "linux_scaffold.h"
>   #include "xe/xe_mmio.h"
> +#include "xe/xe_sriov_debugfs.h"
>   #include "xe/xe_sriov_provisioning.h"
>   
>   /**
> @@ -150,3 +151,126 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
>   
>   	return 0;
>   }
> +
> +/**
> + * xe_sriov_shared_res_attr_name - Retrieve the attribute name for a shared resource
> + * @res: Shared resource type (see enum xe_sriov_shared_res)
> + * @vf_num: VF number (1-based) or 0 for PF
> + *
> + * Returns the attribute name corresponding to the specified
> + * shared resource type and VF number. For VF (vf_num > 0), the "quota"
> + * attribute name is returned (e.g., "contexts_quota"). For PF (vf_num == 0),
> + * the "spare" attribute name is returned (e.g., "contexts_spare").
> + *
> + * Return:
> + * The attribute name as a string if the resource type is valid.
> + * NULL if the resource type is invalid.
> + */
> +const char *xe_sriov_shared_res_attr_name(enum xe_sriov_shared_res res,
> +					  unsigned int vf_num)
> +{
> +	switch (res) {
> +	case XE_SRIOV_SHARED_RES_CONTEXTS:
> +		return vf_num ? "contexts_quota" : "contexts_spare";
> +	case XE_SRIOV_SHARED_RES_DOORBELLS:
> +		return vf_num ? "doorbells_quota" : "doorbells_spare";
> +	case XE_SRIOV_SHARED_RES_GGTT:
> +		return vf_num ? "ggtt_quota" : "ggtt_spare";
> +	case XE_SRIOV_SHARED_RES_LMEM:
> +		return vf_num ? "lmem_quota" : "lmem_spare";
> +	}
> +
> +	return NULL;
> +}
> +
> +/**
> + * __xe_sriov_pf_get_shared_res_attr - Read shared resource attribute
> + * @pf: PF device file descriptor
> + * @res: Shared resource type (see enum xe_sriov_shared_res)
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @value: Pointer to store the read attribute value
> + *
> + * Reads the specified shared resource attribute for the given PF device @pf,
> + * VF number @vf_num, and GT @gt_num. The attribute depends on @vf_num:
> + * - For VF (vf_num > 0), reads the "quota" attribute.
> + * - For PF (vf_num == 0), reads the "spare" attribute.
> + *
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int __xe_sriov_pf_get_shared_res_attr(int pf, enum xe_sriov_shared_res res,
> +				      unsigned int vf_num, unsigned int gt_num,
> +				      uint64_t *value)
> +{
> +	return __xe_sriov_pf_debugfs_get_u64(pf, vf_num, gt_num,
> +					     xe_sriov_shared_res_attr_name(res, vf_num),
> +					     value);
> +}
> +
> +/**
> + * xe_sriov_pf_get_shared_res_attr - Read shared resource attribute
> + * @pf: PF device file descriptor
> + * @res: Shared resource type (see enum xe_sriov_shared_res)
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + *
> + * A throwing version of __xe_sriov_pf_get_shared_res_attr().
> + * Instead of returning an error code, it returns the quota value and asserts
> + * in case of an error.
> + *
> + * Return: The value for the given shared resource attribute.
> + *         Asserts in case of failure.
> + */
> +uint64_t xe_sriov_pf_get_shared_res_attr(int pf, enum xe_sriov_shared_res res,
> +					 unsigned int vf_num,
> +					 unsigned int gt_num)
> +{
> +	uint64_t value;
> +
> +	igt_fail_on(__xe_sriov_pf_get_shared_res_attr(pf, res, vf_num, gt_num, &value));
> +
> +	return value;
> +}
> +
> +/**
> + * __xe_sriov_pf_set_shared_res_attr - Set a shared resource attribute
> + * @pf: PF device file descriptor
> + * @res: Shared resource type (see enum xe_sriov_shared_res)
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @value: Value to set for the shared resource attribute
> + *
> + * Sets the specified shared resource attribute for the given PF device @pf,
> + * VF number @vf_num, and GT @gt_num. The attribute depends on @vf_num:
> + * - For VF (vf_num > 0), reads the "quota" attribute.
> + * - For PF (vf_num == 0), reads the "spare" attribute.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int __xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
> +				      unsigned int vf_num, unsigned int gt_num,
> +				      uint64_t value)
> +{
> +	return __xe_sriov_pf_debugfs_set_u64(pf, vf_num, gt_num,
> +					     xe_sriov_shared_res_attr_name(res, vf_num),
> +					     value);
> +}
> +
> +/**
> + * xe_sriov_pf_set_shared_res_attr - Set the shared resource attribute value
> + * @pf: PF device file descriptor
> + * @res: Shared resource type (see enum xe_sriov_shared_res)
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @value: Value to set
> + *
> + * A throwing version of __xe_sriov_pf_set_shared_res_attr().
> + * Instead of returning an error code, it asserts in case of an error.
> + */
> +void xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
> +				     unsigned int vf_num, unsigned int gt_num,
> +				     uint64_t value)
> +{
> +	igt_fail_on(__xe_sriov_pf_set_shared_res_attr(pf, res, vf_num, gt_num, value));
> +}
> diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
> index aa2f08f52..168b50394 100644
> --- a/lib/xe/xe_sriov_provisioning.h
> +++ b/lib/xe/xe_sriov_provisioning.h
> @@ -46,5 +46,19 @@ const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res);
>   int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio *mmio,
>   					       struct xe_sriov_provisioned_range **ranges,
>   					       unsigned int *nr_ranges);
> +const char *xe_sriov_shared_res_attr_name(enum xe_sriov_shared_res res,
> +					  unsigned int vf_num);
> +int __xe_sriov_pf_get_shared_res_attr(int pf, enum xe_sriov_shared_res res,
> +				      unsigned int vf_num, unsigned int gt_num,
> +				      uint64_t *value);
> +uint64_t xe_sriov_pf_get_shared_res_attr(int pf, enum xe_sriov_shared_res res,
> +					 unsigned int vf_num,
> +					 unsigned int gt_num);
> +int __xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
> +				      unsigned int vf_num, unsigned int gt_num,
> +				      uint64_t value);
> +void xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
> +				     unsigned int vf_num, unsigned int gt_num,
> +				     uint64_t value);
>   
>   #endif /* __XE_SRIOV_PROVISIONING_H__ */

LGTM,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

--------------VTAcjvU0uAEWO3gGyCN4g046
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12/18/2024 13:00, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241218120056.779962-3-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">Introduce functions to get and set SR-IOV provisioning quota and spare
attributes. These functions provide access to shared resource attributes
such as GGTT, LMEM, contexts, and doorbells for both PF and VF contexts.

Add returning and asserting variants to allow flexible error handling
based on usage scenarios.

Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
Cc: Adam Miszczak <a class="moz-txt-link-rfc2396E" href="mailto:adam.miszczak@linux.intel.com">&lt;adam.miszczak@linux.intel.com&gt;</a>
Cc: Jakub Kolakowski <a class="moz-txt-link-rfc2396E" href="mailto:jakub1.kolakowski@intel.com">&lt;jakub1.kolakowski@intel.com&gt;</a>
Cc: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a>
Cc: Michał Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Michał Winiarski <a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>
Cc: Narasimha C V <a class="moz-txt-link-rfc2396E" href="mailto:narasimha.c.v@intel.com">&lt;narasimha.c.v@intel.com&gt;</a>
Cc: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
Cc: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 lib/xe/xe_sriov_provisioning.c | 124 +++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_provisioning.h |  14 ++++
 2 files changed, 138 insertions(+)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 67ae9cf54..536121931 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -9,6 +9,7 @@
 #include &quot;intel_chipset.h&quot;
 #include &quot;linux_scaffold.h&quot;
 #include &quot;xe/xe_mmio.h&quot;
+#include &quot;xe/xe_sriov_debugfs.h&quot;
 #include &quot;xe/xe_sriov_provisioning.h&quot;
 
 /**
@@ -150,3 +151,126 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
 
 	return 0;
 }
+
+/**
+ * xe_sriov_shared_res_attr_name - Retrieve the attribute name for a shared resource
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @vf_num: VF number (1-based) or 0 for PF
+ *
+ * Returns the attribute name corresponding to the specified
+ * shared resource type and VF number. For VF (vf_num &gt; 0), the &quot;quota&quot;
+ * attribute name is returned (e.g., &quot;contexts_quota&quot;). For PF (vf_num == 0),
+ * the &quot;spare&quot; attribute name is returned (e.g., &quot;contexts_spare&quot;).
+ *
+ * Return:
+ * The attribute name as a string if the resource type is valid.
+ * NULL if the resource type is invalid.
+ */
+const char *xe_sriov_shared_res_attr_name(enum xe_sriov_shared_res res,
+					  unsigned int vf_num)
+{
+	switch (res) {
+	case XE_SRIOV_SHARED_RES_CONTEXTS:
+		return vf_num ? &quot;contexts_quota&quot; : &quot;contexts_spare&quot;;
+	case XE_SRIOV_SHARED_RES_DOORBELLS:
+		return vf_num ? &quot;doorbells_quota&quot; : &quot;doorbells_spare&quot;;
+	case XE_SRIOV_SHARED_RES_GGTT:
+		return vf_num ? &quot;ggtt_quota&quot; : &quot;ggtt_spare&quot;;
+	case XE_SRIOV_SHARED_RES_LMEM:
+		return vf_num ? &quot;lmem_quota&quot; : &quot;lmem_spare&quot;;
+	}
+
+	return NULL;
+}
+
+/**
+ * __xe_sriov_pf_get_shared_res_attr - Read shared resource attribute
+ * @pf: PF device file descriptor
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Pointer to store the read attribute value
+ *
+ * Reads the specified shared resource attribute for the given PF device @pf,
+ * VF number @vf_num, and GT @gt_num. The attribute depends on @vf_num:
+ * - For VF (vf_num &gt; 0), reads the &quot;quota&quot; attribute.
+ * - For PF (vf_num == 0), reads the &quot;spare&quot; attribute.
+ *
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_pf_get_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+				      unsigned int vf_num, unsigned int gt_num,
+				      uint64_t *value)
+{
+	return __xe_sriov_pf_debugfs_get_u64(pf, vf_num, gt_num,
+					     xe_sriov_shared_res_attr_name(res, vf_num),
+					     value);
+}
+
+/**
+ * xe_sriov_pf_get_shared_res_attr - Read shared resource attribute
+ * @pf: PF device file descriptor
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ *
+ * A throwing version of __xe_sriov_pf_get_shared_res_attr().
+ * Instead of returning an error code, it returns the quota value and asserts
+ * in case of an error.
+ *
+ * Return: The value for the given shared resource attribute.
+ *         Asserts in case of failure.
+ */
+uint64_t xe_sriov_pf_get_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+					 unsigned int vf_num,
+					 unsigned int gt_num)
+{
+	uint64_t value;
+
+	igt_fail_on(__xe_sriov_pf_get_shared_res_attr(pf, res, vf_num, gt_num, &amp;value));
+
+	return value;
+}
+
+/**
+ * __xe_sriov_pf_set_shared_res_attr - Set a shared resource attribute
+ * @pf: PF device file descriptor
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Value to set for the shared resource attribute
+ *
+ * Sets the specified shared resource attribute for the given PF device @pf,
+ * VF number @vf_num, and GT @gt_num. The attribute depends on @vf_num:
+ * - For VF (vf_num &gt; 0), reads the &quot;quota&quot; attribute.
+ * - For PF (vf_num == 0), reads the &quot;spare&quot; attribute.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+				      unsigned int vf_num, unsigned int gt_num,
+				      uint64_t value)
+{
+	return __xe_sriov_pf_debugfs_set_u64(pf, vf_num, gt_num,
+					     xe_sriov_shared_res_attr_name(res, vf_num),
+					     value);
+}
+
+/**
+ * xe_sriov_pf_set_shared_res_attr - Set the shared resource attribute value
+ * @pf: PF device file descriptor
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Value to set
+ *
+ * A throwing version of __xe_sriov_pf_set_shared_res_attr().
+ * Instead of returning an error code, it asserts in case of an error.
+ */
+void xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+				     unsigned int vf_num, unsigned int gt_num,
+				     uint64_t value)
+{
+	igt_fail_on(__xe_sriov_pf_set_shared_res_attr(pf, res, vf_num, gt_num, value));
+}
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
index aa2f08f52..168b50394 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -46,5 +46,19 @@ const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res);
 int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio *mmio,
 					       struct xe_sriov_provisioned_range **ranges,
 					       unsigned int *nr_ranges);
+const char *xe_sriov_shared_res_attr_name(enum xe_sriov_shared_res res,
+					  unsigned int vf_num);
+int __xe_sriov_pf_get_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+				      unsigned int vf_num, unsigned int gt_num,
+				      uint64_t *value);
+uint64_t xe_sriov_pf_get_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+					 unsigned int vf_num,
+					 unsigned int gt_num);
+int __xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+				      unsigned int vf_num, unsigned int gt_num,
+				      uint64_t value);
+void xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+				     unsigned int vf_num, unsigned int gt_num,
+				     uint64_t value);
 
 #endif /* __XE_SRIOV_PROVISIONING_H__ */</pre>
    </blockquote>
    <br>
    LGTM,<br>
    Reviewed-by: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a><br>
    <br>
    <span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------VTAcjvU0uAEWO3gGyCN4g046--
