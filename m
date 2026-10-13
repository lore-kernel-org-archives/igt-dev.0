Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D10ACC6B09
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 05:33:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D426F10E726;
	Tue, 13 Oct 2026 05:33:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA7010E073
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 05:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791869532; x=1823405532;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RURBIxBMhTGacSMcNEzaYtIUhYiDGcaBWTOWnKNLLh4=;
 b=VPKc3s0DjKeg1NmzzSPDiPv5q0/vgWofMU4/Ey4iuZAuIPbkwZXcD+Ik
 wpmWUOPC9VM9UbUq/mZBq17npFIpX741yvxirZGDnwqvv2E5b4Rm0WvBj
 0ljZaJ/QrrYoy0TNGicrsDJamzlyNrANQAN6Ut46tWnN446J74OaramNu
 /7gBkFDlzxqBrUC8CRv+3n8sUGeaeqvUAoaCoTIQMjJDAKuBUUCLuiwAH
 Bkte1o15TiMMzz8CuN826sNwCVFW7Dsy7ZmdvTn+0TTFvp1x/FNxP0Fur
 38SaqYjhyvhEpawalbKr+JuVhj9kRgUPt/q4AiTqLcZUT2CIw17A1wm8I w==;
X-CSE-ConnectionGUID: Qe+3X/bdR+CepcShYgNrwg==
X-CSE-MsgGUID: j7ZAf2CPRgyDg3gXy2AEmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="464905"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="464905"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 22:32:12 -0700
X-CSE-ConnectionGUID: vifVBv5FTn2NQYzeshrUGg==
X-CSE-MsgGUID: rS8U2Vx4RKyibRT92O9slg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="972126"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 22:32:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 22:32:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 22:32:11 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 22:32:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDipaWiu3/XhOy7yZvXz1w/unX8dvBc8w+UIdlKCrteXtSRCqzUQ+hM0t2aXulyzzhl++ur2j5oSftbYVe9euKGvxaH/V1n8nGoqA5J5+qq9Gnlhu0FSaehP3mc/Z5FYts5KliGO159D/uG15Z4WPaXXxOFe+dra4ESAcK6DntNPKW3ciWMvnOqC1xLl+6/3g9fZTcYiJWstJHCBCZmpnfu1pIxVRq/yI9Rz0zf7w699mc/bvT19IviIVIHBHhiO7MrtX0CTapgPoufbMAyZ8rR2AmJe81Yv4PYmKy53tQdDzvFTTaFLDAES0MHwRIjUrgJsB2QzJznt1IAktfqVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCj+/tizhFehWzCvWDkF4R0uMBDli/AVGrztLcEU3IE=;
 b=fwBcjP3RAWTeNsKVk0SnkdV1BcPqO6SzhrVvJr1jtOlC+XGl/cT3JrVakVEyJkSaTtiAyvPw4Zyu1scLDqH2aHYd/6EEEgeLzLUpoKoLzkxdmKwXj1KpO5M3ztcpegVNP6oouyep2vy3MPd3Wwu89HTm1ZSzZ+DWhzqD5LEENrXAAV7JHGs/p36Xgq+v2rZZ3AhaW7ow8zZ7o3efdRUM5OVcqLWc4xSBrNtyvAg5HJ6cLqj8pDop/T4nD1XUNESwSm6/aC3TC+hK5RQy2TMmW2pWcdOGgzREIVWpNpbp/5WmPbUMV3PhTFJ2SpQ4Z1+X+KOmCoOBlB37KO+Gk4Y4Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS4PPF691668CDD.namprd11.prod.outlook.com (2603:10b6:f:fc02::2a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 05:32:09 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0472.016; Tue, 13 Oct 2026
 05:32:08 +0000
Message-ID: <bd9fb870-486c-49f4-a992-c45e56d43f74@intel.com>
Date: Tue, 13 Oct 2026 11:02:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6] tests/intel/xe_ras: Add test for GPU health
 indicator
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <badal.nilawar@intel.com>, <kamil.konieczny@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>
CC: <anshuman.gupta@intel.com>
References: <20261005174702.2574483-2-soham.purkait@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261005174702.2574483-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0168.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS4PPF691668CDD:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a9f2e3-9e59-4b49-3bb6-08df28eb52e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 6EZQIs0eziv5/L4gjJEn1X6k1ALNvm5boPM5TaYRgEvzZxtruo8u8O3jKTAmD6jLstL4R7je3HnjZ/MIMp6ycYLuNdDyHJxWOY7yMtS+dq2q7HJiItQ3LBZt6MCXqaWLzLLaVqejg/KpWk6Ctyr1hcssM7uPc7uw3NKYASvarujgdGaOC2e+Wn97zjzMNRZWyg6haEcGxq96YiVJCG3ALBxEiMiJ4QhhpgC4VIPEhIOSak86GNRRBWZmB8VbUGlTnq2K/YkKaDT+7IFA1nUHDYHb6+Awtq33BPG7ox8DuR9IYPomHhreA2zcRlr+ugZ1s/qc8IwDbpH4UM5gPOmlHiOgLH6dTOOwOPEMgS72po/yngUZsv8mPWnohzcdC1PJO7lercYuUrRZigDv8wp2AP6/xHSWG1wzRJ2khNXvp88M9CCemYPvzYqn4DXlRGDoBvd6VYnK/g50Pfe6BNDkstP/3wtQhkl32wRzOjZHwrLNViDYU+zcno4onGUrU8nID922R4vwVDShqfD5TkpIygjPh+ugUNKzgSYkZU2dcbZ0hKmgnbdj212Dwp9lm3ArTk/zSNIzp5aJ3dU8J+c/pK25SjuYEP/+qMJ7NOJ2YxXpfpk0Dp5doCUnSmV/rqR64DO57bX9vrxWnbkIn+6drJ2VdVRwvbsxoiL8fZhmglY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0NyZXJ3REloa3QyaFM4WWY4WW9jZzUybEdGNnlWcjRCZzBiMDYrNmczYk15?=
 =?utf-8?B?bHdZL3VrWDl5WG5tbmRYdE9XV3dNUWR2dWFuSm1JYWhBVGxPdG96NmUrY1hY?=
 =?utf-8?B?UU1EbVNLQUpnUFNNZVVJQy92WmxOZlhiQ3pxQ040Z3VHUk9FTVJEdlgyR0hY?=
 =?utf-8?B?ZytUeExiR0xpeXB1UVFYbGk3c01ObnFoNTJVZGNaYnp0ZXhNVmZaWXNMajRo?=
 =?utf-8?B?ZFNqV3ZGaGV6M2ZLWHNnOUdVNkRqbC9Kd3BTV2RWb1hNYWpQNGE0TTcrMjIz?=
 =?utf-8?B?Z3V5SVBzT1c2dVZPcUpzWDJRakhUWEdkcThGTDNUdnpOOFBWRzVDNVMyOVBv?=
 =?utf-8?B?NWtkOFpyYThMSDB4UVErdWsxWTRoSGcxdEdlMytoQ213U2JFZnhpRU56WHYw?=
 =?utf-8?B?bFdmdGNQL09GenRpVjIxTzQwbjAvWEtRaWpNRzhKbGFiYW5YWTFVcm40dUJh?=
 =?utf-8?B?aGhsazBzSzgwdlY2Mkc0RHRxVHNRRXpHZkxWdWlDTXNuQmNDclRmUEFITnNi?=
 =?utf-8?B?RlBNM0VoOGs5ZitNNVFSbkV6VWhOc2pqeWRIZ3U5TCtnWTFPRWtQNkdFdDEr?=
 =?utf-8?B?a0tUc3l6dlpXOFZ1RzdQZE5iWHlXQkdSY0plUHZmWUNqT25KYjNid2ZqVlRG?=
 =?utf-8?B?V21ScWhmQXp2UDdSV1ZFT2lFbEFLVlltQk9FYitybkJBak16MUhUQnZwTGtW?=
 =?utf-8?B?VnJEYnExRStMTU01UmVYaXpDY3AyYkJNdmpGRnFjdlhQOEFHQjRVZDJEdk5T?=
 =?utf-8?B?QzJLRndZckovTFhGSHp4SG54a1VKZXZJdmpMTmtIbHpickZuc1plRWhnYXA1?=
 =?utf-8?B?QjFEYkFITVhlSXJ6TzZFYTYwY3g4YnRsWTNlaCtqL2VmaXlNaVBCNmRIYktj?=
 =?utf-8?B?UXk5RTNuZGYvUnZIMXhrbkNhOU9kd1llbjJBYmlpcWd0WnhXSHRtQlplOTFR?=
 =?utf-8?B?dk5mc0xwYzd6a2tTbmdLclNmb0VDeDhNRDJHOXlFYzJQVHI1ZThxRVQzbHNt?=
 =?utf-8?B?NzJ3WHlvczZhL3ZXMVIwQ3ArblRleGJtWTlyTm1RblhzSHJIOER5MEF4NE1q?=
 =?utf-8?B?SlUxbGtqR1VycW1tNkdZeEV1dnpKY1YzRklyMWtXSGplTUo1Vmd6ZVhtK243?=
 =?utf-8?B?R25iUUxBeWhNanc1RGtBMW4yaDQ4VkRvN3VvR3I3ZndxNVNIcGZMZnZ2WG02?=
 =?utf-8?B?MEI4OTVHekozaURnVmFZaXFLVHNTSW01M3RWRXpqY2RnWStNVEptL0cyd3JZ?=
 =?utf-8?B?QVA4VjV6UlpFYXRaZ3B6eW5SK1hmaG1YSHBuYnREcURkaXRDTGMwM3hNcDBq?=
 =?utf-8?B?TUkxWEM3RTB4ZkhFU1d3bEdmdFBZTW5vMU5lN09qSWZlM3hJMUcwdUhmMjcx?=
 =?utf-8?B?Tjc1THRleTJTc2w4RDBUaS9Yc1MxREV2S2ZYbFJOU2FPdm1leG53KzJxRk45?=
 =?utf-8?B?cVJVNzd2V29CM3ZSeUJMc0U4eGJBM2pCNlB2anpSOER2dDFlOEJiRUJYTVlK?=
 =?utf-8?B?OVorbFNudUZxanZxaXlQNDN2Z3BCRS9mZVh2N3dOQXMxZ09aV2RGZURKRUc0?=
 =?utf-8?B?L2U0TDE1aDFXZ1hMc3R1VWtsMlZaMmRlVXRhRnI4bmwxbm5vc3FsZExsZWVZ?=
 =?utf-8?B?UmpOOXJJMnFIcFZ2Uk4wVXhSYUIvdzJRZWJWZ1VkdkpNZmxacUVCQjYwYnpq?=
 =?utf-8?B?a1UrMmZMTXZUbFM2dlA1QXBFbm1OcUUwSklBL0p1TWhTVExWTkxOcjJDWkZR?=
 =?utf-8?B?bHRSUDJINCt6OUM2aEIvcStOUk14VWtybVlsMFZMTUE3QWI5VmJCRU16ZUE5?=
 =?utf-8?B?cVVpdkN3ZzZkTk1rZXMzdWFJNjZISGJ3MG00cU0waDdsQ2NlclVPOHpGYnJv?=
 =?utf-8?B?VCszbUFhMkxHOXhPaFgvTWlSQnpySEJqdkxobU9BczBTWEZJTS9GOVJ1emJh?=
 =?utf-8?B?L1hqTmw1Zi81b3k4WHlrUFI5U2kyamRaaVduRnVVQTBBYXlNc3dpYjdPSDRs?=
 =?utf-8?B?R1F2N1Z4bkd4TFpRZXFxLzM0RWQ3TXFuZGdBeWJ6bFNnSk5TTHZuMWFKdXV0?=
 =?utf-8?B?K3VnUzcxNlU5TmlMYTBLY0dsdWxBSzhiZmNQOEdBWHJ3WFVDMm9OVzdjazF4?=
 =?utf-8?B?UDM2NXdDQzFNbkhqRTRUNmtMQ2ZyU1RrbGxoV0Q0YWhtOFVodEVTdFVaWUNo?=
 =?utf-8?B?OGl4ZzRETWxSck11clhBMzFvS2pwNDFSWEFqZFI3TXJZeW4rQW90Y0o4U3lo?=
 =?utf-8?B?dGdMUFM4bXJoWUhDditBa0JSUkxjcHgzL1pqNGdSMXVCNFBTYVBMNUpuZkhu?=
 =?utf-8?B?YXRDM2o4N1g0SmVGZStPUDNwaFFxaFZXVldxc29WdGpVZVhYbWdyUT09?=
