Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86773C5B572
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 05:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1213C10E0B8;
	Wed, 19 Aug 2026 05:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h5xdeeVj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5F510E0B8
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 05:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787117108; x=1818653108;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BEReQoEhwuYC8eTF+xCuaMdRHv/hzXDSMFFOs5cYZ1Y=;
 b=h5xdeeVjlyn6EE2TM+Ymd+RqUQwvJYFKIA6mpc4s8pbo8UvKvTT628Ai
 2EUnKrLToMmFAgGsK+NOD3p2k/l0qlOvl6fzNIx54dWMp+14EkUQfPkFn
 /qTF9YrD8lbE12+ZNNceM77AZeRMd/HbgYYxVKV5HTluPK8kiWK0tHfLZ
 MTEMoNmQeA21rLN3SnvER1iOlTx77fn0jnnQ4tnWHNIZdXdGo5ohH+GmF
 B6vKKS1YLbWJ/lE/gwzM9VO4YgiRwr2RpOJ8JUSOmDVMNkpE6Ier/LlEX
 AxiYO4PjI4buT4UocRkL7b1SumaSjOl9n4Uk7QMytj/FXUOMGbfaVXeiy A==;
X-CSE-ConnectionGUID: /vwGTXmvS8ymojwua1G+5Q==
X-CSE-MsgGUID: Ux3wH6wnSdecf1ZZATRTMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="75147518"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="75147518"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 22:25:07 -0700
X-CSE-ConnectionGUID: bFbXpl+6Rj+1YH+RfQpbNA==
X-CSE-MsgGUID: CwhdDY0hSaKAjqE5g1EQbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="264120219"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 22:25:07 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 22:25:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 22:25:06 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 22:25:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+SDHyFRelYD21EhySG7ck9kNgAK/g6uQ8pgxQ9y8aI6LJxRZDxA7T9U9fvLx4ADP8LiEjCaOVx3THQt22xqigmprUwZqJGNnbcWWUzxbSSvJkiowNWHlfzAidX1MLcc7T0QSKctcKN2xaoK24HWACQ2Q+SfAWvw7tpXtivuodhaBnL2OmQkXRcpBuAfFYQFJZC79EXvUeOTNfUUSvxzZAR1bLtAGcGIGv2YdbVQwK0fIQHJJAje5JULJaKXg9AqPKoJdI2m9grgZK4FIe/K0JEnYjor45ZIK24IOx4YBMpeE/PwsEsF7UcgxslaEkEJMLZPGRSIPxr36twY5+eaiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znGooG9mEH+Up09jzQ35/g/E0iizIadvf6Onacr09nE=;
 b=MfYE8+uCCSdZSD1Dib0Oa9W7tS+UPVPgDYgIIDVJWdkm0hdK0LtVpHJzEVioVqmzVI0SMDonLt40EfAuWNzoVlZwzqnYOj3AXL/6sTbEhwdFy1U4negleI9DQWmlzNSwiQf5CTifYt1CIPXchD7p5OEMq3bCRXHuB4MmD7VXLnFJyPmJhEPZvPWDzDdcHkZvWXnlefuE6Ejg00kINys5xYXOy9eJUVoagaFofJYnigzHljWy0sUYmAEmlmx1F5uWe+mxBwnIEKmQOb0VdKEUKPNH8UIDrdO0mJul3wWVHhe+8BbkOg5ygT8hdxylWHrCg7mMwJxc+P2oUjhLGXaD2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by IA1PR11MB6148.namprd11.prod.outlook.com (2603:10b6:208:3ec::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Wed, 19 Aug
 2026 05:24:55 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 05:24:55 +0000
Message-ID: <210afacb-8486-43a5-865c-f52befda3231@intel.com>
Date: Wed, 19 Aug 2026 10:54:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 6/6] tests/kms_color_pipeline: skip if not an
 intel device
