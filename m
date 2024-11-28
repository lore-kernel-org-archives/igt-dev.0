Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10168D69113
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 14:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC15F10ECB2;
	Thu, 28 Nov 2024 14:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WPzcrp2u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055F910ECB2
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 14:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732805184; x=1764341184;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=FGC3twue3k40nFB1f/4wbWs6joL7bUnkKm+6gwYbEGE=;
 b=WPzcrp2uJjFRS0y4yFUXBJ3M+IqvUEHRenpKI9qbPhDS3RykgfjLGDrF
 G83LX0KYtPsDzSK73QaMUsyre0wdHbM20ArkYwq48kX/0g53UPlDh8f/3
 uQMEgtDoYSAxsAbGRPgaxLK387FTPXX+gif9cmxW5pVfz0dpUajG4y51E
 W+CYIIxirlzjVmOBUh3F3poPDuAJTaNlRcbdDh0GBD6FdvSuDMhapUcjN
 hUcdW8WhxPhQyZ+A4NogeNXcp91XqeNyjbFH3ThCCWpLY+7JSYN4403QN
 mg7mb8smRgs8Kl17wNahOuhkVzDKJcYm0DW95pNEWwlf0to3Zd72RZSo9 A==;
X-CSE-ConnectionGUID: KV3rwporTzKpvZt2APwooA==
X-CSE-MsgGUID: mAMXeufrT0OxTmLAoUN7yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33096370"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="33096370"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 06:46:24 -0800
X-CSE-ConnectionGUID: DrxcAZQHTVWzu42XJvIxjw==
X-CSE-MsgGUID: X0IKlpdfR82yk7xmqZzxMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="92580237"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2024 06:46:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 06:46:23 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 06:46:23 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 06:46:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSrOtupH0Q0BGbmy0F4AM/AIz+SiRj7CLfjQhLXlKeYctUKjj6bbbg7KQUhCCdDnMflPK5+pu2TTBq3Zz1aXzkCwlzCSSNshD0OHLHB3QRdaJTFnOYPRz8USKh2n9LcC61vjybFh25vhOG7LumJXb01tdbUZub2L2okQ/hlePv4aIID5S2Tkm1fyBEwkAHgjYMEIQiDUMcIeuJj2blq7jDA6GN/q4V1jviR5yM8q9bXD7kikbm0vDoZ+Le9JUT6ddZZSa52SxF2vqCHQ+p8XcVoqOsA3DjS4S0djVgGNhhaUbLSDq6KPPjPYRV9mRLBwelCmtB45AHfpjiSoI9NUVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pg7zu8IzJ12j26UpiHB3yMUvnh65vfu+kpN42wwbRhI=;
 b=LWxlBvH528Kdc6pJEHLiF/BQhn8196Xnxwj10c273mbfVTCUAFQ4TgnzuyFVPMY8RmZRvNxrm/fRy4wHJ3AzPZEAPMQlNtFFseRGj2nH74FbFlDec0YhUPEG0OsTPW8nB4+j0qMGdvqoIx2xgjSjo4Cs5/MhAL8lKyZr2AM37bgctilF0AuptlQB1qTqZokZxj42lXYnz5K2q4egj1Nmb7wJV0CWsn87vQV3TMCYwLbsAzrsE/ySBElWBg6iTPvTNywZGvP8ROU1x9677XF/pbKM9cM+OJFY3lxcH34W7rS3l22PY262nl0Wm6D6KvZIxqD/degGBgoyaQCYuPpDqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18)
 by DS7PR11MB6247.namprd11.prod.outlook.com (2603:10b6:8:98::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 14:46:20 +0000
Received: from BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b]) by BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b%7]) with mapi id 15.20.8182.019; Thu, 28 Nov 2024
 14:46:19 +0000
