Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CFAC19F2E
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 16:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B206110E305;
	Thu, 27 Feb 2025 16:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dpgu/4LJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DC010E305
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 16:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740674355; x=1772210355;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9iB+KtfNUw4ABbn9pUEYkU2Y5yA8vAIZzUTFPTfyhvY=;
 b=Dpgu/4LJXKMsTiFe7usJy+B5Ud32LmNvxJkFGAkcG6o7c6Bc8PNy6coR
 bbY9cVxkkK9NksMVPbeevTvytBznVi+6iRzbj/4udZ6iNfQhjDdLdGk48
 3U45/SPXTyNMfxm/oyvqpo1NN1iBqyEcQXW1sZFe7jMKOM/HSSjEjvYWc
 ZwS+YWLHfY6PRmWTTHz/+X6nKcwEAHpPfdbGRcDktWMiDXWkomEmjnwCf
 LUbVa6r5aGv7vpRpfnjaKtCKib6lqN+hDxXxG0h8UxWIhpaogIcnm5gjp
 sJZDiqoW3e3yrYI9i1U59IXGoA8Rqd3mBov2sg8OOgu24BImwf49pNh6d w==;
X-CSE-ConnectionGUID: 0Uhx5ezMQAaYC8+q1qheLQ==
X-CSE-MsgGUID: eVG8tB0US3OANj6WtGIEpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="64045723"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="64045723"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 08:39:15 -0800
X-CSE-ConnectionGUID: rxDjg38DSAiuOV0VLrbfyw==
X-CSE-MsgGUID: iLQD9J8NRNO+qzUkWzYbPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="117100606"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2025 08:39:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Feb 2025 08:39:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 08:39:14 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 08:39:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=di9KQTc5g0ABOIQ4aQsVRdkh5QhfHjvh2cw5jQNmFxXIRkORU1gyRYbDwRBY0CgIvtcWZTogrLOMgjDuLIFiR9S/pBtGpTJWv46Xoi90xPNo00jGQTBUiSBoU83+ejvuNJNXfmyzoExTS4ebuPUGj5OGAaQ3d3BFqA0D4VOsLEoxkH3mTKPiPXzmlzCDCSe3lufJ0qC21Kp3rTM5O84nu0TXsyHLKfzECuPd2/wwrL45APDBiEc3aSzcbi3nMuK4FWY6ZHWZ2tl4QvL8MiZ1yn7fXLBmQuGXjsQuF7WKb68tzHEu6D86sB7dez0/Neytvx8IzPEO2Mi75V8m2evN0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iB+KtfNUw4ABbn9pUEYkU2Y5yA8vAIZzUTFPTfyhvY=;
 b=URaYqSCzmSv0aFJe0qbJcjslVQVdGfD7qV4LqYJMQf9os0EnKcw2ohrTuPrXOyS7RHKfbBB8HlyCtcCRCtba+4En3OQ1qZNUOGeujatHMNjnLkGUdd6v1tiCfbZyamf0VOO37egIfQ8V81ZSWr0vU/7e7rXBiWYhmg+xjNTqwWathixiX00eh4kcMa694VrMOulQqsubGzJu/thwMsM1NPXrD0xljisLxPQni8ES5kVYqaGK8HZywUFqe53wfRsLmwLWaLNeFt6VtPYaFPyesbEYuByFULmO/pNXli/NfwlkGuI4yCoopxvONU8y5oPU0Q0wh+oF6YjM2ucgerTyJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by PH0PR11MB4790.namprd11.prod.outlook.com (2603:10b6:510:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Thu, 27 Feb
 2025 16:39:09 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%2]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 16:39:09 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Manszewski, Christoph" <christoph.manszewski@intel.com>
CC: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "marcin.bernatowicz@linux.intel.com" <marcin.bernatowicz@linux.intel.com>,
 "Laguna, Lukasz" <lukasz.laguna@intel.com>, "mika.kuoppala@linux.intel.com"
 <mika.kuoppala@linux.intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/xe_eudebug: Add subtests for
 eudebug/SR-IOV exclusion
Thread-Topic: [PATCH i-g-t v2 2/2] tests/intel/xe_eudebug: Add subtests for
 eudebug/SR-IOV exclusion
Thread-Index: AQHbg6gdVclfnjjjPEmp4l6CHGVOQbNbZOqA
Date: Thu, 27 Feb 2025 16:39:09 +0000
Message-ID: <00ca857a63b73fe8dccc4ca1afde3d5bb140098b.camel@intel.com>
References: <20250220145912.37735-1-christoph.manszewski@intel.com>
 <20250220145912.37735-3-christoph.manszewski@intel.com>