To: Melissa Wen <mwen@igalia.com>, Harry Wentland <harry.wentland@amd.com>,
 Alex Hung <alex.hung@amd.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kernel-dev@igalia.com>, Swati Sharma
 <swati2.sharma@intel.com>, John Harrison <John.Harrison@Igalia.com>, "Rodrigo
 Siqueira" <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>, Xaver Hugl
 <xaver.hugl@kde.org>, Uma Shankar <uma.shankar@intel.com>
References: <20260811143558.141813-1-mwen@igalia.com>
 <20260811143558.141813-7-mwen@igalia.com>
 <62e1b4a3-ba46-4117-a3e3-05f9866aa614@amd.com>
 <83fb4a66-cf7a-4ebb-be39-d3f51da4baa6@igalia.com>
 <9e390216-298b-45c5-9ca7-f8b65ae957da@amd.com>
 <4a5e0dea-1a44-4e5a-97c5-530e61a92ee3@igalia.com>
 <2216cc39-92a4-4472-93c9-96ac89b8d6d7@amd.com>
 <84512c69-f783-4ce8-ad7a-ab9f1d75de72@igalia.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <84512c69-f783-4ce8-ad7a-ab9f1d75de72@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0175.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::6) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|IA1PR11MB6148:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c9fea7-8940-4c91-8a75-08defdb23418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|7416014|56012099006|10067099003|6133799003|3023799007|22082099003|4143699003|11063799006|18002099003|921020;