X-Exchange-RoutingPolicyChecked: KNLtHnIYjPITOZZh30FnPnEiTTJRiDQz4ZYm5BPsqeavEQVclcFll31Q/v8fF49FiFjqE9EY/bIbQgQ5w3gDpHs6YeR+eCB3yB9QZN+xRqnP9JWgCmZ5Z4r1Q46rPxtzkDfabytOQ5XKNuoywagEAakcky552mothZ0ZD6FmilZCHTsvvLiLNxLHc0e0FpeSF0NfyLasIlxU2oep1f2NXQyKPwPDrp+t24XbgpPopFRo4UatrfW4lIzTtzploayCjKAQfARccbBhQPU8kNIYv0iQ1v9AaGILJGcJGFwdx8Bn3cc9Lio7rAs063fte51GlwaqGxRdD601xNpYL4PU5w==
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a9f2e3-9e59-4b49-3bb6-08df28eb52e4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 05:32:08.6740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jTsLtMtXiM9FQZ7OvIhIWbUT47pCerVTyEDH1ET/U1gsrTTLi8ssk5A0ejVc2IknSI3QdqmZm/MtXNJagECyBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF691668CDD
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


On 05-10-2026 23:17, Soham Purkait wrote:
> Add a new Xe RAS test exercising the gpu_health sysfs attribute
> exposed by the Xe driver on platforms that provide the system
> controller. The attribute reports and allows updating the GPU
> health state.
>
> The gpu-health subtest validates each valid state by writing it
> and reading the value back, and checks that invalid writes are
> rejected with -EINVAL, guarding against regressions.
>
> v1:
>   - Add platform-conditional skip and exit handler. (Anirban)
> v2:
>   - Add dynamic subtests for each case. (Riana)
> v3:
>   - Add health state description.
>   - Store original health state as an index instead of a char pointer. (Riana)
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Reviewed-by: Sk Anirban <sk.anirban@intel.com>

