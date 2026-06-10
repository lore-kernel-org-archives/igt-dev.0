Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15753CD8CB9
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 07:20:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B808B10E762;
	Wed, 10 Jun 2026 07:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+kWonby";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A2110E762
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 07:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781075976; x=1812611976;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PMuLXWVA0PdHlHeX/XV0pnn7+R9UIZzvtfH9bCc7A20=;
 b=J+kWonbyLTETB8/1h7t7Pw4MiOvwBuiVn+q5fWmcb26+F6H5TBuKe5+Z
 cUQw1Bi26vC4HkBZS0WBT33IVZt3hyMexmmh7+mkxaHCDmt/rr8n0y6F9
 C6UCXypXskolwSzWfX7AS+gkmt+Be42/qf9ngHzHG3WgLKlQiwnwNqcC2
 TRL4K2D3TtKhkPMqJU360ieO8cBcQSEt4KdNjuAiNqls8X84h6glGDTbH
 HpzgiZNob48HyZzCQ0/46Klk6tVZkkA0qRFmdYKni+DlEpSoOjbz+33RL
 FbIraTD2L7WhDH55VagDW7fx6LwDwPNWcSgtxxe5spEfVPvuEHtXy6tI3 g==;
X-CSE-ConnectionGUID: nhnMb+hYT/aMETJjMoWDnA==
X-CSE-MsgGUID: UMPe1wRCR5urHxfhq8enUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92534743"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="92534743"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 00:19:36 -0700
X-CSE-ConnectionGUID: llBjys8lRgCIJUp+AvmdUQ==
X-CSE-MsgGUID: +9yeXOSpSc+KYjdTaTB5Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="246113664"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 00:19:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 00:19:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 00:19:34 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 00:19:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gcVPKXTB2HnPSgjC2buVHw2G6BB4gOax6fpccGFS4y9oT4V5Tdt/iPeWwUN5FNXHccItpOsCzTI2/V7R3qDy82DS3WrXxJwtzRH3rQk1X+JBIIx//gEViSIEZGzmdaDyIxUpbbIVN9Cl1mSaiHfoQ5U3DBVOjnsQFs68zJhT1veDPJPBV/bkt6wgz9jLFYDYvMgy0EF5CXv1vnbbLkOSSXBHex14xGQGkQaKjEU5tgCg3XT+h5+oa85rIRnVH5gI2CIztTD/5pXIgW4u8+d9VRt47yCal4/nCUXr8JwYn99J+1dJb73EM3c+z4Ox8TLXLid2oidqnEHo8Hg0+Q6ZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvyG6Ixh/a9xn4koGMt1lSW1P8N+Qn85Xg8OntNZh90=;
 b=Ov59md+S4vyhztSvuIaECxOf38Q3Eqn8BXvr0vApp/hSkusll7NeGCyxY6cwprL0V/ggsZtBfX+4GkbPiR4lSSm4BeeaV/+Qt26DweCnvjKGmQywQilIoZZ911y51vnWnbV0UUA2ZMBZZfOg9XGzHxlyIDoGol+5n6gZFQL+ZA5i76h17icttK/8cFaI4zrx+6jcwPc/3zsvh57mxwIGntfIjK1C/ZQf4aJZUdXtnCH+fHWdRziKHO9BFkS7bhcXnvkHp0xbUZRaMukg86ITdfhqZdgYjEWWBn78UAmwZfHJOi+ZMeE93IS6hMBb1jZpqfQzoUDu22D+I5sK4uxQZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by DS7PR11MB7929.namprd11.prod.outlook.com (2603:10b6:8:e5::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Wed, 10 Jun 2026 07:19:31 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 07:19:31 +0000
Message-ID: <603cca6a-2aa2-48c0-af3c-044e2b09d669@intel.com>
Date: Wed, 10 Jun 2026 12:49:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/2] Revert "tests/kms_hdr: Move capability
 checks inside dynamic subtests"
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>
References: <20260609055659.1025146-1-pranay.samala@intel.com>
 <20260609055659.1025146-2-pranay.samala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260609055659.1025146-2-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0243.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::18) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|DS7PR11MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: d8140cb6-ff08-465b-5419-08dec6c09d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|56012099006|3023799007|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: quD7/nJhR2CtJTTUbycekDudZF2pTW+Op3bhG9ddFplDqqrnMTXwkXY73lYTgktLd1XVT8ud9DWFhV/rYsZ9wjeCKvxzb8aYRv/zQVmw4A3q9rk7XrcIqmu7wUzWYQtQ16/gHWWAlhCZxtGWChWmTDHqv7cZZXGub1Q9QOZYpnEa3qtWLDpPkmGwODmdOnAWYWhdd2DthxVqRq3yNUX5snsbvKwXVGqURR3/xhRMCaGcTC7tPIoGvJmVQiM/6dV3wSJFFsfqXy2a5cQui3IAyPf6s3gdlryBYFXeDAuCYq+5VgWwFF/WJ4nXTXDGkxgvwBnJTkbDp2W75Yh7pOxu2gCn4C7Q4TGlkx8tb3HMDirYRE43pfBKlIVF2XoMu3oRpKeKFTYkanew91cTwE69zDLgLsfNSWhlkb79ni0SORu7NTEelpLcA2UDpj6QblJGDCO7Y2Da8cjtZMSOT/9atT4a02CojyTLOSVP3sd63pyGcO+iYi8zDUe9mUtKzksfgSNyGsOumt1m2dVPOD+KlRxm2wurtBlx2HqFiSOyI2cvlkKYORJUD1/E/zOy7e2cKTPUIwnTjneTm7XuTQ7lzVZSWJVg5d0NOUQC2gQyCKuZw4k90wprlWjEWbPbd6Qw49FpB22+WzzVtOxqMU8/J5V6hKvZ7zsnsOu1Z982ZIRjzOgL8ExjRY4XfpIaJ5HZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(3023799007)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3d1cis5VEFBeU8zRlhIVDI0aWxmL3o0RlM4SmhMNThTQTB2eVcyd01RbkZU?=
 =?utf-8?B?Mk93a1IzMnp6MExNbE1OVzVULzR6Z3MrYU1TNEpXV1A2WW1aV1pJaUlNUlBu?=
 =?utf-8?B?NUN0Mjg3R0RKVFBMcXlhZFJISENTMHA3OGg1M3p6K3JWckhjbi9rVU5tNzF5?=
 =?utf-8?B?OHhFSjgzWmFrd3g4Um5aVkVQbkhoRnFpNVFzOHBYeksyRktxUm1yTzR2djNV?=
 =?utf-8?B?RFA5RWZ1ZitBb1Q2aDlTdGRBSEtlWUUvZW4wUUR6RVNZVzcycnRvY1lhL0dF?=
 =?utf-8?B?dDkzNzJkemFQV09IRkl5Q0lUdTlpUmJ1UWllNTlqSnBDYTZEZ3AwN3ZJSnpI?=
 =?utf-8?B?Tkp1dGdnZTdhd0VaS29PcENoQWtQc1ZCVjUrbjNiMm0rWWJuVWF2dXFJcUsz?=
 =?utf-8?B?NENKYjhpMDNodm1IYjZRc1A4WVpQQ1dvN0dXRlRTaDdFVW5lZlVvaU4yUTh5?=
 =?utf-8?B?WlM2OXM4cnlkaEF1YUI2TXhkQTZybG1BcEtXallha2RtTG95aHZFMjdXT2lH?=
 =?utf-8?B?Rk9jRncyaC9TbmVuUjU2K0NkZERieFpLWVJpK2c4Z0VLUldPNHNxbklZeVh0?=
 =?utf-8?B?cU1PbXUydGNId2c4UTNWUzVLRXNIM3IwcXFkQlplcGprT0N2VUYzZ1haR0ti?=
 =?utf-8?B?S2Vhd0x5YlZQajNtd1pMYVh1bmJ4S0xqakx4enQwSjFTbnJrQXVZUHYvcURH?=
 =?utf-8?B?S014eWJqRXVpcnB3SmFONG5va05qL1lGaHJMV2tUV2VkUCtCc3R3cStKZVgr?=
 =?utf-8?B?WlhPeWJlZ3NseVJoZzliQ2VIeVdXaWRHSnVUbTg0ei9zdU1PZHV2VnVPZ1pk?=
 =?utf-8?B?c3R6WHBzYS92MHc2bWQ0QjFhZ1EwaFlMWjhHSnNVQUN4dW5LcE80eWpidjdC?=
 =?utf-8?B?cHhzem9iOWs4L2VOYWFXKzYzRWF5V2lkWDFUamtqTDZUMUVmQ1hTaUpXQkFh?=
 =?utf-8?B?YXpuQVNhYXVBM3Zkb0V2d2xOT3BFcms2RVJuZGFsN1ZCUW8vODE5eFlEUlpG?=
 =?utf-8?B?NFJsR3pWS3pFclFEU1FlalZkcWwxZUtsZmVkODkzUmhtU0ZRRVFpcEVGMHhm?=
 =?utf-8?B?V2h1K1ZRQ0dFVDh1cVErREpqeWQ3bm12dTJFR1czRElSQXUwN25udFRWOXpI?=
 =?utf-8?B?aU1PUklLRGNhazIybGI0ODVyY0FIT3B5VW03eTNpN1F5TGdqRUFLQXlkRFV5?=
 =?utf-8?B?UzlkYzBZN1JHVkR3RnI4bEpPM2dmSGQraDBtZ3RCY0NJRFR3RkwycUpTNnFv?=
 =?utf-8?B?Q2p4cDdtZkhOMzhJK3RkRkd4YnI0a2NLOU1xMW5VZU8yQTN0RE4rdlFEMFV1?=
 =?utf-8?B?eXQvRDF5Zy94U1pSY3N1VXhPbkhGSEtPVkdjMVNzT3Y3OHJiMDRwR1NMSzhU?=
 =?utf-8?B?TVhFY09YejJMTmQwdGdlMXJXR3RaNlRsL2xOUnlScHBFN1dUSmFicmUzU09R?=
 =?utf-8?B?VVJzMDNQZy9qS2dTYngxd3lNUWVJSGhxZW8zV3dmVnN4Sm1IdmRpL1Nvbm51?=
 =?utf-8?B?ZmRGUlNrU28veTlqL3JicGJHOHhhR215R0xqbHpJeXU0MDNoQkhiaHFGa1FX?=
 =?utf-8?B?TFh6VE1Zemk2amVCMWllY1R6SDI1OHp4Vmx2Q0xzc2NUUGZadjRKSnN5ek51?=
 =?utf-8?B?ZURCL3hyWW1Mam1pa2hEaFNHZHJnVUVaR0xKMGxDbi9Ba0kzYWpZNm53WFZZ?=
 =?utf-8?B?c1Fva3dQSm9ybDNNOGNQUzhuNjRKbU1reEd1dUdicWZJbVRmOFZyWStXeUpQ?=
 =?utf-8?B?NmZwWHY0SHhmNGNCcVFFL25oMFhHTFNyaHZQaThQZDNLWjhaRlFSVlpKNkhN?=
 =?utf-8?B?ZGl3QlRLb1RjMGdWTTBlNDNZZFVyMHgwWGJMdStMMzZIdVlkdXZQemtjYzl6?=
 =?utf-8?B?UVl6UGJvdXg3OWV4UG9kMSttdjVzSURKK3lYVjBLTTEvTUw5MTZTeGczdTZq?=
 =?utf-8?B?WUFMWWpuQk50OCthc0czSXl1OXlyVEI4dExnc0tHMFd3QzNvOCszTWRpZGhx?=
 =?utf-8?B?UlAvcFpLa3QrWm1XMldwNXJqNnh3Y3lEakdnUDBqLzBTQ0lGUVRJQmpTY3Fl?=
 =?utf-8?B?UkFHNk0vc0tYT3oyQkJ0aERSUDlLV2dpSVVVSUZvb0lRRExaTG1YOGd4NzQ0?=
 =?utf-8?B?S1ZzSnMvQW9NVGwvRXo2eDRyTnpyZ0RUcjZaSDhaUm5RUytZWFZaNlVSTGpS?=
 =?utf-8?B?YXVTMHlLN0lhMXpZSDU3UDhLRDN1bmhTZVBaZU5hVFk3ME1KbXhkQnJxZEw1?=
 =?utf-8?B?RFRWY3VXMEFtajkwS2N6ZFBpTitQMmIzK2VtbncvTEZZSHUvdzQveHB0VENZ?=
 =?utf-8?B?M09FL2pZRGZwMmxndFZuMTBGVnNQUjE2RHRXZzdqdEJVemZuMnhoQT09?=