X-Microsoft-Antispam-Message-Info: bVe7wkwUcc+SbkziouCQj4ias7ULHylRnEXIUtON4eyPSnbwJfV73maJqKWtRS8hr81Muod1lYbacGJ/yzYngc8vB+4LcbOdsgAnXpzJzaY9bxp8umnf3KuxuvKK8vESDHcdxeM0DHhOzhpqtdQaKbyGuDSU9aqFvLKV5sTmUNWzby61y1q3u8Zf3V60Xej8Xgcy5yvD/osj63QR72cCXHaqPsbMO9hmCDVFIjO844SMmZu4QzjOtUQWfT6O6mGcg1XruEhHxwKAcOkfi8pr1IC6CB1LoXsFs8556c3WEpFryk7naklqd/GrG4P6I8ljM3ben82KEwGISgzMST9gqLyV2nfFUIgTYFoW1Zd57sLzxbIhnZutjBYv/XY1OdbRvEBy0LquLWXxRFbYQe567N+1eLFi1HDgkNIVhAo7jFgxMXreXzsmU5ULhGkpuh+UN9at9JxaQy0OTn0/qxRXAcLzlb2H5vUkJb8UhCxxsBJGV3+JJffyQAXmO0E7exuDmWBWCqJvXK5LD0FQpaYeCKln7583asgvu3mVTIh9Jy7/+VnsdJKQnHYgQq53S4EODzBJKCaYYWO1rPdFFkkiOHTrLcklto2zeKRCxeQuMjAkWfz5ZATJwVxJrfVT4zTDsxU/HZ/S3YojX3FkrvuaGqapxCVE1nxXaaOQuzAHupDf0tanHbqbUixjAZ3lSgpjriJiZjpxns6EFwLX1ZUZXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(56012099006)(10067099003)(6133799003)(3023799007)(22082099003)(4143699003)(11063799006)(18002099003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHNaZHpRaFdSZ0FiV0VaQ2ZhL2daVDZZS2diL296anFjZnRwMlZmRFBpOHQz?=
 =?utf-8?B?LytXc1h0TXdpb3RGZ1BxTEFudDdsSlFhRlFlcWJmbUhxMWlZa01NeUhnSXJN?=
 =?utf-8?B?cTV1TjB2SU5oSVdHK3I0eFFxM0UxYjNML0MvTG9nWFR2cHhxeTgxMVozR0sz?=
 =?utf-8?B?djRMZlVhZlY2NGxUK1VwZUEwRm9paU1oN1RkcjRyc005RXNYZmlNUW10MGJR?=
 =?utf-8?B?WmRKTjd2SDJHU3Q4dVdtS29zZGIzdk1VVVVmNzBqa2ZJRFB0UTNNeEZISkdD?=
 =?utf-8?B?RWVsTTY3Zjk0OWVHWVNQRUw5cm1RNHI1bGJLanVQMGRzVU5seFlDaTZEUG04?=
 =?utf-8?B?YndLZERWbC90WDZPSDFzU2dTKzExVWRyTWdsakdwRThSMHo5Vkk2eW5WRDly?=
 =?utf-8?B?eTRubGdpYXhOMlVpbkgrdldud3pYM0Y4ZEkrZ1AyOEt2WWNuMXloZFJha1M1?=
 =?utf-8?B?QTYrMGozVjRrc2FmQmM3RVJHU2x0WHZVa3pCbTlFYjE3elFzWXFrcGZjRlpE?=
 =?utf-8?B?RTN6djhLcHlXSWZRdEJMbGZoZHlzRkhGWkVyYmFWMFlBaG4wT0FGVldxQU9C?=
 =?utf-8?B?aWMxWHJSREdRUnFuSWoyOEUrZjArS1lLNFN0OHB2YjlsSzhJVHFRMU43YzV1?=
 =?utf-8?B?MXVuQnlKOHRqUE1zQmhzdEExRUFHNmNLaFd6M29QOXI1ZnRyY214UGpRMlJD?=
 =?utf-8?B?THhDWXFuMTE1Yk92TENPVVJoZ2V1RmxDSnZkeVRnS1BQWWVUcTMyTjZtY25y?=
 =?utf-8?B?U2tGUGJLMG11T0pBZ2lSblJYQ0NpMS9ZUWQvN3BsbGpmQWVhaXRodVZ2SjB1?=
 =?utf-8?B?MXdUSlRqVTkrMkdHZDltQ0s1cGdHbEtHMVJocXpMemg5dUhYenZyV0dZT0t5?=
 =?utf-8?B?aXBiM042bWVTenVnNUhSc05HekRXVkE0RmVMMWtGU1dmdkZPdko0WkMvWmIy?=
 =?utf-8?B?cks1dm1nLzR0MGg0SlAwRXI0QUFnTWJnZUxYNlJRNVRvUko1TjZkeUtiVmpP?=
 =?utf-8?B?cUZ2aEJ5UnR6RnMwcEQzVFVZdkRoWENjcjBRK3dsakdYSi9LK085Q1l3ZFpo?=
 =?utf-8?B?M2w1ZEpZL3B2SHRRcnl3TGxhenoyamRNcjBROVE0Ym5rYWpGZWFLeGJkdDRr?=
 =?utf-8?B?V3JJWHdlTVdWM1FacXdwaXNkUVFFUk1EU014bXh3b1JjaWlOdVMyVUVHZUs4?=
 =?utf-8?B?akZWaXlyTjV6bm9UbEhIaXVIVnlDSHAwRHloMklQa1pLNEF2Y3VDVDNYcTZU?=
 =?utf-8?B?TjVWb1hITUMxWkcyZU9SOGc1TWJQUE9OclJpcGkyTHgrbkErNUErdG82RGdk?=
 =?utf-8?B?dXBlbFhMcE53L1FZb09mcUpBK0o3N2htdWVud2doTWpOenZFQ1NQRDdmMzFJ?=
 =?utf-8?B?d0ZSM1EweFY3QTZVS2lFSnRZUU9QTjduendGZndVbUF5OHU3UnNOVGUralQr?=
 =?utf-8?B?VEJwTHhudkpMbGFHbVBlY0diNmNBbmJjZGFLWDdVZWVkeDdlUWxPa0kwVVNm?=
 =?utf-8?B?dFBjRXhNTGlZR0FVUDZoMWxIbllMRlNtcTZBNmlvMzFMTUxLdlRxZjdNTkN6?=
 =?utf-8?B?c0dmU3N3cjN2NzZRZjhUR1Vrc25wMlFTc01aWFMzazgxci8wVmYxb0VJUFdM?=
 =?utf-8?B?SlYwS1FpS2xtaDFyblZ4YzdWajhKSVJmNjlPY3BkQWFPOXgyZGhxQkpVZmhH?=
 =?utf-8?B?K2w2ODNoUFl1dlFUcGVaajFSRERwc2FxekY0M2dEVHI0YmdTd2xWcTdxSzUr?=
 =?utf-8?B?MnVPZ0swNFVrbTVDM05YN3J0Qzk0TC8xTEVTWXN5WFFBSW1ER1p4aS9KTkNl?=
 =?utf-8?B?czlJZFptNmxIWVEvTmp6YWFoYXlncUlVNSthRFpRNFZrZEU1ME56VThqZExI?=
 =?utf-8?B?YnA5dWRVTU9YclQxSDJXZ0pVQVBuazVBL05OVHBwMktMMlZIODdaa1FWK2RV?=
 =?utf-8?B?SzkxVUx2U3RJUWdSTE1vWkFDMU1JTVRhVndkeHk5U2tvdm1KWjBjangwaDdm?=
 =?utf-8?B?Q2t2a1ZvZjRYdElTVnREaXpZZ2djWmcvZldZcE9CSmdqNnU1VkZmRHdSNDBz?=
 =?utf-8?B?b2p6WWFFY3VOZUdtck1XR0xpdnhoNzhxak5ucU11Zmp0bUEvZ2xncXlMNXlK?=
 =?utf-8?B?b0VFbThWNHpRRzRUN0ZuaWc5RnZCYXdjc3VldnBmRGpKMDlqRWtRSXJiNUc3?=
 =?utf-8?B?dkVaUmVVNjNHNFA2L1I1Wjh1NW01c2RINnoyZGNqSnAvYUowbzRJV0laeHNw?=
 =?utf-8?B?TlU1dWhoaS9ta1RKT01VaTRwbnJraFd2UmVPbGtQN2JyNHFkZ0RyRTM4Q0tC?=
 =?utf-8?B?VWhCVGJUbXBESzVyejFIdHduVEpBZHk3U2Z3SmZPRVFCVTJ4bHUxdldsdG9D?=
 =?utf-8?Q?MBlKZ/44RN1a/4Q4=3D?=
X-Exchange-RoutingPolicyChecked: RRhIJyzYicFvtAJkGwtRCoCXeitwecvKQzSAhOwMULKZuLFboYVq3CWrJMifIIavOVapFkiNBPSJOY+pvp5lpltDTijTiXd5r7+YL8bW/SMzf3gOtcu+OaP9t/7lfSQppobNmZkYrGvHLCPhdKVwSH6CscvV76r3BsM6dxT+UOuh/A515FR+Y/N3Yqf721F3ISDsjTuZ9ATiuvwXagj1GCl4WXze4XK0coT/OxjKvdXKN47t9++zxZ7jJVPxk9ywMM3WmDRPKqs9zvpZLBqeDs+QNPYuV12lI3PIGwCmPPNVgxrUP380BKvrA4xKk7B0qbd41VvOzD/K39TV6dpqSw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c9fea7-8940-4c91-8a75-08defdb23418
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 05:24:55.6779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TzwWpSpV2CN5vIWWdSXjTqeozRH0G2rkXNLKgx9Ykrm8i07UxOOG2at1baGrB/yeUU1sBDGwwWo9xXmPYmW6TixQqudTIChTY0GqhOsWXy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6148
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



On 8/18/2026 8:20 PM, Melissa Wen wrote:
> 
> 
> On 18/08/2026 16:30, Harry Wentland wrote:
>>
>> On 2026-08-18 09:54, Melissa Wen wrote:
>>>
>>> On 17/08/2026 17:39, Harry Wentland wrote:
>>>> On 2026-08-17 11:19, Melissa Wen wrote:
>>>>> On 14/08/2026 05:55, Alex Hung wrote:
>>>>>> On 8/11/26 08:23, Melissa Wen wrote:
>>>>>>>    From documentation, the test requires i915 or xe driver, so 
>>>>>>> make sure it
>>>>>>> only runs with intel devices. In addition, it's a CRC-based test, 
>>>>>>> making
>>>>>> Should this test be moved to tests/intel/?
>>>>> I kept it as a KMS test because kms_colorop relies on writeback 
>>>>> support, but writeback isn't present in many drivers AFAIK.
>>>>> So these CRC tests can be used by other drivers if they don't 
>>>>> support writeback but support colorop.
>>>>>
>>>> In that case the test shouldn't have an 
>>>> igt_require(is_intel_device...). It should
>>>> use a generic check to determine whether it runs or not.
>>> What would be this generic check? Something like "CRC support && ! 
>>> writeback"?
>>>
>> Something like that might make sense.
>>
>>> I took this `is_intel_device` path because on one hand I think the 
>>> test could be an
>>> alternative to other drivers that doesn't support writeback, on the 
>>> other hand I see
>>> that the current design is not generic enough and I can't ensure it 
>>> runs well in
>>> other drivers - for example, rn it doesn't meet AMD's requirements.
>>>
>>> My reasoning was: "the test with writeback support is preferable 
>>> (kms_colorop); if your
>>> driver doesn't support writeback, work on the kms_color_pipeline test 
>>> to meet the
>>> requirements of your driver".
>>>
>>> I can check how it goes with VKMS and what's needed to make it run on 
>>> AMD (probably
>>> the active primary plane is missing here too). I just don't think 
>>> those drivers need
>>> kms_color_pipeline since they support writeback and color tests work 
>>> better by
>>> checking writeback output instead of CRC.
>>>
>> I'm just tired of seeing is_intel_device in "generic" tests. I guess 
>> that's
>> why Alex suggested moving this to tests/intel. One could always move 
>> it back
>> to generic tests if another driver sees value in this test and 
>> actually makes
>> it generic.
>>
>> I don't think a CRC-based color test would work well on AMD, and it'll 
>> likely
>> have challenges with VKMS.
>>
>> Again, not a blocker, just a statement about "IGT hasn't been 'Intel
>> GPU Tools' for years", which is sort of true and sort of isn't. It's a 
>> bit
>> painful for parties that decided to use it that are not Intel.
> 
> Hi Harry,
> 
> I see what you mean.
> 
> I can add the generic check plus a debug message, but I agree with you that
> migrating to intel and only making it generic if there is interest from 
> other
> vendors is also a good path. So far, my reasoning about the relevance for
> drivers without writeback support is purely hypothetical.
> 
> Chaitanya, what do you think?

I think moving it to the intel folder makes the most sense.

Swati, do you see any issues for our CI or otherwise?

==
Chaitanya>
> Melissa
> 
>>
>> Harry
>>
>>> Melissa
>>>
>>>> Harry
>>>>
>>>>> Melissa
>>>>>
>>>>>>> kms_colorop with writeback more aligned with color testing and
>>>>>>> validation. Other drivers should work on adapting this test to their
>>>>>>> needs if they are looking for CRC validation.
>>>>>>>
>>>>>>> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>>>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>>>>> ---
>>>>>>>     tests/kms_color_pipeline.c | 1 +
>>>>>>>     1 file changed, 1 insertion(+)
>>>>>>>
>>>>>>> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
>>>>>>> index 78860a845..3978745a5 100644
>>>>>>> --- a/tests/kms_color_pipeline.c
>>>>>>> +++ b/tests/kms_color_pipeline.c
>>>>>>> @@ -372,6 +372,7 @@ int igt_main()
>>>>>>>             igt_display_require(&data.display, data.drm_fd);
>>>>>>>             data.display.has_plane_color_pipeline = 
>>>>>>> has_plane_color_pipeline;
>>>>>>>             igt_require(data.display.is_atomic);
>>>>>>> +        igt_require(is_intel_device(data.drm_fd));
>>>>>>>         }
>>>>>>>           igt_subtest_group()
> 