In-Reply-To: <20250220145912.37735-3-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|PH0PR11MB4790:EE_
x-ms-office365-filtering-correlation-id: 901c5a4c-898d-4f26-250f-08dd574d4244
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bm5ENlFGTDVNOVhSTXgwVi9xN2RacnBkbXFRN0pkMWJWREVlSGtJbkZlWGxN?=
 =?utf-8?B?YkdOTjVCeUxBSG44dEFJYjAxQlpoQVhvZmk1d2JZS2VUWDUva0Vxa0Z0L3RQ?=
 =?utf-8?B?YmlHT0N4NlFYeklma1AvMzRlTWRxdkY1bWRVWHJsWWJ5cUFYUGFVcWd6bmVP?=
 =?utf-8?B?MHdTVFNMSEFsL0s2S2ZXUzZrdEhENkFtTk01QVZiSVlCTUI5QkxMcGtmbnFG?=
 =?utf-8?B?ejBmbU9hZGp6U3JKb3IzS0ZhRExpNVdWQjdPY2VGZk9UNnZmRk9sV2lSOE9W?=
 =?utf-8?B?V2R2V3pKZ3ZqYUxMUUcvbEsxL1lncW53azAyVDA0QkVzdmxEVGxUK29xOSth?=
 =?utf-8?B?OTM2WGdvUjJ5aFRTM3F1U1JTZGE0Z3c4ampaWXVsanVPaVhFcURSYjdsd2po?=
 =?utf-8?B?N1JMT083djNmVEl3TEU2K2VNbWs5ZC83c0YrZ1h2cGl2Z0x5K1NyRmxpakxp?=
 =?utf-8?B?UUNTN3lMUkN4c1ZBL3d1NmRaV2Q2czY1T09RV1hPWDlCOE4xY1JHdldaR21G?=
 =?utf-8?B?ZkpiaVF0UGsrZTFkby9mMG9rbVowN0gzOXFpMFJ1anE1M3lsaVRIZURpckoz?=
 =?utf-8?B?V2hpeXE2dVdCMnhheDNVZ21VTnJYQTV0R3IrNzNJNCtKWUQ4bitOZlRCOHdS?=
 =?utf-8?B?K2NEMGlPKy9IVGlRWFl0LzFKaDF3NkJzSjVpQ05HcUVJcVd1ZGs2VDJnd1Q3?=
 =?utf-8?B?UWJuYXVPYUpYR0ZUYy9BNGxCRU41K3gvZUNUN05XZ1ZyVWdNTUpwUVYrTGhT?=
 =?utf-8?B?N0crcTJQdTBHRFhyOWtqYXR2N0ZhNklQaW4xRnQ5WXZtQ3VOYU8xN2prNXNw?=
 =?utf-8?B?TG1yZ1dhOW43M1dtYmNXdTR6MDZXaksvNUpTVFBFT0NiMS91L290TzFQcVI1?=
 =?utf-8?B?WFF1dElDc1RsaDNTVDNnWWxwTjNKVEtIWlFTS216cW8zazJDcCsvVk1kVGIr?=
 =?utf-8?B?Zlp3bGxvanFJMFNnaUlOL082cThsSU83S2hCY1YvN0krakZ3OEJidWFkV21x?=
 =?utf-8?B?dXBIdWEvbXN6bzNZQStMbXpiS0I1d3N0NUpSMDJiVGNNNE9VaVRrNEgyMUZw?=
 =?utf-8?B?VjFTYllUcnNTOUZIRXNqa1M2TmNpZlZBSktRT2QrRHNSa2ttK01sQWxXNGFQ?=
 =?utf-8?B?SFlTTFFYa3duN0J0NVpwM1JsR1hxWVRIMXUwZkVaNU1tTVpRS0piQXR2WHN6?=
 =?utf-8?B?T1c4dVhmakRYVzNDWnJhbU9nejZneWpFYkxDSHByZGhBd0RwOHRpTzR2SDB1?=
 =?utf-8?B?NHV3YkoxcVZMRktoOCtxMkpWV2QweXpNZ0dWU0VJSEp3eG5mbjYxU3NTQmN6?=
 =?utf-8?B?ajQ2ZHU0SUxVMWFvV1RiQ3AvL203bDd0S3VoeWlSUjZZdEQ5Tm5VSW1HN3J4?=
 =?utf-8?B?QnVZaXRKdGN2UGFTYWJtWlZ4VnVMa0VDZmJHTHhZS1V3R0VLT0VCbW50MGhD?=
 =?utf-8?B?V1VNSTRReElOSHNVWk54VWlXWm1KM2Fvb2xlY1UvYWErQ2dOdUFETXQvTG1w?=
 =?utf-8?B?RU1MUjBEaW1aZEZYejFTeWZtdE1QZEJXMlZWMHZibzlHSTY1S0V1d0hkbW1F?=
 =?utf-8?B?aFU5b3FDZGNId2xjcUQrSGRGQVFGT1RacGR5VUZVQUMxU1dnc1lRNnVBa1Ur?=
 =?utf-8?B?cWJCOTBnSm5ySDBldU1wVDRHV3RKS2ltOFFCVVFMNGo0UHZsYkVBbENFV0sy?=
 =?utf-8?B?eFJSUU04ZkFKUGlxNVB5Skx5QnVVYVZhSzNNMDdYUW5DWDZSbHFhbkxTRkh2?=
 =?utf-8?B?ZXFYTjFZdnU2V0E4RWNEQnZYYm9UQldTdm9idUxkQVNFYjlxc00vVmlXVGRt?=
 =?utf-8?B?OHBHK29oUkNVV1BhKytJTElyK0JYcVU0TmtnMi9TU1l0UVp3bjR0TmVXZmlw?=
 =?utf-8?B?NGRjZzVvYmY3UlFJdCtUNS9VU1FoVnJUa0pmYU1PbUo3ZHFPcjUrbldIYWdr?=
 =?utf-8?Q?M4OD6dGW/+6/HqcEMShCBmCctTrOYZSn?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWgraE9qSmEwQitVNFF4c2I4a0dHb0IxTlhPWEl4TUFEeW9RL2V4NlNLZng1?=
 =?utf-8?B?eDArZW1WdVc1TVBweTNWMmdsYXFUOFpNaVM2TSttWFlOdnMvOWtpYmdvekJj?=
 =?utf-8?B?ZVRlbk9KUXd3Z3hTVEhMS3QrSVROL3pqVm1EK0NvdFBNR3NPaFA0TGp2ZWF2?=
 =?utf-8?B?eGl6SytFVzlONkFBdDRmbXlBV0RNREY2KzV1K3AwbUxMVmsrdERtOEg4ajlI?=
 =?utf-8?B?Y1NscWVEYlNqekVVWmlUU3BJdGp4MG5mSnRyd3lFeEFlNHNOY0VrY3JHZ2hF?=
 =?utf-8?B?MzNRREFkcFlHZ3l1VERSMVoxVHNrcmJjNCt3aFFkOFVjZmdPOEQ1TFFTaHo2?=
 =?utf-8?B?L1psMlVLNGQ2amJuMzAxc3RuZnhxUjg5WW5FZkZ2MFZ2WlQ2TG91Q0UxRERX?=
 =?utf-8?B?bWVreTJoUXBwVHFza0Z2ZXpQM0JTRXNWbHArYUs3TlZMY2Zrd2NHWHAwRFYv?=
 =?utf-8?B?ODBuVzV5dlR2emxLUkZzMmV1N1R1QWh1NnhXalJFbDhleHdWMERSQTgyaW5L?=
 =?utf-8?B?UkY4RGk4RHJqSUpSb3Y5S3pUSjZZWXBPeGpsQkY0RFBYYTQ1ZGgyU0ZQZHRB?=
 =?utf-8?B?NS9Hdnk4bElOWUM1SUZVUHJNa2ZNTml4OVkvWGVNSFMwY25QcFRqaGN6WUJh?=
 =?utf-8?B?QXZTdWdrRUZqbEJkYnA4ZlppdHNlU3BlNURidURyMUVLbDJhSG5kbVRpYVJa?=
 =?utf-8?B?S2o1UnhkYXFUU1B0REpMVWJTa3JhakpJakFwMzArK3NmQ0YxL0NZOGxDMnZy?=
 =?utf-8?B?djROS1RaVm03aEc2cW5NK3ZBSDhDa003cG4zYXhuQWREYUxzUDJyOGpYZVlG?=
 =?utf-8?B?V3FJNkFBMnF3azBKRElIeURyUFdVS3djNTRIOTMzNTR4UHMzVXl2K29GSUQy?=
 =?utf-8?B?Z2pKUTFQZ1AyRFVsK0NvajhCbnhCUnJwdTNDYWEwSnNiMkduZElRbUVPZnVa?=
 =?utf-8?B?TVNGaDBVQkgyTnluOVNFbnAzdVdnUUlhaU9vUjVUNVEvVlhCMFBRZHFVMXA5?=
 =?utf-8?B?YXd0QWZhSng0cCtXMkQ4SzFrajBIMVJIMy91QVhkclU4UGtaM2c3QUh6SmF6?=
 =?utf-8?B?TDlOckw4L2dIdzNNc3EvSmE3WnR5MXgreGZMemcvbnNFVFJua1VjQXVGTHha?=
 =?utf-8?B?cUNucnJtZDNRUWNzQi9RUkU5bFdPVFZzcFVjUFlGREJuSUI5ckhmZTcyMVVv?=
 =?utf-8?B?cGJnNHlucHZEc0NqaTRUU3ZHbEMxcGdVV3RmbVgwZ3F6R0RBUjNIQWJCR2ZY?=
 =?utf-8?B?dkROa1pldGtnSGlNZy9pVEZ3a2h3Qjg1OUNMaDgwRXp4cXdNMGVTaWNpTDNB?=
 =?utf-8?B?Z3RiS0ZseDRvdDJtcEJXMlpMc0RvY0ZsQnRHTnNuUnFYSDQ4Z0NkTjN2bW14?=
 =?utf-8?B?ZkdkR1VwZ2JjZzM0UllUc3NJMHA0azJQOFRkQkc1RDVIdzBlOUJMVnpZTEpX?=
 =?utf-8?B?RUdUNkx6M0gwQmRKdzJET0ZEcklHSXRyTlgycVR1bkpzeE1qN2pMdnNVZzhR?=
 =?utf-8?B?YkdLd0xpVVVDYXBwaW15Y1ZCTk9hQlZ6bHhmREZTMm05MzVZckhYQzBhSlgz?=
 =?utf-8?B?WS9JRHJBQ20xcEJLSThSNTZwRWZ6aXR5dHJIanoxejRTcnNxZEZaVFZMV0Rk?=
 =?utf-8?B?bE5McklkdEcrbys5aW92Q3JKYXhWWmI4eVVqa0NFcWt2VXE4MDhkUVNTc0FT?=
 =?utf-8?B?dUJkMVE2OUxtaEdwZEQzMC9QZU1FNWtablRMS3orYmo5cXJFcUVJY1pRZnVl?=
 =?utf-8?B?WUdXM05pV0pvKzN3b0RrcVBqUjZtbWVMNVEwaUNNTU51UGtSUTZvMGhQcVhx?=
 =?utf-8?B?QUNGb2p6NXNqcE9sRFJla0R4VFhGeVU1eStjcS95TWV4UmxCWUdQTzNXTlVG?=
 =?utf-8?B?SXZhNWFpNDIzQ3lMTVBSUExxQ3VHVEZKT0tDZWJoL1dZZlFLSVB2MVQ0d3JE?=
 =?utf-8?B?V0tXM1JybGQxREoxRmptY2JrSmF5cW5mS2poRjJ5VDc2Y0JZRnZXdEtlc1RM?=
 =?utf-8?B?L3pUUGVMcFpxOGJ1cXBENEEvT2NNc2wxejR5WmZicUVvYkFHaXN5WERUaUFV?=
 =?utf-8?B?ZGx4QkRDSmplKzcraUhZMjVWK0xicS82Mm5FNHlHL0daaWtaWjlTbVZrdTZx?=
 =?utf-8?B?TjBCUURsWUhndURpeXRtRlhraTBnYlVuVGExRUpUeUJQT1loWlRyUWV1UWp5?=
 =?utf-8?Q?mh01zTYT7uhK+JtdOHkqdOE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A911DE583A3D74186F0A806A9564819@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 901c5a4c-898d-4f26-250f-08dd574d4244
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 16:39:09.2217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h6BKiozPkeBjzDVLnFgzSP7yKoLPO1Ri22Iss0tCvmav8x52wILKZOGd1IrIjYjhETepCXDo91cafFR1QB5Tk0rPf5eBPy8D0lGg86DW/MM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4790
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

