Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D59ACEACEF
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 14:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7AE10E16F;
	Mon, 17 Nov 2025 14:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MEwI32Ju";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA91110E16F
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 14:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763391443; x=1794927443;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=ysiU7TqDuH0nwoObGIkfROje5PRo/BnQeXg9LHJA+0o=;
 b=MEwI32Juw+tMqcoBV601scVvu9TfriC1Av9h0aNHfvWv8JUt+F1w4LgA
 gxYZcKXoIVv6Nax/f1lp7vGCqm9kkjy/K8xY7vm3Rd4WsGRo9+MQmzyrq
 7R23wkBBlap5Ycz+8LToJQ5iPO5Y883m5zBgTHrir7fe+zOjllvs+VWFJ
 yZX3y7bHyxQZIyx6WsHw8JYyZxsSvlIKgnoNqZNurqC1Wn52SM1R87ZHN
 8sgtdA9ynaWTxAj1S0jn/kwpuSRhd3pnYGxGG5TJ98EmmVYW/nTUQb92H
 ipNVf1xsJE+5Hhhqr9P8FU/k2/khw4RLku0I0i65LnR7IgVfTHip8+Gq8 w==;
X-CSE-ConnectionGUID: xzuZsTphSQWwgZ9H1/dwnA==
X-CSE-MsgGUID: GxGk3hPtQJCNAnqBwR7dQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65430561"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="65430561"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 06:57:22 -0800
X-CSE-ConnectionGUID: KhmXUSzDQWaF7p5s4TrxOw==
X-CSE-MsgGUID: QZbiZacaThOncNnekdNmLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="189763571"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 06:57:23 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 06:57:21 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 06:57:21 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.32)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 06:57:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNDtwOfeOJfy9nc+8rywxjgUcLzFk/rZFQ8cdLL3wYxEYTlobPgGtnJrk4JmsuwGKBdSTJXtpJI40SlTx6TX+EOlRt79FXSPm1pNJ5yVnlHGfgljPqD6Nelh1juLKJ5oCGJVsFXZ3BqYTUt17qIV0+NmRSSEKZEmrBPmOo8B3NxyAkXQjJLj7YaYWgW9oPVVyMPWDronwqlyd2nsSggFJCS2QA12oTfiaFFNZ4v8dgdFPaVrIWud8o3v2ISzq4E8cgIj4GzavMrnh9GotzJ8yXxC0pEz34WOku/HEguthf9Bk+dW3vYf5sZdaXo4t7y99us8KpxkcLtmujG3uyHcKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysiU7TqDuH0nwoObGIkfROje5PRo/BnQeXg9LHJA+0o=;
 b=PioF19Nys8diGDiyVb5espEWjYAdNE94I/eRl/hxI4IsCkwm5b17EbnlgFNvo1SHCW5imH8sNK3eatGojdaSyJ6pbG/UHlUgyQopkowHw0CbFoqIUuZNeWMd6QC4YhhLboWa8jQzwshyBb456efhiJ3LywDgxA3lN3MpaBJtRRtZfbifqSzLJWPBaHCZhscA/G56x6Amijhr/l1OpQH6dYIgdJuYekixrqcv2pB8pGoJ1KVOik6JvlC5u56dwmLqZrLDZwEtBRMAMdhIsA0TGipe2TgIo990sQha4Pe+uZQpES31FT8nC9wichiDlfHZIOD7z1AyFytxVCSNAQ1ylg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 PH7PR11MB6699.namprd11.prod.outlook.com (2603:10b6:510:1ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 14:57:19 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9320.013; Mon, 17 Nov 2025
 14:57:19 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t v7 08/10] tests/intel/xe_multi_gpusvm.c: Add SVM
 multi-GPU simultaneous access test
Thread-Topic: [PATCH i-g-t v7 08/10] tests/intel/xe_multi_gpusvm.c: Add SVM
 multi-GPU simultaneous access test
Thread-Index: AQHcVLs98f06x6OtnU6VdQl5fRedg7T2+3kA
Date: Mon, 17 Nov 2025 14:57:19 +0000
Message-ID: <9b76a0840ba00cda06a80b15e3ed07b5b36d94d3.camel@intel.com>
References: <20251113163308.633818-1-nishit.sharma@intel.com>
 <20251113163308.633818-9-nishit.sharma@intel.com>
