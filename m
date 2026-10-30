Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1170B606A33B
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 10:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DQfRPAsr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C6711271C;
	Fri, 30 Oct 2026 10:28:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D55112705
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 10:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793356037; x=1824892037;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e2hAEGqPe1JRMSddrsR0CERE/l4KOkxtH1m9PhmlPo0=;
 b=DQfRPAsrg+xhWh/9d0Cat4rF6slvf8EEVmyMuIPDf2Sbxh448ywFplSO
 PUjKcTx74mRDc6XtHJiq7XR5g7KPQrSUDoin2pWpWWuV1UqM3pXogTQHS
 w67pL47JMW3rtcjwmirKWrQtDG2w6vedVFnvaVAYhIP+n71N37PYU64L+
 fA4kwZYiuZsmFAM91VFKS8+7XWE2uQl/BeB0xaMCCMXVNuRaEHsyJ4GaZ
 r9Qs8GPr/+79HQEC9NzNBvttwPqK0r4S9q7qJdQocUEbrWZHuoDMbcp0J
 Yx6EaYHkIIlCphDFcUyrxWQHS24cuLQYfPcqxI88E5jgUmud/N0TFx0VX Q==;
X-CSE-ConnectionGUID: sRGZTSYnRdmxLZ4BSFNm3w==
X-CSE-MsgGUID: 1C4LIC1pTfCbT0tBtPYDOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2110028"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2110028"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 03:27:17 -0700
X-CSE-ConnectionGUID: jxhWWy2CTlCdlaO1F+58qg==
X-CSE-MsgGUID: RNMiNcbsR4q3/tLRl1cJ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5424439"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 03:27:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 03:27:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 03:27:16 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 03:27:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0VfQiEX2difTrXmoHBEXSxHRsd/r6YrEo/AFMKMXUUykohRgzwgPFBBjIG8mu9VMrM0baBzd+wOp/367RuLKbDI9b36gkagzRBTp0lmVgGE0Txes+xgZjSzYGd8jRJ5PpDuJT+2LsnLqOY5l3PNiflwFuehKbCdeKtUgUI+gMGLsWCW/VJr427Z34K++Hu6iZgHfXRuxO9MGBX6v7KkqQHT+sPoMcYhUETB2cGpU5q3i92aGLjR+LddYricU8LMFJ1Grf/vdl9cwEWa4BEERX61bSTfDD2cEUHjwn3V1L8R6eW/dozLu2L4g3QIfWYbn0dTKfa9rZnAROEZPMNmhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITtix3YjYsRJScqU+2ym3Fp7vXla9Doj96gECX/SjWo=;
 b=qokv7nvAV3QWaJP5DdbAMYDcpkGxgDNAyX1aWZ85zxj9Mc3wm4tSAIQGTktlnLX11fnUGh0NBF/7UXlyWD1IU23mBufXybNWij8MMGI/EbmXoVgWePm4MUxsVfyYPPjAOanrn2b/51BgKA+iBuT4CZ1C80cmGFLUBgFlUkXu2aiLn6qJYcyL5OBqssNBT8KIAE0G/oWOa0+zbG7VvmnSIEdg9GieqQd+9sAAFNWB5ev/s7u/vAzJz7yHThOWFdplorH1SInbgJKNoHMUJZHeK++/l3zV15BUWANkf7QHB7ALRUDSeXl7gubcmg8uNyyOXgU0P/eCdfFmvVM3g9R3rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by IA4PR11MB9105.namprd11.prod.outlook.com (2603:10b6:208:564::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:27:14 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:27:14 +0000
Message-ID: <e5b9f13f-b247-47b4-b177-bc39901f5b0d@intel.com>
Date: Fri, 30 Oct 2026 15:57:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/10] lib/igt_drm_ras_nl: add get_error_threshold
 command support
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <mallesh.koujalagi@intel.com>,
 <harish.chegondi@intel.com>, <kamil.konieczny@linux.intel.com>
References: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
 <20261029085955.1232163-6-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261029085955.1232163-6-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0205.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::14) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|IA4PR11MB9105:EE_