X-Exchange-RoutingPolicyChecked: Db1Lc2/fLo+eKmctGLvpAD0SizJ65Y4DeF9nqsP8D0tBoLXStX5aX5HlyNVVNj0UuzWynusUC7F5Ws/ExKoH2Vo+aREpWGEHkbIMG2beSOmcsczKOSINs5vGXpnQAVMe4QSIxm3y30RimFOwU0eq+GOGfzsn9lB8r3jl9Gblqx54cp9OX4LMqqUUdTCE4vCy6eLlH3E6FUib40ASE/to0c1vepI4XfSonHBstDtIl0CBXPommaVCXbrwTTtbp//inCuWJGikglP7v3RSAmCathHodDNUvkjWbzgyKNCDdT7y3llwg+GoTPlgQMokujgAGj4JZF5Zx4n+gCogJKaRMA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d8140cb6-ff08-465b-5419-08dec6c09d96
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 07:19:31.6207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8u3Ryn6+ADKabaGpCQJpoxKXKc+55WuK2daP5gdSVfRNLAchmpACqwQ2AQXF2dywaN2mS2JnCw2JUvap/YGxjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7929
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

Hi Pranay

On 09-06-2026 11:26 am, Pranay Samala wrote:
> This reverts commit d9667a6fd6468adcdb5542d741ac423339a20556.
>
> The previous change moved output capability checks inside dynamic
> subtests to avoid losing valid results when a later output failed a
> check. However, the real issue is in the helper behavior rather
> than the kms_hdr test flow itself.
>
> Move the checks back outside the dynamic subtests and restore the
> previous behavior. The issue will instead be handled at the
> helper/API level by updating igt_get_output_max_bpc() to return
> status, allowing callers to handle read/parse failures explicitly
> without changing the existing kms_hdr control flow.
>
> v2:
> - Update commit message (Karthik)
>
> v3:
> - Add the missing changes merged recently (Swati)
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_hdr.c | 175 +++++++++++++++++++++++++++---------------------
>   1 file changed, 99 insertions(+), 76 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index affd38887..7127a56b3 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -255,6 +255,17 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
>   
> +		if (!has_max_bpc(output)) {
> +			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (igt_get_output_max_bpc(output) < 10) {
> +			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
> +			continue;
> +		}
> +
>   		for_each_crtc(display, crtc) {
>   			igt_output_set_crtc(output,
>   					    crtc);
> @@ -266,29 +277,24 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   			for (int i = 0; i < ARRAY_SIZE(hdr_test_formats); i++) {
>   				prepare_test(data, output, crtc);
>   
> +				if (is_intel_device(data->fd) &&
> +				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
> +					igt_info("%s: No suitable mode found to use 10 bpc.\n",
> +						 igt_output_name(output));
> +
> +					test_fini(data);
> +					break;
> +				}
> +
>   				data->mode = igt_output_get_mode(output);
>   				data->w = data->mode->hdisplay;
>   				data->h = data->mode->vdisplay;
>   
>   				igt_dynamic_f("pipe-%s-%s-%s",
>   					      igt_crtc_name(crtc), output->name,
> -					      igt_format_str(hdr_test_formats[i])) {
> -					igt_require_f(has_max_bpc(output),
> -						      "%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
> -						      igt_output_name(output));
> -
> -					igt_require_f(igt_get_output_max_bpc(output) >= 10,
> -						      "%s: Doesn't support 10 bpc.\n",
> -						      igt_output_name(output));
> -
> -					igt_require_f(!is_intel_device(data->fd) ||
> -						      igt_max_bpc_constraint(display, crtc, output, 10),
> -						      "%s: No suitable mode found to use 10 bpc.\n",
> -						      igt_output_name(output));
> -
> +					      igt_format_str(hdr_test_formats[i]))
>   					test_bpc_switch_on_output(data, crtc, output,
>   								  hdr_test_formats[i], flags);
> -				}
>   
>   				test_fini(data);
>   			}
> @@ -530,6 +536,40 @@ static void test_hdr(data_t *data, uint32_t flags)
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
>   
> +		/* To test HDR, 10 bpc is required, so we need to
> +		 * set MAX_BPC property to 10bpc prior to setting
> +		 * HDR metadata property. Therefore, checking.
> +		 */
> +		if (!has_max_bpc(output) || !igt_output_supports_hdr(output)) {
> +			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		/* For negative test, panel should be non-hdr. */
> +		if ((flags & TEST_INVALID_HDR) && igt_is_panel_hdr(data->fd, output)) {
> +			igt_info("%s: Can't run negative test on HDR panel.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if ((flags & ~TEST_INVALID_HDR) && !igt_is_panel_hdr(data->fd, output)) {

Nit. Though not introduced in your patch. But good to fix this condition as

if ((flags & ~TEST_INVALID_HDR) && !igt_is_panel_hdr(data->fd, output))

> +			igt_info("%s: Can't run HDR tests on non-HDR panel.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (igt_get_output_max_bpc(output) < 10) {
> +			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
> +			continue;
> +		}
> +
> +		if ((flags & TEST_BRIGHTNESS) && !output_is_internal_panel(output)) {
> +			igt_info("%s: Can't run brightness test on non-internal panel.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
>   		for_each_crtc(display, crtc) {
>   			igt_output_set_crtc(output, crtc);
>   			if (!intel_pipe_output_combo_valid(display)) {
> @@ -545,73 +585,56 @@ static void test_hdr(data_t *data, uint32_t flags)
>   				data->w = data->mode->hdisplay;
>   				data->h = data->mode->vdisplay;
>   
> -				igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc), output->name,
> -					      igt_format_str(hdr_test_formats[i])) {
> -					igt_require_f(has_max_bpc(output) &&
> -						      igt_output_supports_hdr(output),
> -						      "%s: Doesn't support IGT_CONNECTOR_MAX_BPC "
> -						      "or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
> -						      igt_output_name(output));
> -
> -					if (flags & TEST_INVALID_HDR)
> -						igt_require_f(!igt_is_panel_hdr(data->fd, output),
> -							      "%s: Can't run negative test on "
> -							      "HDR panel.\n",
> -							      igt_output_name(output));
> -
> -					if (!(flags & TEST_INVALID_HDR))
> -						igt_require_f(igt_is_panel_hdr(data->fd, output),
> -							      "%s: Can't run HDR tests on "
> -							      "non-HDR panel.\n",
> -							      igt_output_name(output));
> -
> -					igt_require_f(igt_get_output_max_bpc(output) >= 10,
> -						      "%s: Doesn't support 10 bpc.\n",
> -						      igt_output_name(output));
> -
> -					if (flags & TEST_BRIGHTNESS)
> -						igt_require_f(output_is_internal_panel(output),
> -							      "%s: Can't run brightness test on "
> -							      "non-internal panel.\n",
> -							      igt_output_name(output));
> -
> -					/* Signal HDR requirement via metadata.
> -					 * A framebuffer must be present for the driver to accept
> -					 * a metadata commit. Use TEST_ONLY so hardware state is
> -					 * unchanged.
> -					 */
> -					igt_create_fb(data->fd,
> -						      data->w, data->h,
> -						      hdr_test_formats[i],
> -						      DRM_FORMAT_MOD_LINEAR,
> -						      &data->afb);
> -					igt_plane_set_fb(data->primary, &data->afb);
> -					igt_plane_set_size(data->primary, data->w, data->h);
> -					igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
> -					igt_hdr_fill_st2084(&hdr);
> -					igt_hdr_set_metadata(data->output, &hdr);
> -					igt_require_f(!igt_display_try_commit_atomic(display,
> -										     DRM_MODE_ATOMIC_TEST_ONLY |
> -										     DRM_MODE_ATOMIC_ALLOW_MODESET,
> -										     NULL),
> -						      "%s: Couldn't set HDR metadata\n",
> -						      igt_output_name(output));
> -
> -					/* Reset IGT display state; hardware was not changed. */
> +				/* Signal HDR requirement via metadata.
> +				 * A framebuffer must be present for the driver to accept
> +				 * a metadata commit. Use TEST_ONLY so hardware state is
> +				 * unchanged.
> +				 */
> +				igt_create_fb(data->fd,
> +					      data->w, data->h,
> +					      hdr_test_formats[i],
> +					      DRM_FORMAT_MOD_LINEAR,
> +					      &data->afb);
> +				igt_plane_set_fb(data->primary, &data->afb);
> +				igt_plane_set_size(data->primary, data->w, data->h);
> +				igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
> +				igt_hdr_fill_st2084(&hdr);
> +				igt_hdr_set_metadata(data->output, &hdr);
> +				if (igt_display_try_commit_atomic(display,
> +								  DRM_MODE_ATOMIC_TEST_ONLY |
> +								  DRM_MODE_ATOMIC_ALLOW_MODESET,
> +								  NULL)) {
> +					igt_info("%s: Couldn't set HDR metadata\n",
> +						 igt_output_name(output));
>   					igt_hdr_set_metadata(data->output, NULL);
>   					igt_plane_set_fb(data->primary, NULL);
>   					igt_remove_fb(data->fd, &data->afb);
> +					test_fini(data);
> +					break;
> +				}
Should this be continue instead of break? The TEST_ONLY commit includes 
the framebuffer format (hdr_test_formats[i]), so a failure could be 
format-specific rather than an HDR capability issue. Using continue 
would ensure we don't skip formats that might succeed.
> +
> +				/* Reset IGT display state; hardware was not changed. */
> +				igt_hdr_set_metadata(data->output, NULL);
> +				igt_plane_set_fb(data->primary, NULL);
> +				igt_remove_fb(data->fd, &data->afb);
>   
> -					igt_require_f(!is_intel_device(data->fd) ||
> -						      igt_max_bpc_constraint(display, crtc, output, 10),
> -						      "%s: No suitable mode found to use 10 bpc.\n",
> -						      igt_output_name(output));
> +				if (is_intel_device(data->fd) &&
> +				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
> +					igt_info("%s: No suitable mode found to use 10 bpc.\n",
> +						 igt_output_name(output));
> +
> +					test_fini(data);
> +					break;
> +				}
>   
> -					if (igt_is_dsc_enabled(data->fd, output->name))
> -						flags |= TEST_NEEDS_DSC;
> -					else
> -						flags &= ~TEST_NEEDS_DSC;
> +				if (igt_is_dsc_enabled(data->fd, output->name))
> +					flags |= TEST_NEEDS_DSC;
> +				else
> +					flags &= ~TEST_NEEDS_DSC;
>   
> +				igt_dynamic_f("pipe-%s-%s-%s",
> +					      igt_crtc_name(crtc), output->name,
> +					      igt_format_str(hdr_test_formats[i])) {
>   					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
>   						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
>   						test_static_toggle(data,