In-Reply-To: <20251113163308.633818-9-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|PH7PR11MB6699:EE_
x-ms-office365-filtering-correlation-id: 6eb97173-a9d1-4785-82f3-08de25e99b1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?bnFVR1hiOW9lYUVtc0NPQ1ZtRm04ZmhhTkxvMUw1TVZodm1jMmEvaUZ0d0ND?=
 =?utf-8?B?eDFmUy9aa0RocGwzL2tYYmNQRWNwbDgwamptNVZjeUhwMisvNmVaYXJFRC9J?=
 =?utf-8?B?amlFeUtwK3g3L2FDekdHSWNrOE1IMGZKMlNPV3NuMVFvQUhDTzQ3dlVRNG9m?=
 =?utf-8?B?K1BVdXQzNGJ4RzlOZDRHcUp3KzMwSEMrbGZ2b0N3WjllcnJHMGVFbUdBSkxy?=
 =?utf-8?B?ZjIyMzNmbjREQ3QyQ2VkRXZSRlVZNDhkb0F3eHF5bUwxSll4R2Q0QmltZXkw?=
 =?utf-8?B?TFByU08yeTJ6U2M4NzA5TDZ2eTY3cno1c0ZCbDhTYWh6dVMwTjdMQzZQN3BH?=
 =?utf-8?B?MGVPWG1naWFlaXNrajRKbC9ES0tjdmFrMDVIQUJTTWhSYlgwSjFvRmRUTzlo?=
 =?utf-8?B?L3ZsUFJ0cWFFa3QvL3RUTnFQVGFuc0RudktHZ1FlUzFrRnphVldGYW1zeGtY?=
 =?utf-8?B?VThYYzhydmcrcG55QlY5NmJCYlRmajJuWWljSW8yeVBmK2FzKzRaNHJpNmZ1?=
 =?utf-8?B?MHFoY2xMRWhYaVNYRytzdnBkOTAvdzdWNVZuL29adXk3MDVOakxyWUpHNko3?=
 =?utf-8?B?WDNsTUtBTVR4OVJmTTBGZmIvWE1uYlEweVRBTm5SRWRyQ0FwaWUrbmw4cW13?=
 =?utf-8?B?cjlTeXBBU0hhRVdaYVNmQXFEUVRhYlNMMTNrbFhoUHdPQ0lJZkJqSHQvUnc0?=
 =?utf-8?B?K2JhdDlxeTZ1Mi9pZ0ZTZWFLU1hKTXI0U29EeVN2dU8zbTlYYUFhMEErMERJ?=
 =?utf-8?B?NS9jTlpXTUs4ZU9HRi9RcFVHYWdaLzRRc1RvcWdmUTV6cldzUDN1WWNMNGhW?=
 =?utf-8?B?MSt4bVNPUEcvSFFnM3o3dzN3SjlDSlpKcXh4N1hOS2djVjdVWHlHREtQMCtD?=
 =?utf-8?B?eFF4WFd6cml2WHo1OGtsNC9DYi9HTS9JVnJzS0dCVlduaEM4TkhyYitjUHB5?=
 =?utf-8?B?bWpUeU5MY0dlREZpaGxxRTg2N2QzMHFVWTZrZ0FIeHA3OFhMekxVR2NnMzZy?=
 =?utf-8?B?Nm1sblN6aEpMc2x0aEVXL200Z2VCazVhWnRmNVhXR1dNU0JHR1NBTHJ1anRm?=
 =?utf-8?B?T1JzRGQvQ2lraDhhM2ZoVDE2TmttdkpHb3RqeVRCUFQvZmVaalR5MzJnL21O?=
 =?utf-8?B?eU13aTh5dGdqSHBRSjJubjZaN3oyTWthVlZUdGROZGpjRmNUM2ZHODFVMjlQ?=
 =?utf-8?B?d251M2JZMkpLM0xUVVRpemFLSUtjYjk1YTJ3amFFRG5MRUNWSmNRbUhaNDBZ?=
 =?utf-8?B?emxmNUdpR0YxZmxQSXdNRGNwYU1GTWJTdnAvMDRyb1pNakpZTkpNM1krR3Fz?=
 =?utf-8?B?ckZBV3NtUHl2WDZjTFloQ0N2aHcxT0RmV0JSODYraDFCWC81d25qVElZVGQx?=
 =?utf-8?B?eEtMSzNKSElIVU51dWZiQTArTXpRTFJGTFlQS3dMdVpYTnpSb050WFJnSEdj?=
 =?utf-8?B?MHJzUEpqMmpuNHNtcS9QV2pyd1dJbDhaUDA3Tk1vZGN4QjFlckEyWStYbVd6?=
 =?utf-8?B?czRSYW80WjFkRmh0MlpqLzVSd1BCVGtvU0xLWFpOSDAwVUxXZWxpdm9QWGFD?=
 =?utf-8?B?eFVObllFZ2hCdUl4b3VocUhCWWVmMUUzZE1FOVowYzV1NGR2SlBwUlVkM3k0?=
 =?utf-8?B?K2tieTR0ZTVVRHU1WFJyd2JsTllTbGhwb0xoSzZYYW1jWEN6VXBpMVJrWnpu?=
 =?utf-8?B?eEtIN1p3K1JROCtDZWM2UmlEN2c5UGFML0ZCektySjh2dmxIUVNvRlhwSGNp?=
 =?utf-8?B?enl6eUtQSSs2eGV3aVFEeUxkTnB1ZnFSTzdhU2VFY1JKWjZiSTRFa2NmRERj?=
 =?utf-8?B?TFlJcTdEdG9MdWhoRnhTcU94QVVMQmRlK1FndFJvUnhZdXVnMXdLb1VCNS9S?=
 =?utf-8?B?S1M2NWZFbXcxaVpaWDdPR0RqdXl5akptK212YzZabTJnbzgwQmhKd2cxVEpw?=
 =?utf-8?B?ZVRNQVVaU2hna1RWU1VWR1JWaGZiaVlvbmh6TDZaeUFyUEhSWjdrWGNlbCto?=
 =?utf-8?B?enhVeEFoTmRCVHV5eDZOVStDckxScFZ2Zm8vMkphQ1p4cDFtZk9xTVhFRkd3?=
 =?utf-8?Q?C/0XX8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1BOZjhYWW45KzVzM3hDdXkrdnhYV2Q3dHV4aUw4T0lBQkdlUW01UFc1M2Jv?=
 =?utf-8?B?VkZjcnBkZW1QRGsvaVVDUWJDVFpDNXNCekZ4SWdTMlZvNzBPS1Q5OVU1UkVN?=
 =?utf-8?B?SHJmOXZzdnU3Z1lvN2VGN0UreXBPR3BrcWc0bHV0V2piZlVMNUZpdTgxVzV4?=
 =?utf-8?B?UDRnQ2dXbjJZTmJ5WWYxbGkrU3lHTFk5SVExdHlMS05sVFhhTkpOV2lMTjBC?=
 =?utf-8?B?dGN6T05yc3ZZNGZIcXc1LzJKK3RZTU9pTjV1R1Z5RFh3Y1RtQnRlb2haQ3Fh?=
 =?utf-8?B?SHBFc3hzM2hMTHhRRVd5b2tjL0dBNlM0eFBUT1dUUXNzanFUazhZTWhobTNR?=
 =?utf-8?B?Y3RqdmJWSmcwcXJSVHFGdXVadzFlSXZEckdjTnVRaGYyc3Z2b2ZJNWxBOVlp?=
 =?utf-8?B?UGpTb09DTkxOSGxBcFpVenloVkg4SG9CYXlRb0RzRy9BYllrdDVaTDd3SU5k?=
 =?utf-8?B?ZUpjb1d4cWswTDhLVzV6SWRMTWZpQjdMWXp2WVpMY2tSc3RHTmlnZnVrWXVs?=
 =?utf-8?B?U2M1eXd4S0wrcHFHQmxHNk8vbjBnblFjeTNSbDJIaEdxYnY0blFySFEzSThS?=
 =?utf-8?B?ckNPK3lKbjJ0SUxvMWU5SjQxNmlGYUJTMnh1NjRZZGh4TGpKVUw4d295ekl2?=
 =?utf-8?B?RnZWUlBLRFQ3NTNHZWJCMXZtWm4xcys2aFNHbUNhMXNPdU9Pc3RHak5ITmlz?=
 =?utf-8?B?aklXQnliVkdETUhIMlZiR0JNYVpkNG5obVdRMUFsd1pyR3dsMWovZzRpM042?=
 =?utf-8?B?bmtwQmN1Y2VwK2VNL21hUnEwK29hUTBiemVRT2JNZ2E2WkovUmVWRXQ3V1ZS?=
 =?utf-8?B?ZU1LU3BhRFZDQzNYRTgwVittRW1maXZkOHZRdVBDcDVzQzQrN01iUUc4L2xl?=
 =?utf-8?B?Z2Nibk4wbG5MUlFRV1BnakNvUjlMUGtoaVF3NUtQV1NtWldmSzhuZktZQVFC?=
 =?utf-8?B?RmdVZ1hEcUZ6VTlOZEJTcGhtbUFVa1gwbHo4ZzdlVjdaczdOa3JvbTU2SzhN?=
 =?utf-8?B?ZmI5bzZYM3NIcDN2YVVjTFBJQS80WW5YdUlsMURkN1FxckRsYzVtRUloSGtn?=
 =?utf-8?B?L0FUYmJqaThVdmRSSFVmelNDalRLMFkwU3gzOFk4ajhic2UvM2MrNGxTQ1Bh?=
 =?utf-8?B?VStqMjNEWTdDUEpRNmEreCtiY0EzTlRHV296ejNHVm1nOXBQNFhjSmh6bkZD?=
 =?utf-8?B?T2t0VlR6U2hVV3d3RnloRHl1cVAzMFh2c2g0UmNDUDl2bW1pZ1BSODdzRU5B?=
 =?utf-8?B?YzR0Nnd5WnJqSi9pbkUvZlJydGhBSzR0QjVoc1ZIVTBIRkFHTDQ1L29Gdy9S?=
 =?utf-8?B?a3NNQ2QyUGxJcUpQMVB3QS9ET0dUUUVyODZjYUhHTzJ4R0NoYllSdENZR3Jp?=
 =?utf-8?B?WmpHMUs5OUc4U1oxeG9oRFgxbFE4YU5VUjhReUQyZlRCVkl6My9NSmFYc0RP?=
 =?utf-8?B?TU9Oa3QycStoUFg3b0hpamx1RGVRdUcxVjFCYVQ0WmE2eGJidXY0aS9IaFNW?=
 =?utf-8?B?dG9aSnI1cTF2WVN3NXhjVmFRSmFiTHA3L2tWbTJwT1lvSlFXczJyUlBTemtw?=
 =?utf-8?B?MzluanhaMUtKc3VKQjNKd0srYVhIdlNpc2luNEhKZGVrN2ZBSkVpZFRWSGt3?=
 =?utf-8?B?T2p2MnpxTlpRVjRsSHdKOFNtMlY2d2RPY0lwUTE4aWpwR3p2T0M2alV1YU9V?=
 =?utf-8?B?bE4rSUJkSktpcStHdisyM3Bvam1xRE4xQjN5OWt2VTAwb3Z2SWkzSkZWWUFw?=
 =?utf-8?B?Y3dpV3c1bmVrTVowNnJtdkpzdjU5NmhnM01uQTBBOUlqczNaZEdmZDdmZUFi?=
 =?utf-8?B?OFVITjRidGF2WGFhaVBZWCs1SVJJOWtVYkdPY0J0QXFFQmw0bHdmdngwcGo3?=
 =?utf-8?B?UUFlelQxYUlRTFowNk1vczFWL1JFdmMwVHZ0NlpjOEJ0ako4QXdnVTZ1TGZI?=
 =?utf-8?B?ak5sTkttenNMMmoxZVg2blZlamlnR3ZPdzM2UlE5d2JPR0tVWllpV1F5Ukd6?=
 =?utf-8?B?ZTBjWDVWNjhPRTYrNTI5cDZ5TkFYNUFGTVM1aHpOR05zcm1sV0o5TjIya0p3?=
 =?utf-8?B?MHZreXVSTU91RHNLMUlhb1pyL013SFBydzV1WUJtZG01NUhUeWtGZlRJWlZM?=
 =?utf-8?B?MFhsM0oyNzFmVi9mZE1ZdUV1RzB0V3hicGdKeUVlL1NDZ0NLL0tPeEZTRmZ0?=
 =?utf-8?Q?zytS3A0+PN5T5u76kaskkv2yJ1k5XWZUvhNvf0U8lRNl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4B0AAFDD5F70C4B92C2280409535B6E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb97173-a9d1-4785-82f3-08de25e99b1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 14:57:19.2519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +3UNfDi48CtHi2YiPWwnh8/m0+xp6tg5knGTb57uj6mu+nYR4EPKRi+XOvJT3IaSNik4im8MvEfExNrJk2oiwveyespBVtwWbSaqKgX49CA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6699
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

