Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5950FC7115B
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 08:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F38410E861;
	Thu, 26 Jun 2025 08:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T3Tfb7hG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF4F10E861
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 08:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750927221; x=1782463221;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WU0kcGDR2IiYNF5OA9p1jbxlVzgJSqYZd3uWrEHkZ6Q=;
 b=T3Tfb7hGtdjAJJJoeqcwLin/oNGo1ihEqaifMQcx2g5EKXlj+d8ptu5N
 +L5c9Z2UkouC/jg7Ng443XMSDTmM6lCDrWwfEzuNuye9ICMlfeOFhXodU
 uktF5r1ojmCIKZLsWpt8LPT5qDXgzRbteCrPf4McOWzAG+JEjIsAzj+L6
 CMzyN6evZazmUowTXQtUmFmZuKXOXOONsk4+cg7kJ2FtRl4nU8sDSX8bb
 YZxUWHYYAfdftM46Ci2fJ5aKwONDnwr62gwmhX3a93IdHxULoox149/UV
 fwO53E6aXTkKafmRaNGJnFinzBMnttvUkdtRpp3HdWG2zWg/37IOwmKKQ g==;
X-CSE-ConnectionGUID: gBRzXUnnQee5lv24WvqnSA==
X-CSE-MsgGUID: kJSDbkq4RCigqUJd1Dlacg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52441789"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="52441789"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 01:40:20 -0700
X-CSE-ConnectionGUID: zTJ5IpNZQ/GQfpd4C6E9HA==
X-CSE-MsgGUID: 60OqyRahQeKAHyJYksggNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="157947861"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 01:40:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 01:40:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 01:40:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.41)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 01:40:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XodNOa3W7mQJvhcTUCWGxkgfsxPUYsD7Tf3xM4ScsVXYiSUUw5dyBUlbR3XmalWCBGj622Jn0kVKPNg8IPkzdPRyT0QD35F0dTc7MXGikzwdPHmQSQQUkSxk8Q/pG4Qh70Ec7bev2hQ/e2swgtVMUzaikGxXBYNORoEqLRmvFKSY/PyIVh2oe6WLbllF2NIYwj6vXZelYvzlKlngNwo+Y7J+r6k1zxiWmeQfTFEoGf6DgJDjGghDPQaCEcCySS4t+87VZLCI2+sKKdG4JsALa3yxYXPd1HpcHBaTIw0IOyIVoEuHzl1tc01ZRb2jfHn23zZt1BNlFVRuAIitlLGgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TF6L0rGkAfeTciegZno2Kww4NG0IbxX9SxCe8gw0w8=;
 b=W3YcTAHvWo1a0/hgscjsE/IDtpTxoAIjiTUfZ1wPAcxkdM8d7mQfBMzFWY7T5lcolDiLIl57NIU/Fwz5ewOUaIb+CTt3NMHMgwzmfxn82WuI/q8DKfzmAjMAn25OgmgyIMvgdnGe74D2veCISUpeWkTCdDSr/aofVMGvc7JlfGfHEPg4q8qBlGK+ahuwaymj5lpjFh3lHPHUNJLC4nA0hPUzg//yFb46lHfZuLoSg/+CY9tyu9u11+LAay82+ngSvyVvjVsRYTVUBbiEzyk62C9CLIJxMD9VLouEY0x32Av7fGM7CU2z9PHmpXZAG1zBlUBhU+l3uZsfih4TWbMu1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CH3PR11MB8519.namprd11.prod.outlook.com (2603:10b6:610:1ba::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 08:40:03 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 08:40:02 +0000