T24gVGh1LCAyMDI1LTAyLTIwIGF0IDE1OjU5ICswMTAwLCBDaHJpc3RvcGggTWFuc3pld3NraSB3
cm90ZToNCj4gRXVkZWJ1ZyBpcyBub3Qgc3VwcG9ydGVkIGluIFBGIG1vZGUgd2l0aCBWRnMgZW5h
YmxlZCBhbmQgaW4gVkYgbW9kZS4NCj4gUHJvdmlkZSBzdWJ0ZXN0cyB0byBlbnN1cmUgdGhhdDoN
Cj4gICAxLiBlbmFibGluZyBldWRlYnVnIGlzIG5vdCBwZXJtaXR0ZWQgaW4gUEYgbW9kZSB3aXRo
IFZGcyBlbmFibGVkDQo+ICAgMi4gZXVkZWJ1ZyBzeXNmcyB0b2dnbGUgaXMgbm90IGF2YWlsYWJs
ZSBpbiBWRiBtb2RlDQo+ICAgMy4gZW5hYmxpbmcgVkZzIGlzIG5vdCBwZXJtaXR0ZWQgd2hlbiBl
dWRlYnVnIGlzIGVuYWJsZWQNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBNYW5zemV3
c2tpIDxjaHJpc3RvcGgubWFuc3pld3NraUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50
ZWwveGVfZXVkZWJ1Zy5jICAgICAgIHwgICAyICsNCj4gIHRlc3RzL2ludGVsL3hlX2V1ZGVidWdf
c3Jpb3YuYyB8IDE1MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIHRlc3Rz
L21lc29uLmJ1aWxkICAgICAgICAgICAgICB8ICAgMSArDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDE1
NiBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvaW50ZWwveGVfZXVk
ZWJ1Z19zcmlvdi5jDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Zy5j
IGIvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Zy5jDQo+IGluZGV4IDc2ODcwODA1Yy4uM2VlZGQ1NDNk
IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnLmMNCj4gKysrIGIvdGVzdHMv
aW50ZWwveGVfZXVkZWJ1Zy5jDQo+IEBAIC0yMCw3ICsyMCw5IEBADQo+ICAjaW5jbHVkZSA8c3lz
L3ByY3RsLmg+DQo+ICANCj4gICNpbmNsdWRlICJpZ3QuaCINCj4gKyNpbmNsdWRlICJpZ3Rfc3lz
ZnMuaCINCj4gICNpbmNsdWRlICJpbnRlbF9wYXQuaCINCj4gKyNpbmNsdWRlICJsaWIvaWd0X3Ny
aW92X2RldmljZS5oIg0KPiAgI2luY2x1ZGUgImxpYi9pZ3Rfc3luY29iai5oIg0KPiAgI2luY2x1
ZGUgInhlL3hlX2V1ZGVidWcuaCINCj4gICNpbmNsdWRlICJ4ZS94ZV9pb2N0bC5oIg0KPiBkaWZm
IC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19zcmlvdi5jIGIvdGVzdHMvaW50ZWwveGVf
ZXVkZWJ1Z19zcmlvdi5jDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAw
MC4uZTgyZGZmOThhDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfZXVk
ZWJ1Z19zcmlvdi5jDQo+IEBAIC0wLDAgKzEsMTUzIEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogTUlUDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKpIDIwMjUgSW50ZWwgQ29ycG9y
YXRpb24NCj4gKyAqLw0KPiArDQo+ICsvKioNCj4gKyAqIFRFU1Q6IFRlc3QgRVUgRGVidWdnZXIg
YW5kIFNSLUlPViBpbnRlcmFjdGlvbg0KPiArICogQ2F0ZWdvcnk6IENvcmUNCj4gKyAqIE1lZ2Eg
ZmVhdHVyZTogRVVkZWJ1Zy9TUi1JT1YNCj4gKyAqIFN1Yi1jYXRlZ29yeTogRVVkZWJ1ZyB0ZXN0
cw0KPiArICogRnVuY3Rpb25hbGl0eTogRVUgRGVidWdnZXIgZnJhbWV3b3JrDQo+ICsgKiBUZXN0
IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QNCj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSAi
aWd0LmgiDQo+ICsjaW5jbHVkZSAiaWd0X3N5c2ZzLmgiDQo+ICsjaW5jbHVkZSAibGliL2lndF9z
cmlvdl9kZXZpY2UuaCINCj4gKyNpbmNsdWRlICJ4ZS94ZV9ldWRlYnVnLmgiDQo+ICsNCj4gK3N0
YXRpYyBib29sIGhhc19lbmFibGVfZXVkZWJ1Z19hdHRyKGludCBmZCwgdW5zaWduZWQgaW50IHZm
X251bSkNCkkga25vdyBpdCBpcyBqdXN0IGEgbml0cGlja2luZywgYnV0IG1heSBpdCBiZSBoYXNf
dmZfZW5hYmxlX2V1ZGVidWdfYXR0cj8gRWFzaWVyIHRvIHJlYWQuDQo+ICt7DQo+ICsJY2hhciBw
YXRoW1BBVEhfTUFYXTsNCj4gKwlpbnQgc3lzZnM7DQo+ICsJYm9vbCByZXQ7DQo+ICsNCj4gKwlp
Z3RfYXNzZXJ0KHZmX251bSA+IDApOw0KPiArDQo+ICsJc3lzZnMgPSBpZ3Rfc3lzZnNfb3Blbihm
ZCk7DQo+ICsJaWd0X2Fzc2VydF9mZChzeXNmcyk7DQo+ICsJLyogdmZfbnVtIGlzIDEtYmFzZWQs
IGJ1dCB2aXJ0Zm4gaXMgMC1iYXNlZCAqLw0KPiArCXNucHJpbnRmKHBhdGgsIHNpemVvZihwYXRo
KSwgImRldmljZS92aXJ0Zm4ldS9lbmFibGVfZXVkZWJ1ZyIsIHZmX251bSAtIDEpOw0KPiArCXJl
dCA9IGlndF9zeXNmc19oYXNfYXR0cihzeXNmcywgcGF0aCk7DQo+ICsJY2xvc2Uoc3lzZnMpOw0K
PiArDQo+ICsJcmV0dXJuIHJldDsNCj4gK30NCj4gKw0KPiArLyoqDQo+ICsgKiBTVUJURVNUOiBk
ZW55LWV1ZGVidWcNCj4gKyAqIERlc2NyaXB0aW9uOg0KPiArICoJQ2hlY2sgdGhhdCBldWRlYnVn
IHRvZ2dsZSBpcyBub3QgYXZhaWxhYmxlIGZvciBWRnMsIGFuZCB0aGF0IGVuYWJsaW5nDQo+ICsg
KglldWRlYnVnIHdpdGggVkZzIGVuYWJsZWQgaXMgbm90IHBlcm1pdHRlZC4NCj4gKyAqLw0KPiAr
c3RhdGljIHZvaWQgdGVzdF9kZW55X2V1ZGVidWcoaW50IGZkKQ0KPiArew0KPiArCXVuc2lnbmVk
IGludCBudW1fdmZzID0gaWd0X3NyaW92X2dldF90b3RhbF92ZnMoZmQpOw0KPiArCWJvb2wgZXVk
ZWJ1Z19lbmFibGUgPSB0cnVlOw0KPiArCWJvb2wgZXJyID0gZmFsc2U7DQo+ICsJaW50IHJldCA9
IDA7DQo+ICsNCj4gKwlpZ3RfZGVidWcoIlRlc3RpbmcgJXUgVkZzXG4iLCBudW1fdmZzKTsNCj4g
Kw0KPiArCXhlX2V1ZGVidWdfZW5hYmxlKGZkLCBmYWxzZSk7DQo+ICsJaWd0X3NyaW92X2VuYWJs
ZV9kcml2ZXJfYXV0b3Byb2JlKGZkKTsNCj4gKwlpZ3Rfc3Jpb3ZfZW5hYmxlX3ZmcyhmZCwgbnVt
X3Zmcyk7DQo+ICsJaWd0X2Fzc2VydF9lcShudW1fdmZzLCBpZ3Rfc3Jpb3ZfZ2V0X2VuYWJsZWRf
dmZzKGZkKSk7DQo+ICsNCj4gKwlmb3IgKGludCB2Zl9udW0gPSAxOyB2Zl9udW0gPD0gbnVtX3Zm
czsgKyt2Zl9udW0pIHsNCj4gKwkJaWYgKCFpZ3Rfc3Jpb3ZfaXNfdmZfZHJtX2RyaXZlcl9wcm9i
ZWQoZmQsIHZmX251bSkpIHsNCj4gKwkJCWlndF9kZWJ1ZygiVkYldSBwcm9iZSBmYWlsZWRcbiIs
IHZmX251bSk7DQo+ICsJCQllcnIgPSB0cnVlOw0KPiArCQl9IGVsc2UgaWYgKGhhc19lbmFibGVf
ZXVkZWJ1Z19hdHRyKGZkLCB2Zl9udW0pKSB7DQo+ICsJCQlpZ3RfZGVidWcoIlZGJXUgaGFzIGVu
YWJsZV9ldWRlYnVnIGF0dHJpYnV0ZVxuIiwgdmZfbnVtKTsNCj4gKwkJCWVyciA9IHRydWU7DQo+
ICsJCX0NCj4gKwl9DQo+ICsNCj4gKwlpZ3RfYXNzZXJ0KCFlcnIpOw0KPiArDQo+ICsJcmV0ID0g
X194ZV9ldWRlYnVnX2VuYWJsZV9nZXRzZXQoZmQsIE5VTEwsICZldWRlYnVnX2VuYWJsZSk7DQo+
ICsJaWd0X2Fzc2VydF9lcShyZXQsIC0xKTsNCj4gKwlpZ3RfYXNzZXJ0X2VxKGVycm5vLCBFUEVS
TSk7DQpJdHMgcXVpdGUgbGF0ZSB0byByZWFkIGVycm5vLCBpc24ndCBpdD8gDQo+ICt9DQo+ICsN
Cj4gKy8qKg0KPiArICogU1VCVEVTVDogZGVueS1zcmlvdg0KPiArICogRGVzY3JpcHRpb246DQo+
ICsgKglDaGVjayB0aGF0IFZGcyBjYW5ub3QgYmUgZW5hYmxlZCB3aGVuIGV1ZGVidWcgaXMgZW5h
YmxlZC4NCj4gKyAqLw0KPiArc3RhdGljIHZvaWQgdGVzdF9kZW55X3NyaW92KGludCBmZCkNCj4g
K3sNCj4gKwl1bnNpZ25lZCBpbnQgbnVtX3ZmcyA9IGlndF9zcmlvdl9nZXRfdG90YWxfdmZzKGZk
KTsNCj4gKwlib29sIHJldCA9IGZhbHNlOw0KPiArCWludCBzeXNmcyA9IDA7DQo+ICsNCj4gKwlp
Z3RfZGVidWcoIlRlc3RpbmcgJXUgVkZzXG4iLCBudW1fdmZzKTsNCj4gKw0KPiArCWlndF9zcmlv
dl9kaXNhYmxlX3ZmcyhmZCk7DQo+ICsJaWd0X2Fzc2VydF9lcSgwLCBpZ3Rfc3Jpb3ZfZ2V0X2Vu
YWJsZWRfdmZzKGZkKSk7DQo+ICsJeGVfZXVkZWJ1Z19lbmFibGUoZmQsIHRydWUpOw0KPiArDQo+
ICsJc3lzZnMgPSBpZ3Rfc3lzZnNfb3BlbihmZCk7DQo+ICsJaWd0X2Fzc2VydF9mZChzeXNmcyk7
DQo+ICsNCj4gKwlyZXQgPSBfX2lndF9zeXNmc19zZXRfdTMyKHN5c2ZzLCAiZGV2aWNlL3NyaW92
X251bXZmcyIsIG51bV92ZnMpOw0KPiArCWNsb3NlKHN5c2ZzKTsNCj4gKw0KPiArCWlndF9hc3Nl
cnRfZXEocmV0LCBmYWxzZSk7DQo+ICsJaWd0X2Fzc2VydF9lcShlcnJubywgRVBFUk0pOw0KTGlr
ZSBhYm92ZS4gQ2hlY2sgZXJybm8gcmlnaHQgYXdheSBhZnRlciBzZXQuwqANCkkgd291bGQgdXNl
IGV2ZW4gaWd0X3N5c2ZzX3ByaW50ZiB3aGljaCByZXR1cm5zIC1lcnJubyBkaXJlY3RseS4NCg0K
UmVnYXJkcywNCkRvbWluaWsNCj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQgcmVzdG9yZV9pbml0
aWFsX2RyaXZlcl9zdGF0ZShpbnQgZmQsIGJvb2wgZXVkZWJ1Z19lbmFibGVkLCBib29sIHZmX2F1
dG9wcm9iZSkNCj4gK3sNCj4gKwlib29sIGFib3J0ID0gZmFsc2U7DQo+ICsNCj4gKwlpZ3Rfc3Jp
b3ZfZGlzYWJsZV92ZnMoZmQpOw0KPiArCWlmIChpZ3Rfc3Jpb3ZfZ2V0X2VuYWJsZWRfdmZzKGZk
KSA+IDApIHsNCj4gKwkJaWd0X2RlYnVnKCJGYWlsZWQgdG8gZGlzYWJsZSBWRihzKVxuIik7DQo+
ICsJCWFib3J0ID0gdHJ1ZTsNCj4gKwl9DQo+ICsNCj4gKwl2Zl9hdXRvcHJvYmUgPyBpZ3Rfc3Jp
b3ZfZW5hYmxlX2RyaXZlcl9hdXRvcHJvYmUoZmQpIDoNCj4gKwkJICAgICAgIGlndF9zcmlvdl9k
aXNhYmxlX2RyaXZlcl9hdXRvcHJvYmUoZmQpOw0KPiArCWlmICh2Zl9hdXRvcHJvYmUgIT0gaWd0
X3NyaW92X2lzX2RyaXZlcl9hdXRvcHJvYmVfZW5hYmxlZChmZCkpIHsNCj4gKwkJaWd0X2RlYnVn
KCJGYWlsZWQgdG8gcmVzdG9yZSBzcmlvdl9kcml2ZXJzX2F1dG9wcm9iZSB2YWx1ZVxuIik7DQo+
ICsJCWFib3J0ID0gdHJ1ZTsNCj4gKwl9DQo+ICsNCj4gKwlpZiAoX194ZV9ldWRlYnVnX2VuYWJs
ZV9nZXRzZXQoZmQsIE5VTEwsICZldWRlYnVnX2VuYWJsZWQpIDwgMCkgew0KPiArCQlpZ3RfZGVi
dWcoIkZhaWxlZCB0byByZXN0b3JlIGV1ZGVidWcgc3RhdGVcbiIpOw0KPiArCQlhYm9ydCA9IHRy
dWU7DQo+ICsJfQ0KPiArDQo+ICsJLyogYWJvcnQgdG8gYXZvaWQgZXhlY3V0aW9uIG9mIG5leHQg
dGVzdHMgd2l0aCBpbnZhbGlkIGRyaXZlciBzdGF0ZSAqLw0KPiArCWlndF9hYm9ydF9vbl9mKGFi
b3J0LCAiRmFpbGVkIHRvIHJlc3RvcmUgaW5pdGlhbCBkcml2ZXIgc3RhdGVcbiIpOw0KPiArfQ0K
PiArDQo+ICtpZ3RfbWFpbg0KPiArew0KPiArCWJvb2wgZXVkZWJ1Z19lbmFibGVkOw0KPiArCWJv
b2wgdmZfYXV0b3Byb2JlOw0KPiArCWludCBmZDsNCj4gKw0KPiArCWlndF9maXh0dXJlIHsNCj4g
KwkJZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsNCj4gKwkJaWd0X3JlcXVpcmUoaWd0
X3NyaW92X2lzX3BmKGZkKSk7DQo+ICsJCWlndF9yZXF1aXJlKGlndF9zcmlvdl92ZnNfc3VwcG9y
dGVkKGZkKSk7DQo+ICsJCWlndF9yZXF1aXJlKGlndF9zcmlvdl9nZXRfZW5hYmxlZF92ZnMoZmQp
ID09IDApOw0KPiArCQlpZ3RfcmVxdWlyZShfX3hlX2V1ZGVidWdfZW5hYmxlX2dldHNldChmZCwg
JmV1ZGVidWdfZW5hYmxlZCwgTlVMTCkgPT0gMCk7DQo+ICsJCXZmX2F1dG9wcm9iZSA9IGlndF9z
cmlvdl9pc19kcml2ZXJfYXV0b3Byb2JlX2VuYWJsZWQoZmQpOw0KPiArCX0NCj4gKw0KPiArCWln
dF9zdWJ0ZXN0KCJkZW55LWV1ZGVidWciKQ0KPiArCQl0ZXN0X2RlbnlfZXVkZWJ1ZyhmZCk7DQo+
ICsNCj4gKwlpZ3Rfc3VidGVzdCgiZGVueS1zcmlvdiIpDQo+ICsJCXRlc3RfZGVueV9zcmlvdihm
ZCk7DQo+ICsNCj4gKwlpZ3RfZml4dHVyZSB7DQo+ICsJCXJlc3RvcmVfaW5pdGlhbF9kcml2ZXJf
c3RhdGUoZmQsIGV1ZGVidWdfZW5hYmxlZCwgdmZfYXV0b3Byb2JlKTsNCj4gKwkJY2xvc2UoZmQp
Ow0KPiArCX0NCj4gK30NCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL21lc29uLmJ1aWxkIGIvdGVzdHMv
bWVzb24uYnVpbGQNCj4gaW5kZXggYTBmOTg0YjM0Li4zMGQwNjdjMjQgMTAwNjQ0DQo+IC0tLSBh
L3Rlc3RzL21lc29uLmJ1aWxkDQo+ICsrKyBiL3Rlc3RzL21lc29uLmJ1aWxkDQo+IEBAIC0zMzIs
NiArMzMyLDcgQEAgaW50ZWxfeGVfZXVkZWJ1Z19wcm9ncyA9IFsNCj4gIAkneGVfZXVkZWJ1Zycs
DQo+ICAJJ3hlX2V4ZWNfc2lwX2V1ZGVidWcnLA0KPiAgCSd4ZV9ldWRlYnVnX29ubGluZScsDQo+
ICsJJ3hlX2V1ZGVidWdfc3Jpb3YnLA0KPiAgXQ0KPiAgDQo+ICBpZiBidWlsZF94ZV9ldWRlYnVn
DQoNCg==