LGTM

Reviewed-by: Riana Tauro <riana.tauro@intel.com>


> ---
>   tests/intel/xe_ras.c | 158 +++++++++++++++++++++++++++++++++++++++++++
>   tests/meson.build    |   1 +
>   2 files changed, 159 insertions(+)
>   create mode 100644 tests/intel/xe_ras.c
>
> diff --git a/tests/intel/xe_ras.c b/tests/intel/xe_ras.c
> new file mode 100644
> index 000000000..c98a10f00
> --- /dev/null
> +++ b/tests/intel/xe_ras.c
> @@ -0,0 +1,158 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <errno.h>
> +#include <string.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +
> +/**
> + * TEST: Test Xe RAS (Reliability, Availability, Serviceability) functionality
> + * Category: Core
> + * Mega feature: RAS
> + * Sub-category: RAS tests
> + * Functionality: ras
> + * Test category: Functional tests
> + *
> + * SUBTEST: gpu-health
> + * Description: Verify the gpu_health sysfs attribute accepts each valid state
> + *		and rejects invalid writes with -EINVAL.
> + *		The valid states are:
> + *		ok	 - The gpu is healthy and operating within normal
> + *			   parameters.
> + *		warning	 - The gpu is experiencing minor issues but remains
> + *			   operational.
> + *		critical - The gpu is in a critical state and may not be
> + *			   operational.
> + */
> +
> +IGT_TEST_DESCRIPTION("Tests for Xe RAS");
> +
> +#define GPU_HEALTH_ATTR	"device/gpu_health"
> +
> +static const char * const gpu_health_states[] = {
> +	"ok",
> +	"warning",
> +	"critical",
> +	"invalid-input",
> +};
> +
> +#define GPU_HEALTH_VALID_STATE_COUNT (ARRAY_SIZE(gpu_health_states) - 1)
> +
> +static struct {
> +	int sys_fd;
> +	int orig_health;
> +} gpu_health_ctx = { .sys_fd = -1, .orig_health = -1 };
> +
> +static void restore_gpu_health(int sig)
> +{
> +	if (gpu_health_ctx.sys_fd < 0)
> +		return;
> +
> +	if (gpu_health_ctx.orig_health >= 0) {
> +		igt_sysfs_set(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR,
> +			      gpu_health_states[gpu_health_ctx.orig_health]);
> +		igt_info("Restored initial gpu_health to '%s'\n",
> +			 gpu_health_states[gpu_health_ctx.orig_health]);
> +		gpu_health_ctx.orig_health = -1;
> +	}
> +	close(gpu_health_ctx.sys_fd);
> +	gpu_health_ctx.sys_fd = -1;
> +}
> +
> +static bool valid_gpu_health(const char *s)
> +{
> +	int i;
> +
> +	if (!s)
> +		return false;
> +
> +	for (i = 0; i < GPU_HEALTH_VALID_STATE_COUNT; i++)
> +		if (!strcmp(s, gpu_health_states[i]))
> +			return true;
> +
> +	return false;
> +}
> +
> +static void setup_gpu_health(int xe)
> +{
> +	char *health;
> +	int i;
> +
> +	gpu_health_ctx.sys_fd = igt_sysfs_open(xe);
> +	igt_assert(gpu_health_ctx.sys_fd >= 0);
> +
> +	igt_skip_on_f(!igt_sysfs_has_attr(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR),
> +		      "gpu_health sysfs attribute not exposed by driver\n");
> +
> +	health = igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
> +	igt_assert_f(valid_gpu_health(health),
> +		     "Unexpected initial gpu_health value: '%s'\n", health);
> +
> +	for (i = 0; i < GPU_HEALTH_VALID_STATE_COUNT; i++)
> +		if (!strcmp(health, gpu_health_states[i]))
> +			gpu_health_ctx.orig_health = i;
> +
> +	igt_info("Initial gpu_health: %s\n", health);
> +	free(health);
> +}
> +
> +static void test_gpu_health_state(const char *state)
> +{
> +	char *health;
> +	int ret;
> +
> +	if (!valid_gpu_health(state)) {
> +		ret = igt_sysfs_write(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR,
> +				      state, strlen(state));
> +		igt_assert_f(ret == -EINVAL,
> +			     "Writing invalid value to %s returned %d, expected -EINVAL\n",
> +			     GPU_HEALTH_ATTR, ret);
> +		return;
> +	}
> +
> +	igt_info("Setting gpu_health to '%s'\n", state);
> +
> +	igt_assert_f(igt_sysfs_set(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, state),
> +		     "Failed to write '%s' to %s\n",
> +		     state, GPU_HEALTH_ATTR);
> +
> +	health = igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
> +	igt_assert(health);
> +	igt_assert_f(!strcmp(health, state),
> +		     "gpu_health readback mismatch: wrote '%s', read '%s'\n",
> +		     state, health);
> +	igt_info("Verified gpu_health state readback for '%s' successfully\n",
> +		 state);
> +	free(health);
> +}
> +
> +int igt_main()
> +{
> +	int xe;
> +	int state;
> +
> +	igt_fixture() {
> +		xe = drm_open_driver(DRIVER_XE);
> +	}
> +
> +	igt_subtest_with_dynamic("gpu-health") {
> +		igt_install_exit_handler(restore_gpu_health);
> +		setup_gpu_health(xe);
> +
> +		for (state = 0; state < ARRAY_SIZE(gpu_health_states); state++) {
> +			igt_dynamic_f("%s", gpu_health_states[state]) {
> +				test_gpu_health_state(gpu_health_states[state]);
> +			}
> +		}
> +
> +		restore_gpu_health(0);
> +	}
> +
> +	igt_fixture()
> +		drm_close_driver(xe);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 1ac89bab7..3c2d4fdda 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -333,6 +333,7 @@ intel_xe_progs = [
>   	'xe_prime_self_import',
>   	'xe_pxp',
>   	'xe_query',
> +	'xe_ras',
>   	'xe_render_copy',
>   	'xe_vm',
>   	'xe_userptr_pressure',