Message-ID: <98357559-5d0c-465c-a00d-6b7d4058caf4@intel.com>
Date: Thu, 26 Jun 2025 14:09:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v15 2/5] tests/kms_async_flips: use in_formats_async
 for async modifiers
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>, <chaitanya.kumar.borah@intel.com>
References: <20250623110918.606014-1-santhosh.reddy.guddati@intel.com>
 <20250623110918.606014-3-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250623110918.606014-3-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CH3PR11MB8519:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a4d3e1-4740-4550-b805-08ddb48d0afe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akpVV3NrY3FkamdCcVJjRFcrNm80S0JEMGVkc3Q4R2ljUjB3SFVFVmc5ZzJV?=
 =?utf-8?B?VlV0K3c2RURpdEx4Ry8vUHRkVlBON2NPb1JXLzYvSFJPeGJRZGhhWk5na2pW?=
 =?utf-8?B?UkxwRitIanFiUld4VFd1TjlqcVU2YlBSWGtFVThJTG51Y0xsR1FFS1JUb21a?=
 =?utf-8?B?RE1tY3llbDN0OG40SEZzaG5kdzMvYXFnZ3VXNGV5b2ZhYVliZStYL3ZnNkRl?=
 =?utf-8?B?aU5FTWlKYk5oL2ppRWY4anlVWVZmN29BZzh3UHhMR3NIUVRzTzhobG1WUzNm?=
 =?utf-8?B?ejI4WnlPbWZ5ZWpVSDYxSXV5QmkzUWpyR1k1ZktZb3dDN015TFh2WWNvSW9p?=
 =?utf-8?B?ejBtUkluQk9kQmthWFBXZ0x2dDZqWmxPc2hZajhiSi8vKzBIMVAxY002cG1y?=
 =?utf-8?B?bVdxK3FITGhXaXpKYUNmV0xLVm9yT002bnowQVN1TXFrSHN3bW9RaTkwdFJO?=
 =?utf-8?B?V0U5ZVJwaG53S2sySUp1K3dqT0NtS2Z5dUx4bjF3QTRtL05MRGxkWGh6Um93?=
 =?utf-8?B?V3FqOHNucWFUTGl6TUpvQjV0cnJvYjhKU1IrUkZsVDFlekVkQzNmbXlid1Ix?=
 =?utf-8?B?SEdxZWVRQXVPUXAwdTYrd05VSGZHK24zNzdKbHduT0plZUE1dDFpZTBRYWdl?=
 =?utf-8?B?N2IxS3JmbXJHSUIzZGpTMllvT1VIOXR3eHNmS2hVTGpuVm44S1d5UzNTckEv?=
 =?utf-8?B?aHE1VmpEdkNPTmU3MTllT1IwTElqcW9lMTJMYVZFeW1RWmlQaU1TY0FRMm91?=
 =?utf-8?B?UTNYVGQ1WHMxekxjaTNpR3JNR2duSjlKbVJYK2FmOFliYXptVExJN3BDalZm?=
 =?utf-8?B?RjZDOG5oYkVPbVR3aUtNd3pGTEVianBJM3F3U0pVNUpxMEhPYk93VkNmUFhJ?=
 =?utf-8?B?Tm9IblVDV3hhT0lIbkQwNTZFZEl0djRZN3JkY2g1dSs3azBSbzRHK0djUHBJ?=
 =?utf-8?B?RVYrdGJSYWNuS2piTVdhbXBOL1c5WFQyMS9SZi9QdEVJU3FEOW0zM1VLUU5U?=
 =?utf-8?B?TnNpYnFnbGtGU1VjYkhHbTJKRXZBNS9oRlN5OGJ4WUg1Y0NzYTdCSm8vT0Jv?=
 =?utf-8?B?dGhMT2paWWg4aFZ6cnBETGhqb3FxcmlQZFFOeHRaWUJSVitaNENISFNWMUpI?=
 =?utf-8?B?WHh6R2ZrcFNGNUdxK2NDUFk2Zll4dkg3d254RWdRTnZMR3d1NTV1UldXR281?=
 =?utf-8?B?bEVSODdxV05YMkxWS1VTWWFWK2I5cnlsMVoxd2lZRHhRdVRFc0xxRFc5d0tt?=
 =?utf-8?B?TkNVNUtuYWRiVVBrNGlvRjlRejdiM2o2YW1oSUhIUisyeGI4NnBES2JqRmdo?=
 =?utf-8?B?TVZJdGJtV1NMeEdkT2xLKzZsTVJiTXdmS3NKdGg0dVQ3OThKOE9YN0plSFls?=
 =?utf-8?B?NkFjMGtCejAwc3h0d2dkOTh5UGRrdjJKMUZ4aUdERzBDS1VSdWhURUxnSitr?=
 =?utf-8?B?WjZ5dml2a3BUT2EzdDRwQ2EzdTRSVmtlQ28zNGtWTHV0WEllWVk5V2tuWTFW?=
 =?utf-8?B?RG9rWFpvYmRXUGxpcHNqcTllcmYrdjE2M1FGcGVRZUNmQlpmUHAzcU1WWGVr?=
 =?utf-8?B?ZGVIR2RET3IyaWV4WFJ1OXJNalVRTEFWWUtMVVdLWVdlcU8rZWFGWk1HNEUv?=
 =?utf-8?B?bFNRL24rblc2djFhbjg3elRRT2o2R00wRVhTblFKNDdwd3piKzdqMHE3OTRW?=
 =?utf-8?B?dEN5cmlMcERKVXdha041bnBHWDJCSGk1TGZHTWpTNVJ3cTdDR0w1d283a1Vr?=
 =?utf-8?B?VEU2RUZicnZmYWZmdkdKRHNlQ2MzMUhnM0MyRkIwVmtQWkRlbmxXQWkvMjMx?=
 =?utf-8?B?ODgvVWJXSVpEVnZpMldFUHhMZ0J1eUM3cVpNTXA1bHFzM2dOaXp2WjBSaThz?=
 =?utf-8?B?T0JTV3hBclZzNm9HSEZicUUwTEw5SWNQOWs4RXF1dUt6RmdCclBlTnY0M0dO?=
 =?utf-8?Q?0eS16kC6jxY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUtuVUpNSEhJamJrMmF4QjR2bEtDbEVLMDdwcGFscXk2djlBMlpaV2RQeVhu?=
 =?utf-8?B?SUtxZ0l2ZHFCK240akpQS3VjY284Wm5LYmNwdlFjRUpRODBuaG9zQUJhZlFH?=
 =?utf-8?B?WXVreU9iQ2kya3BVbk9LZno2eVloaCtpcW5kdm1kWmljWTJoZk42dENzajNx?=
 =?utf-8?B?dkdyT2IxVnRNOWJhQnVMSXFzVVNJRVRONWZ4QzliSEZkZm1aMDQ1UDY1amFn?=
 =?utf-8?B?SzliTEgwNjZkMkYvYlVHZU90VXhmY0RpZjlRZ1pyeEdrNXVRT2FvOFhHd0FZ?=
 =?utf-8?B?Y09wWkpmeG5rZlRkbE5xRlpoOGdoYVA3MGRZbUxYMGRtcll6S3JJMHJZNXRE?=
 =?utf-8?B?VUpYdG9pZ3d3bEl3bzhnY2JFMUxlYnZVcy95bS9zN2YxOUVVYkViZmtMNzBa?=
 =?utf-8?B?QmJlSkxvV0I3cXNhSTFmVTh1cWRFbmtqTlU5OUR6aFZCTXRZdlk0d3lUNEVL?=
 =?utf-8?B?a2ducUZqMUZFakRLZzlJcEZkajBBZkphSHBCUC9PL3lpSXZhTkt2Qk1qTEZw?=
 =?utf-8?B?aTJ3Z1NFdlJlRzhzd3gwRUxteDVuWVd0bHV2NlJlZFh3RnZyTzVmWWk5cGtH?=
 =?utf-8?B?bGRHNzhkRVo0Q2NYRG15b1lpekZSNHoyTHc2Tlp6dXRlMGoyOFRBdmlJV2dw?=
 =?utf-8?B?dVEzRld1SUhHRmdNTGNOZTdMaVBZenlFK3BLTFEvZjgveUt3aTlSRGZxZmww?=
 =?utf-8?B?RVQydVhqTFExVW5TN1lwVzRvOFNlTTFWM1BCZXlPQlRLSWJYVFZ6emV5YXVE?=
 =?utf-8?B?ZjZYTVZDblgvNVpwVGkzU3N3ZzlCc1dXNDNsYXVDdU1HMXRYeXNHWURWTDFF?=
 =?utf-8?B?K1pzNThhaWN0cEVjZU9OZ3dvQUoyODlIZW1ici9KV0JSZ0lhRmdqdkFaZlh4?=
 =?utf-8?B?ZHpMeHhCTFdnUmxmby9XcXVRRUMzSTFwdTFGL1ppSndnR0NOR24zVFB2dDl5?=
 =?utf-8?B?ZjE3cEVWSmhSazlRMHBnYTBOVTU2cWVrZkdrMG02a0V4d2pQbmIvSHF5MXFY?=
 =?utf-8?B?Q1EvTzB4ZXowK2FQYy9PcWorSEZZRUJYa3NsdlRIaUw5cjVoQWxnbjVQMEJQ?=
 =?utf-8?B?MVEyenYvNEFtOEkzdU00dTdHcS9oV2I0Z0ZFOSsyVCtaUDhPdUhWNnQra2E3?=
 =?utf-8?B?R0FFT2JTbHc5OFRmckZ4Ni9IVVhjYWJ1a1ZuWklKVE1YcGVhK043MWdVUVJS?=
 =?utf-8?B?UnZBVEhoTW1NL3JyQVJ1M0cxWXZvbFFoTXlxZWlzUkpMNFJ3MHpmYVlFMTZB?=
 =?utf-8?B?Z0lMK1hLQzZwaU4yWis4TTBCSDVzOU1qeUdHdG1ac1RMcnVOU0Q3ckhQV0JR?=
 =?utf-8?B?bEU1OVpuemdjMGNibzVzQ0I2ZndPVFRtaWtJTnBqMW14MTkrK3d3VVlMbnRQ?=
 =?utf-8?B?Mjh2Nm5qOVRxWE13cjhwVkQvWis2WGtiQUZHcGFodW5MdzZRTUdMcktTR21O?=
 =?utf-8?B?QUlrRnI3R1I1ODdIWk5UQ0JoSWZNUDB2UWJaLzFFdWVPRXVUU085SWc1VXZ3?=
 =?utf-8?B?ZWViVjRHMkNRaU9KTitqT05reG16RlFBNTVEQ0FWQXlYWVRXbjBQRUVaTGZF?=
 =?utf-8?B?cXcyUnZhU1FSWWhVNk56eHJmbUF1NGFTNnhLUjF2NFpyZ0FsUWE2RERhblZL?=
 =?utf-8?B?OU5tN1YwTHdLanZnUG1oUWpOZktKR2tIWDRjVzUwL0xyTmd3M2dBUDFaaXVv?=
 =?utf-8?B?M1Z0cEU1VGtZYk1vN2JUNmFyNFdQclNqQk42K21LZnh0Y2hCNW1ISXJlWlBx?=
 =?utf-8?B?N2FJQ2hWTXV4WG5zZVZ6cndXWU5tQWJLMG9lZ0NwT0Q5TUpRVCtTdS9udzA4?=
 =?utf-8?B?UEFsMU5oWkZOdnQ3b3FNcmM5Y2lSNjFRUGdqbyt6ZUwxNXBtRmhBcDhwMUsz?=
 =?utf-8?B?TFNDRVB3bjluVjJNQWluWE9RdXZJTmdNNEZ4ckVFNEZkQzN6WlF2Z2lTTmdq?=
 =?utf-8?B?QmQ2RjVkWlVuamtQN0ZXWXhGQTZnTzlMdExMd1lPMk04dDBEa2RsbjdnVkFp?=
 =?utf-8?B?YXlXREhsL1VydHc1WDlyeG9VWDRDeHBRRlI5ZUZwcnE5Q29qbS81N2ljNXEv?=
 =?utf-8?B?Z1RyemZxajFaM0E2WXVMbjBDZWlPeEl1azZya3E1ZC9SanR2d0RHaTBqNmRW?=
 =?utf-8?Q?KVDs5LCcR+3ssi8LQt7ZLRRF9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a4d3e1-4740-4550-b805-08ddb48d0afe
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 08:40:02.7938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kHfj/cDrFLO/3zAvAKOo+GKRHdgXkwVB8PwWqs4UE0lyb9LrdePAYI4NRT1ccISc/EuBnv+g+vSPK839GNLvKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8519
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