Date: Thu, 28 Nov 2024 15:46:08 +0100
From: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
To: <igt-dev@lists.freedesktop.org>, <chris.p.wilson@intel.com>
CC: <krzysztof.karas@intel.com>, <andi.shyti@intel.com>
Subject: [PATCH i-g-t v3] tests/intel/i915_hangman: Fix spin engine hang
Message-ID: <tjaif54c4ekuwkevjdspwzv5peoy66ovcyoowaauqv5jbobcv4@p5fvemmwlbhl>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: DUZPR01CA0225.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::22) To BL3PR11MB6409.namprd11.prod.outlook.com
 (2603:10b6:208:3b8::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6409:EE_|DS7PR11MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: 1430b9fd-b7e4-405a-d897-08dd0fbb6b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDdBWEZZcXhRRld2RlRib1M1TjVVRy9oc00xNk5ycTJuT3dOcGFWUnRkVUl0?=
 =?utf-8?B?RDRNcFYvMDVOTlByekcxb3JVYkVRd3NkdDBRR1h6RGtEZjhBckoyYjR2U0s1?=
 =?utf-8?B?QURDQ2NpaVgraitoOXorWXhwUHVRQjRRVGZyUlVTV1ZDWXB0dlJ4eDRTMi9s?=
 =?utf-8?B?QUw3L1NSYzh6WS9aVE9YMjZBVjRlUERDQlhSd3JrOCt4Q1Q1bUk1VU0yblVU?=
 =?utf-8?B?VVA0eXdjaDl6dUV1bDlPZURXSzR0WkFxNzNxRTkrc0tHVHJrSDAyM0FWU0F0?=
 =?utf-8?B?Rnp0NlZWSkxzamlHQ1pscnlXTjBJZUtOY05JM21CZHVNbUFqQU5UczdEUGhu?=
 =?utf-8?B?ZmU0cWdldjRWV084aUwvZldsZGlYTWZ0aXpKN3VWZWNQZlJNVmM1dm5IMGNa?=
 =?utf-8?B?YzlKNExWRllJUXpteW8xWlBJbWFKS1FLWVdTTUlLS2pQd08zQlZIR3FpelJm?=
 =?utf-8?B?RFRuL0Q5N0ZLUDdJM2ZCc2VLc2w2Q1k1V29MT0c4dkVSb0NVaTBsejI2TnJx?=
 =?utf-8?B?NlU2eGp4TzlMZGpHTzF4ekgydG9UZUlTRXNyc1ZSeU1JYUFHK2hxeFo0Njh1?=
 =?utf-8?B?MkluSnRaeWx5Nkw4eU41bmQ0Wjg5WjRHdXFFVFhYZVhXVCtTSDV2TlBxWGY5?=
 =?utf-8?B?SjFkZi95eDVjYlRENml6VzdrNzdLSkQzMWxDVEk5QTN0RHpCR0cyd3p0L1RS?=
 =?utf-8?B?MXp1Lzl1UEs0MUg2RVlnclMwM1lhTWdESURqU3lpN3gvUlNkeDZsS00xeWdC?=
 =?utf-8?B?U0NHRGh0WUdwVDQ5OEFPWjN6UlpHQTZyR3BlMm1Ya01odys3alJBdWJ1cytr?=
 =?utf-8?B?UE1HelMxQmpmNU9rRG04S2NnTGVQcjF5cTduNVdUZG5aQXBWajA1UlZIMDFa?=
 =?utf-8?B?NldCcEhORDM0WHh6cHVYZGhYMTh3VjdCQ05DK1ROOUFjM2kxdzZLL1hFYTJa?=
 =?utf-8?B?K2RWSmc3U2NIRkgvTC9hanllWm9iUW1TRzZXVVFVMWRIT3hxK0k1SFVnZTF3?=
 =?utf-8?B?Q1BwSWIwblNFNHcwSm41WnpDMldrcC9XRWxNMmVBU3plbkEyOEVLR2Z1c25R?=
 =?utf-8?B?aGNGNWQ1Ukk0Y0k0dVl2UjF6UUswaVF5bHJjcWlQL1drVndXeDcyVmpyQ0ZW?=
 =?utf-8?B?Rnd4YXJ5VHFKN0hLNnlZWUYzWkZuK1B1MnkyTjNoU05tU2JIVk9ZOWRZais5?=
 =?utf-8?B?ZDhmQTlabFZQZGI2UlNkVG90SGNQSkZaa25zOXN0YTJZR0E1L0xUejVqQVNE?=
 =?utf-8?B?ZWRiYmN6NmhIU0FqUS9ndmMvdjM2c05JVjYvYk9lT1dRUGRWaUVsQ0xxdHhH?=
 =?utf-8?B?eFBWZjAwN1dJd0pGMHpqazRPN0orUzRIOERCaVNPOFBNWGh4Rmp5VGlVZGp1?=
 =?utf-8?B?WlVxY3lDK3lHeFl4MXhhbHN3c1YxMjhhUFBocmxtdThLRVNNTGhiUzRrNGhZ?=
 =?utf-8?B?SFl4dGxaZzJCT0VwdDlvL3B1Z2xmQVJaOW1WSjN5dS93aXl6UHpzdmoxZjRw?=
 =?utf-8?B?KzRXNWVsWEdOWnpoV0FNKzhCNHEvc0Vwa2RaSi9WaUtVQTJjWE01UjlxbkpD?=
 =?utf-8?B?d2pnTWNVS1htVFFnd2xXUUJnOWwyY05xTUxJekNCUHRFTG5Ra1YzcUU1MHha?=
 =?utf-8?B?ZTMvWHF2QmxMaDJXYUt2MjNRMnBxSU4zQkhDSThhRHl3ZmM4QWtLYnlRRHBY?=
 =?utf-8?B?UW8vVTJHR3BQWXdWZzNiVkZjM1F0WVY3dlloWkJWNWEzS2lZajJlWGVVZkNP?=
 =?utf-8?B?ZFBlMHFnNk03MmxBN3hCbFNUZVZ0LzdqOTI2UEJRa2RZWDZ6OEczaFN1cFlz?=
 =?utf-8?B?bnhSbCtnUnlYemY5aXJDZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXN0WkROZFBoTkdzVWl0TjhvUytQeEptWnFRdkdFWCtqcUt0aVVWMytWRnNO?=
 =?utf-8?B?aG9vK0tnYlJ0VnA1UmZOVElGcGlRSFNjVEpXRk9OcDAwNnVaUEZ4Q3pENHR6?=
 =?utf-8?B?OFFpVjAwTzc0S2lrVElFMVJlQlZRK0hESjBNSlo5Z3JkMXBPR25oUVkvSFJL?=
 =?utf-8?B?K2tyMUtxWmxuYld6bDJ3SmVLTXhaTTdrb0kvZUNDY1pyS2UyTmllUE0vNmY4?=
 =?utf-8?B?Y1hiRDVlZlE2ZUV1d2NvVjFyZSt5ZHM5MkxrR084QTVJUzZNU2lQaytFZjNx?=
 =?utf-8?B?bWxSZWRKeXJHcDNLcHVra0ZndHJvZUlOc0F6MGM4Mkd0S0VDOGtPWFRkc0Jn?=
 =?utf-8?B?eE9CWHpMWGtPRkRqUkcySHMreXY5bVBxTnZYVHdZQTU0QTY2ZGdOQTRPMTlQ?=
 =?utf-8?B?SE1CNnkyUDMvN3R3WEhOSFlPYlZzTnBwT3dKUnlBWE9aci9PVnBFbms5Y2ZY?=
 =?utf-8?B?OHoyMkd2ZmNVcExGajVzV3lMQ2wzZStKY0IwTFQxSEo4NU5NeS8wMHlnVHNK?=
 =?utf-8?B?ZFFKbEpHOEJaUTJlZ3pUaVdtNnFEMUt5S1UzQlB0NngxZFJIL3ZSUitzbGdH?=
 =?utf-8?B?c2wrbDVMVnVIZ0wvaUJ2amxGTHFmNTdQUi9JZUVvck14aDcyK09BYUZITFg2?=
 =?utf-8?B?S0pZSlJFWi95OU5LZTlyUGVjMmluSW14RXl2QnpvV1hRdTg3ZDVvMkNucVdK?=
 =?utf-8?B?NTdkUEtUVXU2MG5WVUdhdC91aS84VFZYV1lhOVA3OGhJV20vUEdXS21tWWJ1?=
 =?utf-8?B?bmlqNmczWjZyQ3FDZlczZmpsNkl1SlU4RG5ZS2V6VWw5NGhpTzY1bDFCOG9S?=
 =?utf-8?B?dHlZK0s5eHJ1QXBTbVkvejc0anlVVEtOZlNnTEEvejZaK1pKc1AweFFpZVhZ?=
 =?utf-8?B?ZWNxcHhMSGNseENIUGhCU3Y4SmViNE95TWY2aTVGRk52dU5PVjZ5NTc2NjJq?=
 =?utf-8?B?SlRsaFo3blFVaXhVbEF1OGdHeVlaeE1PQk9ON2E5Ulo1ZGx2VGFJQkVkN3V0?=
 =?utf-8?B?S05oUktJK1NERlBCT2pnajhZdW03b3FybldPQ2R0MjJrTHFzVjNHZ3dDdWFu?=
 =?utf-8?B?Nm9wY0RUMjYzRFYvQU95UjRzc0oycVVKMU9oQkMwMnFMbVd2RC9YOU1SZ0Y2?=
 =?utf-8?B?S0ZGaTIvKzh4cjR1V05FVjBTSmdjL05kMnJxa3lkQTh6eUFwamdLYkNIMXBY?=
 =?utf-8?B?RXdyOXpEeGcvQ2k1aGc0MitiU2ZtM2tLZTZTN3Jpd0w4QmdybnNyY2V2dllQ?=
 =?utf-8?B?Rk5UaHZtQzM5dlppOUY3bVNFN0NMQk95bXRqLzZaaW0vNEt3U3FmN1pkN3Vy?=
 =?utf-8?B?djlIc3IvdFliaTZYWmdhdkhOZHNDKzljY0VIajBtRVJxbUlKUjAwK2ppbFNi?=
 =?utf-8?B?Y2JqRWJTaXZOTGh3WkthK3ZxcVJRTndvb2QvbFR0WXZLaFRJWVVXTkorTm9U?=
 =?utf-8?B?YVpXWk9pQW8vK1QxTzNFaTNWL2RIbXNobVNSajY2T3RoT0wzUU5BUmN5WU8y?=
 =?utf-8?B?R3VVTEt3VUtDdXV3S0dHNWtMZTdUNE05bDF4bEttbENTd0p5NW84U1FPaW9F?=
 =?utf-8?B?QVIxa01Fc0xyeUtSSjJJS0YrRTZyZGVPWHpmOHVnekI2VVFCVDZEYkJsemZQ?=
 =?utf-8?B?MStXSnY4OGdvMm8vZ0xtcjRZaUhuMmtRMzJwaFB0d0lBWkM1M0YwU0ZJWVdI?=
 =?utf-8?B?Ty9wWXpKTEcvcHh5QUdhK2M2b3ZWWTVYVG13RmFQbVdEbGN2cDhuZTBjVUV1?=
 =?utf-8?B?WjdyUUFJMTI0SVk0SFZBN3NMZUFlajV2cWR5bmVhZ3lMbGlxSWhxeUt2VjZz?=
 =?utf-8?B?dHJRMHl2bk5Oek9lTG9YeC9PTFJsSlR2VDVGYUc4QUpOQk13cnp4MzRxclBV?=
 =?utf-8?B?aUZCcW9KWWJkemc0ZnAwNkpBZkkwRUhqa29aZjlrblp2K0ZjVzNGekU0NWRq?=
 =?utf-8?B?WStxa2kyNXQwKzk4U3hwZ3I5bWlhOWNUNE15SWkwbXFSN2hlUUZyeXMxS0l2?=
 =?utf-8?B?Qm9JSWRoL0pFc0N6bmRwNUlVNkEzVlYrWW1oZ3FIVzh1bllLUlhYemI1b0tK?=
 =?utf-8?B?RDh4eG9ZQ3BhZDIrSkFqYmNtWHJXZjErbXQ0Z1JOZm16RG0va1laSlg0YlZk?=
 =?utf-8?B?MGJLejF6aFlRcklDZGlMeUhNS01jd1RWdlR1RWJGK1NrZEY1N1hSSWdSRXZp?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1430b9fd-b7e4-405a-d897-08dd0fbb6b8d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 14:46:19.5312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: teKo+6uv/Wirq37CrmeZPk/WlPyphJtoUT1TWWwDVGiBLu4dRTSY0iwWZ2w61qgFn72IUuCNruqqm2PHSqQUiKUxYAQTew8QGI21Jv29idE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6247
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

Apply workaround when running background spins in hangman test.
Disable bcs0 background engine when testing ccs0 and vice-versa.

v3: allign formatting to kernel standard

Signed-off-by: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
---
 tests/intel/i915_hangman.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
index a556eec53..ec47cde73 100644
--- a/tests/intel/i915_hangman.c
+++ b/tests/intel/i915_hangman.c
@@ -365,6 +365,12 @@ static void chk_err(int *dst, int err, int expected)
 #define ERR_FENCE_END  3
 #define ERR_FENCE_STAT 4
 
+static bool is_bcs_ccs(const struct intel_execution_engine2 *e)
+{
+	return e->class == I915_ENGINE_CLASS_COMPUTE ||
+	       e->class == I915_ENGINE_CLASS_COPY;
+}
+
 static void
 test_engine_hang(const intel_ctx_t *ctx,
 		 const struct intel_execution_engine2 *e, unsigned int flags)
@@ -388,6 +394,13 @@ test_engine_hang(const intel_ctx_t *ctx,
 	 */
 	num_ctx = 0;
 	for_each_ctx_engine(device, ctx, other) {
+		/* Wa_14014494547:DG2 */
+		if (IS_DG2(intel_get_drm_devid(device)) &&
+		    is_bcs_ccs(e) &&
+		    is_bcs_ccs(other) &&
+		    e->class != other->class)
+			continue;
+
 		local_ctx[num_ctx] = intel_ctx_create(device, &ctx->cfg);
 		context_unban(device, local_ctx[num_ctx]->id);
 		ahndN = get_reloc_ahnd(device, local_ctx[num_ctx]->id);
-- 
2.47.0