T24gVGh1LCAyMDI1LTExLTEzIGF0IDE2OjMzICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiBUaGlzIHRlc3QgbGF1bmNoZXMgY29tcHV0ZSBvciBjb3B5IHdvcmtsb2FkcyBvbiBi
b3RoIEdQVXMgdGhhdCBhY2Nlc3MNCj4gdGhlIHNhbWUNCj4gU1ZNIGJ1ZmZlciwgdXNpbmcgc3lu
Y2hyb25pemF0aW9uIHByaW1pdGl2ZXMgKGZlbmNlcy9zZW1hcGhvcmVzKSB0bw0KPiBjb29yZGlu
YXRlDQo+IGFjY2Vzcy4gSXQgdmVyaWZpZXMgZGF0YSBpbnRlZ3JpdHkgYW5kIGNoZWNrcyBmb3Ig
dGhlIGFic2VuY2Ugb2YgcmFjZQ0KPiBjb25kaXRpb25zDQo+IGluIGEgbXVsdGktR1BVIFNWTSBl
bnZpcm9ubWVudC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pc2hpdCBTaGFybWEgPG5pc2hpdC5z
aGFybWFAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqB0ZXN0cy9pbnRlbC94ZV9tdWx0aV9ncHVzdm0u
YyB8IDEzMw0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+IMKgMSBmaWxl
IGNoYW5nZWQsIDEzMyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50
ZWwveGVfbXVsdGlfZ3B1c3ZtLmMNCj4gYi90ZXN0cy9pbnRlbC94ZV9tdWx0aV9ncHVzdm0uYw0K
PiBpbmRleCA2ZmViNTQzYWUuLmRjMmE4ZjljOCAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwv
eGVfbXVsdGlfZ3B1c3ZtLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfbXVsdGlfZ3B1c3ZtLmMN
Cj4gQEAgLTU0LDYgKzU0LDExIEBADQo+IMKgICogRGVzY3JpcHRpb246DQo+IMKgICrCoAlUaGlz
IHRlc3QgaW50ZW50aW9uYWxseSB0cmlnZ2VycyBwYWdlIGZhdWx0cyBieSBhY2Nlc3NpbmcNCj4g
dW5tYXBwZWQgU1ZNDQo+IMKgICrCoAlyZWdpb25zIGZyb20gYm90aCBHUFVzDQo+ICsgKg0KPiAr
ICogU1VCVEVTVDogY29uY3VycmVudC1hY2Nlc3MtbXVsdGktZ3B1DQo+ICsgKiBEZXNjcmlwdGlv
bjoNCj4gKyAqwqAJVGhpcyB0ZXN0cyBhdW5jaGVzIHNpbXVsdGFuZW91cyB3b3JrbG9hZHMgb24g
Ym90aCBHUFVzDQo+IGFjY2Vzc2luZyB0aGUNCj4gKyAqwqAJc2FtZSBTVk0gYnVmZmVyIHN5bmNo
cm9uaXplcyB3aXRoIGZlbmNlcywgYW5kIHZlcmlmaWVzIGRhdGENCj4gaW50ZWdyaXR5DQo+IMKg
ICovDQo+IMKgDQo+IMKgI2RlZmluZSBNQVhfWEVfUkVHSU9OUwk4DQo+IEBAIC0xMjYsNiArMTMx
LDExIEBAIHN0YXRpYyB2b2lkIGdwdV9mYXVsdF90ZXN0X3dyYXBwZXIoc3RydWN0DQo+IHhlX3N2
bV9ncHVfaW5mbyAqc3JjLA0KPiDCoAkJCQnCoMKgIHN0cnVjdA0KPiBkcm1feGVfZW5naW5lX2Ns
YXNzX2luc3RhbmNlICplY2ksDQo+IMKgCQkJCcKgwqAgdm9pZCAqZXh0cmFfYXJncyk7DQo+IMKg
DQo+ICtzdGF0aWMgdm9pZCBncHVfc2ltdWx0X3Rlc3Rfd3JhcHBlcihzdHJ1Y3QgeGVfc3ZtX2dw
dV9pbmZvICpzcmMsDQo+ICsJCQkJwqDCoMKgIHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8gKmRzdCwN
Cj4gKwkJCQnCoMKgwqAgc3RydWN0DQo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVj
aSwNCj4gKwkJCQnCoMKgwqAgdm9pZCAqZXh0cmFfYXJncyk7DQo+ICsNCj4gwqBzdGF0aWMgdm9p
ZA0KPiDCoGNyZWF0ZV92bV9hbmRfcXVldWUoc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqZ3B1LCBz
dHJ1Y3QNCj4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLA0KPiDCoAkJwqDCoMKg
IHVpbnQzMl90ICp2bSwgdWludDMyX3QgKmV4ZWNfcXVldWUpDQo+IEBAIC05MDAsNiArOTEwLDEw
OCBAQCBncHVfY29oZXJlY3lfdGVzdF93cmFwcGVyKHN0cnVjdA0KPiB4ZV9zdm1fZ3B1X2luZm8g
KnNyYywNCj4gwqAJY29oZXJlbmN5X3Rlc3RfbXVsdGlncHUoc3JjLCBkc3QsIGVjaSwgYXJncy0+
b3BfbW9kLCBhcmdzLQ0KPiA+cHJlZmV0Y2hfcmVxKTsNCj4gwqB9DQo+IMKgDQo+ICtzdGF0aWMg
dm9pZA0KPiArbXVsdGlncHVfYWNjZXNzX3Rlc3Qoc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqZ3B1
MCwNCj4gKwkJwqDCoMKgwqAgc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqZ3B1MSwNCj4gKwkJwqDC
oMKgwqAgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwNCj4gKwkJwqDC
oMKgwqAgYm9vbCBub19wcmVmZXRjaCkNCj4gK3sNCj4gKwl1aW50NjRfdCBhZGRyOw0KPiArCXVp
bnQzMl90IHZtWzJdOw0KPiArCXVpbnQzMl90IGV4ZWNfcXVldWVbMl07DQo+ICsJdWludDMyX3Qg
YmF0Y2hfYm9bMl07DQo+ICsJc3RydWN0IHRlc3RfZXhlY19kYXRhICpkYXRhOw0KPiArCXVpbnQ2
NF90IGJhdGNoX2FkZHJbMl07DQo+ICsJc3RydWN0IGRybV94ZV9zeW5jIHN5bmNbMl0gPSB7fTsN
Cj4gKwl2b2xhdGlsZSB1aW50NjRfdCAqc3luY19hZGRyWzJdOw0KPiArCXZvbGF0aWxlIHVpbnQz
Ml90ICpzaGFyZWRfdmFsOw0KPiArDQo+ICsJY3JlYXRlX3ZtX2FuZF9xdWV1ZShncHUwLCBlY2ks
ICZ2bVswXSwgJmV4ZWNfcXVldWVbMF0pOw0KPiArCWNyZWF0ZV92bV9hbmRfcXVldWUoZ3B1MSwg
ZWNpLCAmdm1bMV0sICZleGVjX3F1ZXVlWzFdKTsNCj4gKw0KPiArCWRhdGEgPSBhbGlnbmVkX2Fs
bG9jKFNaXzJNLCBTWl80Syk7DQo+ICsJaWd0X2Fzc2VydChkYXRhKTsNCj4gKwlkYXRhWzBdLnZt
X3N5bmMgPSAwOw0KPiArCWFkZHIgPSB0b191c2VyX3BvaW50ZXIoZGF0YSk7DQo+ICsNCj4gKwlz
aGFyZWRfdmFsID0gKHZvbGF0aWxlIHVpbnQzMl90ICopYWRkcjsNCj4gKwkqc2hhcmVkX3ZhbCA9
IEFUT01JQ19PUF9WQUwgLSAxOw0KPiArDQo+ICsJYXRvbWljX2JhdGNoX2luaXQoZ3B1MC0+ZmQs
IHZtWzBdLCBhZGRyLCAmYmF0Y2hfYm9bMF0sDQo+ICZiYXRjaF9hZGRyWzBdKTsNCj4gKwkqc2hh
cmVkX3ZhbCA9IEFUT01JQ19PUF9WQUwgLSAyOw0KPiArCWF0b21pY19iYXRjaF9pbml0KGdwdTEt
PmZkLCB2bVsxXSwgYWRkciwgJmJhdGNoX2JvWzFdLA0KPiAmYmF0Y2hfYWRkclsxXSk7DQo+ICsN
Cj4gKwkvKiBQbGFjZSBkZXN0aW5hdGlvbiBpbiBhbiBvcHRpb25hbGx5IHJlbW90ZSBsb2NhdGlv
biB0bw0KPiB0ZXN0ICovDQo+ICsJeGVfbXVsdGlncHVfbWFkdmlzZShncHUwLT5mZCwgdm1bMF0s
IGFkZHIsIFNaXzRLLCAwLA0KPiArCQkJwqDCoMKgIERSTV9YRV9NRU1fUkFOR0VfQVRUUl9QUkVG
RVJSRURfTE9DLA0KPiArCQkJwqDCoMKgIGdwdTAtPmZkLCAwLCBncHUwLT52cmFtX3JlZ2lvbnNb
MF0sDQo+IGV4ZWNfcXVldWVbMF0sDQo+ICsJCQnCoMKgwqAgMCwgMCk7DQo+ICsJeGVfbXVsdGln
cHVfbWFkdmlzZShncHUxLT5mZCwgdm1bMV0sIGFkZHIsIFNaXzRLLCAwLA0KPiArCQkJwqDCoMKg
IERSTV9YRV9NRU1fUkFOR0VfQVRUUl9QUkVGRVJSRURfTE9DLA0KPiArCQkJwqDCoMKgIGdwdTEt
PmZkLCAwLCBncHUxLT52cmFtX3JlZ2lvbnNbMF0sDQo+IGV4ZWNfcXVldWVbMV0sDQo+ICsJCQnC
oMKgwqAgMCwgMCk7DQo+ICsNCj4gKwlzZXR1cF9zeW5jKCZzeW5jWzBdLCAmc3luY19hZGRyWzBd
LCBCSU5EX1NZTkNfVkFMKTsNCj4gKwlzZXR1cF9zeW5jKCZzeW5jWzFdLCAmc3luY19hZGRyWzFd
LCBCSU5EX1NZTkNfVkFMKTsNCj4gKw0KPiArCS8qIEZvciBzaW11bHRhbmVvdXMgYWNjZXNzIG5l
ZWQgdG8gY2FsbCB4ZV93YWl0X3VmZW5jZSBmb3INCj4gYm90aCBncHVzIGFmdGVyIHByZWZldGNo
ICovDQo+ICsJaWYoIW5vX3ByZWZldGNoKSB7DQoNCkhlcmUgd2UgaGF2ZSBkb3VibGUgbmVnYXRp
b24uIFBlcmhhcHMgaW52ZXJ0IHRoZSBtZWFuaW5nIG9mIHRoZQ0KdmFyaWFibGUgYW5kIGNhbGwg
aXQgZG9fcHJlZmV0Y2guDQoNCg0KPiArCQl4ZV92bV9wcmVmZXRjaF9hc3luYyhncHUwLT5mZCwg
dm1bMF0sIDAsIDAsIGFkZHIsDQo+ICsJCQkJwqDCoMKgwqAgU1pfNEssICZzeW5jWzBdLCAxLA0K
PiArCQkJCcKgwqDCoMKgDQo+IERSTV9YRV9DT05TVUxUX01FTV9BRFZJU0VfUFJFRl9MT0MpOw0K
PiArDQo+ICsJCXhlX3ZtX3ByZWZldGNoX2FzeW5jKGdwdTEtPmZkLCB2bVsxXSwgMCwgMCwgYWRk
ciwNCj4gKwkJCQnCoMKgwqDCoCBTWl80SywgJnN5bmNbMV0sIDEsDQo+ICsJCQkJwqDCoMKgwqAN
Cj4gRFJNX1hFX0NPTlNVTFRfTUVNX0FEVklTRV9QUkVGX0xPQyk7DQo+ICsNCj4gKwkJaWYgKCpz
eW5jX2FkZHJbMF0gIT0gQklORF9TWU5DX1ZBTCkNCj4gKwkJCXhlX3dhaXRfdWZlbmNlKGdwdTAt
PmZkLCAodWludDY0X3QNCj4gKilzeW5jX2FkZHJbMF0sIEJJTkRfU1lOQ19WQUwsIGV4ZWNfcXVl
dWVbMF0sDQo+ICsJCQkJwqDCoMKgwqDCoMKgIE5TRUNfUEVSX1NFQyAqIDEwKTsNCj4gKwkJZnJl
ZSgodm9pZCAqKXN5bmNfYWRkclswXSk7DQo+ICsJCWlmICgqc3luY19hZGRyWzFdICE9IEJJTkRf
U1lOQ19WQUwpDQo+ICsJCQl4ZV93YWl0X3VmZW5jZShncHUxLT5mZCwgKHVpbnQ2NF90DQo+ICop
c3luY19hZGRyWzFdLCBCSU5EX1NZTkNfVkFMLCBleGVjX3F1ZXVlWzFdLA0KPiArCQkJCcKgwqDC
oMKgwqDCoCBOU0VDX1BFUl9TRUMgKiAxMCk7DQo+ICsJCWZyZWUoKHZvaWQgKilzeW5jX2FkZHJb
MV0pOw0KPiArCX0NCj4gKw0KPiArCWlmIChub19wcmVmZXRjaCkgew0KPiArCQlmcmVlKCh2b2lk
ICopc3luY19hZGRyWzBdKTsNCj4gKwkJZnJlZSgodm9pZCAqKXN5bmNfYWRkclsxXSk7DQo+ICsJ
fQ0KPiArDQo+ICsJZm9yIChpbnQgaSA9IDA7IGkgPCAxMDA7IGkrKykgew0KPiArCQlzeW5jX2Fk
ZHJbMF0gPSAodm9pZCAqKSgoY2hhciAqKWJhdGNoX2FkZHJbMF0gKw0KPiBTWl80Syk7DQo+ICsJ
CXN5bmNbMF0uYWRkciA9IHRvX3VzZXJfcG9pbnRlcigodWludDY0X3QNCj4gKilzeW5jX2FkZHJb
MF0pOw0KPiArCQlzeW5jWzBdLnRpbWVsaW5lX3ZhbHVlID0gRVhFQ19TWU5DX1ZBTDsNCj4gKw0K
PiArCQlzeW5jX2FkZHJbMV0gPSAodm9pZCAqKSgoY2hhciAqKWJhdGNoX2FkZHJbMV0gKw0KPiBT
Wl80Syk7DQo+ICsJCXN5bmNbMV0uYWRkciA9IHRvX3VzZXJfcG9pbnRlcigodWludDY0X3QNCj4g
KilzeW5jX2FkZHJbMV0pOw0KPiArCQlzeW5jWzFdLnRpbWVsaW5lX3ZhbHVlID0gRVhFQ19TWU5D
X1ZBTDsNCj4gKwkJKnN5bmNfYWRkclswXSA9IDA7DQo+ICsJCSpzeW5jX2FkZHJbMV0gPSAwOw0K
PiArDQo+ICsJCXhlX2V4ZWNfc3luYyhncHUwLT5mZCwgZXhlY19xdWV1ZVswXSwgYmF0Y2hfYWRk
clswXSwNCj4gJnN5bmNbMF0sIDEpOw0KPiArCQlpZiAoKnN5bmNfYWRkclswXSAhPSBFWEVDX1NZ
TkNfVkFMKQ0KPiArCQkJeGVfd2FpdF91ZmVuY2UoZ3B1MC0+ZmQsICh1aW50NjRfdA0KPiAqKXN5
bmNfYWRkclswXSwgRVhFQ19TWU5DX1ZBTCwgZXhlY19xdWV1ZVswXSwNCj4gKwkJCQnCoMKgwqDC
oMKgwqAgTlNFQ19QRVJfU0VDICogMTApOw0KPiArCQl4ZV9leGVjX3N5bmMoZ3B1MS0+ZmQsIGV4
ZWNfcXVldWVbMV0sIGJhdGNoX2FkZHJbMV0sDQo+ICZzeW5jWzFdLCAxKTsNCj4gKwkJaWYgKCpz
eW5jX2FkZHJbMV0gIT0gRVhFQ19TWU5DX1ZBTCkNCj4gKwkJCXhlX3dhaXRfdWZlbmNlKGdwdTEt
PmZkLCAodWludDY0X3QNCj4gKilzeW5jX2FkZHJbMV0sIEVYRUNfU1lOQ19WQUwsIGV4ZWNfcXVl
dWVbMV0sDQo+ICsJCQkJwqDCoMKgwqDCoMKgIE5TRUNfUEVSX1NFQyAqIDEwKTsNCg0KSGVyZSB5
b3UgYXJlIHN5bmNocm9uaXppbmcgYWZ0ZXIgZWFjaCBiYXRjaCBleGVjdXRpb24sIHNvIG5vdGhp
bmcNCnJlYWxseSBydW5zIGluIHBhcmFsbGVsLiBJIHN1Z2dlc3Qgb25seSBzeW5jaHJvbml6aW5n
IG9uIHRoZSBsYXN0DQppdGVyYXRpb24sIGFuZCBkb24ndCB1c2UgYW55IHN5bmMgb2JqZWN0cyBv
biB0aGUgcHJldmlvdXMgaXRlcmF0aW9ucy4NCg0KVGhhbmtzLA0KVGhvbWFzDQoNCg0KDQo+ICsJ
fQ0KPiArDQo+ICsJaWd0X2Fzc2VydF9lcSgqKHVpbnQ2NF90ICopYWRkciwgMjU0KTsNCj4gKw0K
PiArCW11bm1hcCgodm9pZCAqKWJhdGNoX2FkZHJbMF0sIEJBVENIX1NJWkUoZ3B1MC0+ZmQpKTsN
Cj4gKwltdW5tYXAoKHZvaWQgKiliYXRjaF9hZGRyWzFdLCBCQVRDSF9TSVpFKGdwdTAtPmZkKSk7
DQo+ICsJYmF0Y2hfZmluaShncHUwLT5mZCwgdm1bMF0sIGJhdGNoX2JvWzBdLCBiYXRjaF9hZGRy
WzBdKTsNCj4gKwliYXRjaF9maW5pKGdwdTEtPmZkLCB2bVsxXSwgYmF0Y2hfYm9bMV0sIGJhdGNo
X2FkZHJbMV0pOw0KPiArCWZyZWUoZGF0YSk7DQo+ICsNCj4gKwljbGVhbnVwX3ZtX2FuZF9xdWV1
ZShncHUwLCB2bVswXSwgZXhlY19xdWV1ZVswXSk7DQo+ICsJY2xlYW51cF92bV9hbmRfcXVldWUo
Z3B1MSwgdm1bMV0sIGV4ZWNfcXVldWVbMV0pOw0KPiArfQ0KPiArDQo+IMKgc3RhdGljIHZvaWQN
Cj4gwqBncHVfbGF0ZW5jeV90ZXN0X3dyYXBwZXIoc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqc3Jj
LA0KPiDCoAkJCSBzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpkc3QsDQo+IEBAIC05MjYsNiArMTAz
OCwxOSBAQCBncHVfZmF1bHRfdGVzdF93cmFwcGVyKHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8NCj4g
KnNyYywNCj4gwqDCoMKgwqDCoMKgwqDCoCBwYWdlZmF1bHRfdGVzdF9tdWx0aWdwdShzcmMsIGRz
dCwgZWNpLCBhcmdzLT5wcmVmZXRjaF9yZXEpOw0KPiDCoH0NCj4gwqANCj4gK3N0YXRpYyB2b2lk
DQo+ICtncHVfc2ltdWx0X3Rlc3Rfd3JhcHBlcihzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpzcmMs
DQo+ICsJCQlzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpkc3QsDQo+ICsJCQlzdHJ1Y3QgZHJtX3hl
X2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLA0KPiArCQkJdm9pZCAqZXh0cmFfYXJncykNCj4g
K3sNCj4gKwlzdHJ1Y3QgbXVsdGlncHVfb3BzX2FyZ3MgKmFyZ3MgPSAoc3RydWN0IG11bHRpZ3B1
X29wc19hcmdzDQo+ICopZXh0cmFfYXJnczsNCj4gKwlpZ3RfYXNzZXJ0KHNyYyk7DQo+ICsJaWd0
X2Fzc2VydChkc3QpOw0KPiArDQo+ICsJbXVsdGlncHVfYWNjZXNzX3Rlc3Qoc3JjLCBkc3QsIGVj
aSwgYXJncy0+cHJlZmV0Y2hfcmVxKTsNCj4gK30NCj4gKw0KPiDCoGlndF9tYWluDQo+IMKgew0K
PiDCoAlzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvIGdwdXNbTUFYX1hFX0dQVVNdOw0KPiBAQCAtMTAw
MSw2ICsxMTI2LDE0IEBAIGlndF9tYWluDQo+IMKgCQlmb3JfZWFjaF9ncHVfcGFpcihncHVfY250
LCBncHVzLCAmZWNpLA0KPiBncHVfZmF1bHRfdGVzdF93cmFwcGVyLCAmZmF1bHRfYXJncyk7DQo+
IMKgCX0NCj4gwqANCj4gKwlpZ3Rfc3VidGVzdCgiY29uY3VycmVudC1hY2Nlc3MtbXVsdGktZ3B1
Iikgew0KPiArCQlzdHJ1Y3QgbXVsdGlncHVfb3BzX2FyZ3Mgc2ltdWxfYXJnczsNCj4gKwkJc2lt
dWxfYXJncy5wcmVmZXRjaF9yZXEgPSAxOw0KPiArCQlmb3JfZWFjaF9ncHVfcGFpcihncHVfY250
LCBncHVzLCAmZWNpLA0KPiBncHVfc2ltdWx0X3Rlc3Rfd3JhcHBlciwgJnNpbXVsX2FyZ3MpOw0K
PiArCQlzaW11bF9hcmdzLnByZWZldGNoX3JlcSA9IDA7DQo+ICsJCWZvcl9lYWNoX2dwdV9wYWly
KGdwdV9jbnQsIGdwdXMsICZlY2ksDQo+IGdwdV9zaW11bHRfdGVzdF93cmFwcGVyLCAmc2ltdWxf
YXJncyk7DQo+ICsJfQ0KPiArDQo+IMKgCWlndF9maXh0dXJlIHsNCj4gwqAJCWludCBjbnQ7DQo+
IMKgDQoNCg==