Hi Santhosh,

On 6/23/2025 4:39 PM, Santhosh Reddy Guddati wrote:
> Utilise IN_FORMATS_ASYNC property exposed to get the list of
> async supported modifier/format pair and improve the test coverage by
> iterating through all the supported modifiers with XRGB8888 format.
>
> V2: Improve run_test_with_modifiers to set data formats based on async
>      formats.
>      Update make_fb to use data formats instead of hard coded format
>
> V3: Update commit message, remove complicated iterations (Chaitanya)
>
> V4: Reduce the format+modifier combinations to reduce time needed to
>      execute the tests. (Chaitanya)
>
> V5: Remove unnecessary check for reduced formats. (Chaitanya)
>
> V6: Introduce new test for all formats and modifiers, executing only one
>      flip to reduce overall time.
>      Update test_with_modifiers to use async modifiers and formats X8888.
>
> V7: split the newly added subtest to separate commit and add condition
>      to skip the test if async format modifiers are not available. Also
>      remove data->fail as it is not needed with the new support (Chaitanya)
>
> v8: Refactor and clean up code.
>
> v9: Fix missing modifier assignment. (Introducd with rebase)
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   tests/kms_async_flips.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 065ac9c49..bf14a1a93 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -436,6 +436,7 @@ static void test_async_flip(data_t *data)
>   			data->suspend_resume = false;
>   			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
>   		}
> +
>   		frame++;
>   	} while (diff.tv_sec < RUN_TIME);
>   
> @@ -815,8 +816,11 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>   	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
>   		test_init(data);
>   
> -		for (int i = 0; i < data->plane->format_mod_count; i++) {
> -			uint64_t modifier = data->plane->modifiers[i];
> +		igt_assert_f(data->plane->async_format_mod_count > 0,
> +			     "No async format/modifier supported\n");

This should be a skip instead of an assert IMHO, although this would 
only be hit on older platforms that don't support async flips.

With this updated,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

Regards,
Karthik.B.S
> +
> +		for (int i = 0; i < data->plane->async_format_mod_count; i++) {
> +			uint64_t modifier = data->plane->async_modifiers[i];
>   
>   			if (data->plane->formats[i] != DRM_FORMAT_XRGB8888)
>   				continue;
> @@ -824,7 +828,6 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>   			if (modifier == DRM_FORMAT_MOD_LINEAR)
>   				continue;
>   
> -			data->allow_fail = true;
>   			data->modifier = modifier;
>   
>   			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