X-MS-Office365-Filtering-Correlation-Id: 21c72477-4bde-4736-5eb1-08df36705d59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|6133799003|18002099003|22082099003|56012099006|11063799006|261022105027099003|10067099003|261021123027099003|261021121427099003|4143699003|261009223027099003|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: iWYH2ZC6jBdRACcScvLPbSYVBdHofwa01v7tPEeKeqDxnHq9UZq9sROIx/GByKgcHS2Rkt0h5cgF4KgtT4zJVce96oskBTRV9eOniBbqXaGEm41y8ksk+ZTW7mar7oLCTG2CmhBYocUFD1DXTC5QwC1pVaXYqlqFeeDJ+GlrMWuvhyDuGJmjk1AhCSVOx/Z7uwL0AuVep9EqNdUPOBtRtjY6IH5WCn97fr061gNX1v0S7llO9Ll5wJF2jkj0OFF7fqVmTVaGruW6kGjOox8WWdMWKT4tIEDtMbnYpp5OwMbUIZKpGeFD5J+dJL6HxryurmcaAxXxFMu+DFHW7g1wY2XEwpli0jsqfxtPER/7b27CKpwj1CiZpcMRPKDHJWbQ2bP1erC0VPUXNrWJOsppQvA2rFIl00t7baGPtAb7iXH0fddQeIkbftnk02eYy1oXnnCihoSSIOulvT0p0HyNXG49aTuXado/1r31LVlfnQJTeQjxPoIXNVjrTewyDUJFZYEsujnqcMBUFaxnAr2OQ7MW95T48XtGLiXI1dkiSswNA69h8Qnix0EUSKh98jSEkzM2zS45J3NDWqSn7q5b1G3HTGrSll2o8PoBqxUgktJX/KyzCHeDxgvQWzCu5EfB8boUNfPkOICE6kkwX2dSsTzUScjXWaO3npe0KjrFsS0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(261022105027099003)(10067099003)(261021123027099003)(261021121427099003)(4143699003)(261009223027099003)(261028144727099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnhkZ2l4bm5BN1JPWGt1Qjh2ckgrQldsS2FDdzdEcUJhN1FTU0Y0S1kyMk1E?=
 =?utf-8?B?bE5sT3M0K1NBNUxMcHFuSVUwcjJVbUxCUzYrZWtsdDQrMm9mWUgrWlFFdVNT?=
 =?utf-8?B?WldIWVNKZHVWbE9WYzFwK0k5alIwdW1iQzdXRlBVQ292SHpmeUdvd0FJcFk4?=
 =?utf-8?B?K0EyRHVTZmgzTVNudkJHWkY2QnF2aHhIcFNVWUpBNHZkTlgwNE1RamFQbE95?=
 =?utf-8?B?bklOUkNNMDVGQW1YdEpITnNaMzNrYitZTzFVK1RNMk5XS1QwRldDOTI3WHpx?=
 =?utf-8?B?SzVKay9OMmZyUjBHS05zTnNlTVNWZEJPdXRXRkJRL1d4cTE5RnBTQ1JIRXlD?=
 =?utf-8?B?RXR3MEZYajV6ZDF6emN2SklFeUV6N0FCNnViSmRBTW5uUU9TOHV4OGRSVW5B?=
 =?utf-8?B?bFc3dEptQ1NiTGlmMklnN0FsUit1R0VJeWRoNTZmbmV4Zm1kczYvNExDSllz?=
 =?utf-8?B?ZGcyU2J6V2RNK2JMcUttTTEyTDBIN0oydE11UTlTSllvYVBPcnl1ejA4RFRN?=
 =?utf-8?B?RFI4SUJaT1gzOGRYMnAxS0pIMCtuaXU0S2FZUHMwLzQ4K0lMV3dpYkJsb0pV?=
 =?utf-8?B?blE3c3ZlVDZjMGw5UTVRTkRrQTV1ZitPRFVnTEFiYit6azdTMGQ1QVd0QWZs?=
 =?utf-8?B?WHJqTm00RkFHZmZPOHVmNmttZ1dMQkFpL3FTNlFZSndSZlpZRjA1d25Tak5G?=
 =?utf-8?B?bjRTVVNLZnNtL3hoY2drV1E4WVRlMXNMMFUwTkRhLzl4aUVxTTFMNXFqYkt6?=
 =?utf-8?B?RENCN2YvUGZIZEIrRmFKSGhIQkdNNnJBaks4QU9VQWdJckRjN05oelVZRmRW?=
 =?utf-8?B?cHRhWGRvKzRSd3hDMDE2aC9pY2EraEYwZ2M2bW9zaVB4ckd0eE96dGJreDBE?=
 =?utf-8?B?U2RvL2tKVnlTWmVXaXVpVWY4YWZRT3ZOaU12N0hKMkxyY2hiMExIZ2RQZThi?=
 =?utf-8?B?M1NGSXozL3RDYkozb29nc3VLMnRqVTZkRFJpdFhITUYzQW9xeEtPMWxzb0NW?=
 =?utf-8?B?NGM4SlRxR2E3YnVCZkZVT3VZT1ArMlhVM1gvUGRxY1o3amlqZTRxME5SeUFX?=
 =?utf-8?B?MWVmTGJoZjVvdkQrZG5MankxdjhrQldBd0YzMVl3WGJlSFlIdW9VOVBwRkM0?=
 =?utf-8?B?SjZkWkgrL21KNW1FZ2hqS1p2dEtDbDM3RVlnTGwwUmQvTk5oVUM2WHpKdzZR?=
 =?utf-8?B?ZVQvMnEvUHROZElKU1VKZU4vQkY2OWVCSmdUUUpUWVp4MFZjUU9BcnlQSC8y?=
 =?utf-8?B?S0lQdE1HU29DSGw2SHd6ZFF1RkVyVEJsd0V3NDVZV2RiQTR0eGJqZE82UFVV?=
 =?utf-8?B?MjA5b0lMWkdtZFFQS2xIYkNPcFVHL200QXBRdkNGNUU0SUhYTWRuRUdxL0dx?=
 =?utf-8?B?dkFiZ1R4Q2t3dklXQWNtRCtpMHAwTjQ1dks4VjRyQ1lwUDRGakhiUVRqTzd3?=
 =?utf-8?B?TlBoNG1OSTkzZFVMVm9vbGlJVERYbFRpNjg5b3BiV2tJZEIxckhWbXZzOVBP?=
 =?utf-8?B?aW9nSFg3QjJlZktlR01lOS9CdzdYT3NTakJZV245d3FpTlp5NWZMTk4vUkYr?=
 =?utf-8?B?bTBFdTJrV0djekdaSzlMRGM0QjZrbndnZ3ZqaE1kb0xOMTBBUzc2T2dCa085?=
 =?utf-8?B?NkFIOFFPOW1ucmhEYWcwbm9tOWF6ZEpjYmY1aVVkWHQrMWFTMzJoMDk4anNY?=
 =?utf-8?B?a3dubEtvN0NKYTQvcmFHNUFHMGNwTFhqTmdYcWZ0aHloZWxVKzFxc0daejdI?=
 =?utf-8?B?bThXQlovM2xIUFNQRzMyTVNLM0VWNzJEUGRYYmJ4MUJLUXUzK0RUdUNFeGlP?=
 =?utf-8?B?MVQvMmVoUSt3QzRNaUpCVllHbnQ1aGgybW1jQkF0a2xTM0xzZjNOQjZkdHhu?=
 =?utf-8?B?NGhXaE9GUEpqUU9QYTM1SEVHc29DWlBwTzFzVXBUZytZa0FZNDlRamV3aGtC?=
 =?utf-8?B?ZGFSN2lxODIwYWIyeXRpR242V0F4UE9ldkRLUW03dEpRb0lwYmJKVHFhUzMz?=
 =?utf-8?B?cUZ0ZlVZUEpzVUt1UmdaS0JDWEI3ZW55NjNtQkhRZDJyOVd4V0wzWGtDRldo?=
 =?utf-8?B?M1dwRnlWU3NLRlVPWkR2Sm1kT09QQTRoVVgrb0NpQ1U4a1FBWjZXMVlSMUlw?=
 =?utf-8?B?cnByQm1aZ1o1ZVQyNXd5VlhCL204dG9DdVpQTDhocitocGJnYnd4Z1VXRTF3?=
 =?utf-8?B?QStNQkZySjZDWlFGdnI0WHpyUXppUXJJMzhuYzlDWXhPaGg3Tnpna3dVTlhv?=
 =?utf-8?B?UVZremlHWUgxQm04Z0U4S3JxZVcxdERJdXBldi9qQXl4bE5FMERaYWlwdUFF?=
 =?utf-8?B?Z1UxWXZjZUxvRVU1dU56ZjdMQXc0TnFvcHp6RklLdnRoREZLa2dWdz09?=
X-Exchange-RoutingPolicyChecked: 4ru71fmcmzxGqjAOaM/y4F1QEbRM82HG4ZnMLp2oervgZEQF37fZLdgIO6Tc8+trpA7Fpm5y4yZ6Uj4rt1vRgSDB1VGPurJ4hamI1R8n25rjItb/bgyMka6qZekiCxgFLJru4c6tW8BR86prf3tsQcg5u6Na4omYc++aTplloT03Mfh1S/WZvv0AuwrOtBPB6ILBqK9NyER4OF0GveP0bY/4wGhIJTpqxcc6UZmPeE88plYXCYoX32WoKOWDlqE3BtjIRReFiXi86LJ3eujZllD85uxErweXvFj4pgCTm7krUTgH7xFPJuGjX3zd69ZHOfqKsXxqH23mp3oui7VCuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c72477-4bde-4736-5eb1-08df36705d59
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:27:14.3290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBMx6CRLBxn8yT2GhMfl5+IqQqst+AIbysM9P+9NQdMO+BJQk2wp19ev1In/jz/aSrxPdywG9pz3STemwmXIjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9105
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ravi,

On 29-10-2026 14:29, Ravi Kishore Koppuravuri wrote:
> Add support for GET_ERROR_THRESHOLD to fetch the current value of error
> threshold
>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v6:Removed normalize_nl_error() for standard errno in igt_drm_ras_nl_get_error_threshold()
> v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
>     Jani & Kamil)
> v2:Added a check whether error_threshold updated by valid callback or not
> ---
>   lib/igt_drm_ras_nl.c | 52 +++++++++++++++++++++++++++++++++++++++++---
>   lib/igt_drm_ras_nl.h |  4 ++++
>   2 files changed, 53 insertions(+), 3 deletions(-)
>
> diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
> index 7e6a61f11..d930b6e33 100644
> --- a/lib/igt_drm_ras_nl.c
> +++ b/lib/igt_drm_ras_nl.c
> @@ -75,6 +75,14 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
>   		ctx->error_value = nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
>   		break;
>   	}
> +	case DRM_RAS_CMD_GET_ERROR_THRESHOLD: {
> +		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD])
> +			return NL_SKIP;
> +
> +		ctx->error_threshold =
> +			nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]);
> +		break;
> +	}
>   	default:
>   		return NL_SKIP;
>   	}
> @@ -230,6 +238,7 @@ static int send_command(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
>   	}
>   
>   	switch (cmd) {
> +	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
>   	case DRM_RAS_CMD_GET_ERROR_COUNTER:
>   		ctx->response_required = true;
>   		ret = nla_put_u32(msg,
> @@ -280,6 +289,7 @@ static void reset_drm_ras_nl_context(struct igt_drm_ras_nl_context *ctx)
>   	ctx->reply_received = false;
>   	ctx->ack_received = false;
>   	ctx->response_required = false;
> +	ctx->error_threshold = 0;
>   	ctx->family_id = -1;
>   }
>   
> @@ -326,10 +336,8 @@ int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx)
>   	return 0;
>   }
>   
> -int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx)
> +static int validate_inputs(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
>   {
> -	int ret;
> -
>   	if (!ctx || !ctx->sock || ctx->family_id < 0) {
>   		igt_warn("Invalid DRM RAS netlink context\n");
>   		return -EINVAL;
> @@ -343,6 +351,17 @@ int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx)
>   		return -EINVAL;
>   	}
>   
> +	return 0;
> +}
> +
> +int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx)
> +{
> +	int ret;
> +
> +	ret = validate_inputs(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
> +	if (ret < 0)
> +		return ret;
> +
>   	ctx->error_value = UINT32_MAX;
>   
>   	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
> @@ -361,3 +380,30 @@ int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx)
>   
>   	return 0;
>   }
> +
> +int igt_drm_ras_nl_get_error_threshold(struct igt_drm_ras_nl_context *ctx)
> +{
> +	int ret;
> +
> +	ret = validate_inputs(ctx, DRM_RAS_CMD_GET_ERROR_THRESHOLD);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->error_threshold = UINT32_MAX;
Could be initialized to 0 as Valid threshold are as 1..16

Apart from this all LGTM
Reviewed-by: Soham Purkait <soham.purkait@intel.com>

Regards,
Soham
> +
> +	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_THRESHOLD);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ctx->error_threshold == UINT32_MAX) {
> +		igt_warn("No valid error threshold reply: node_id=%u error_id=%u kernel_error=%d\n",
> +			 ctx->node_id, ctx->error_id, ctx->last_nl_error);
> +
> +		return ctx->last_nl_error ? ctx->last_nl_error : -ENODATA;
> +	}
> +
> +	igt_debug("Retrieved error threshold: node_id=%u error_id=%u threshold=%u\n",
> +		  ctx->node_id, ctx->error_id, ctx->error_threshold);
> +
> +	return 0;
> +}
> diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
> index f51784524..86cfd79d0 100644
> --- a/lib/igt_drm_ras_nl.h
> +++ b/lib/igt_drm_ras_nl.h
> @@ -44,11 +44,15 @@ struct igt_drm_ras_nl_context {
>   
>   	/** @family_id: Generic netlink family ID */
>   	int family_id;
> +
> +	/** @error_threshold: Error threshold value to query/set */
> +	uint32_t error_threshold;
>   };
>   
>   void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
>   int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
>   int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx);
> +int igt_drm_ras_nl_get_error_threshold(struct igt_drm_ras_nl_context *ctx);
>   
>   #endif /* IGT_DRM_RAS_NL_H */
>   
