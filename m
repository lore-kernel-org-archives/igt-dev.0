Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10513F433E2
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 04:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21F810E176;
	Thu, 16 Apr 2026 04:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yg5mE8Vg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FE010E176
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 04:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776313895; x=1807849895;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=M+y5JmvgsW70DF2eQg3RgjBCkfXpA5ZyMwpfw/F5rpU=;
 b=Yg5mE8Vg/lbQTOUTy+uyXlph1mPepjnmBct7lMH+eyMHkXGK1i7c/1Sl
 mFzQS2FH7taei2GracM1Iy4ETZvN75hmHrdQPiNg5/YnvbW69QWmivQhP
 i1zmFTIRoiTertm7d7i/IMss0alUUNQj/KW/nvNi1cs5ssc300wqkRQRC
 I6JcmcC7HWdlBIlVR01m1HGJMtUt6stxFpcid9plU9YZd+2K+sE1HeO/q
 znUQgURPkx7/wdgLIG2bq/SJI45yub1a8znBqfUgoyHnMwmeAv0Df5Oq2
 zV9EyaPjxw7K7dPIwfu2Hrfgk0X51Q8Q4ntkNheeTX0/SnNPvqtWvEqJ2 Q==;
X-CSE-ConnectionGUID: u8hNYPl+Tn+gGM6Et/+eJg==
X-CSE-MsgGUID: 7po17Y5DS2aOiL0tL5/bAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="81175866"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="81175866"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 21:31:34 -0700
X-CSE-ConnectionGUID: HbkgWjYQS1WqYv8zSs/8ug==
X-CSE-MsgGUID: 4E3Uoe8uSl+bapBbZFp93g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="234641031"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 21:31:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 21:31:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 21:31:33 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.12)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 21:31:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PB2bVEvfuQiP8cezniollaTpMaYUXbw42VcADs88KDbyw+gC/DgtO1Ys1dc9HtI4wHeuNtMUNRBnj/bRbtjOaG99ZvGSTo6NmdvR+xctsRC2vRhPjzFQMlq2qh5f0VyiQ/Uruz2AKkwzuZ8wspBtM7V3GoVmx/TA6H8gxslVeJ/fVHDkkkoUkZMqTOGrK3uSXEWomgn04PEC9o45cIAN4yjDtH1j3Ib9uKkNQQ4iEpdLHIdxrMfdVOzyznlnUcjeb5KYQtI3ZEY4gncbsIQa9X9WxR3K8WevP898yHkePd4V5ZbhTmqDKX9BJtbs47jWUnWaGifT6zqwiyX21NB+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxxIHwjBvqP40MtBCea58VQTqL7YHPXOIo305ujJmEk=;
 b=lxDxGz5kkLwmlq7K3TM+DPN+zOxT2dcABowrem7m+MFaF0j5gPyVmW4dJITYaw6ZPUpGup78A7yj9D6IP2A2qTxhPoTFx66xiw51L7444mXPUgYhnBpteJs1I1ktKhrnAMmdP/ZgGM/Kp7faWEMYlrIms7n13SrgMgVZ4A3Fo93dfynPVZMN2N3kK9UnctTV0t7Zt+4w3jLTXxWgoSQ3Kt/W31sltH+I6glQTHZJB+aHyCzyS/e4g1BJaIVtHPkyYLtah/4AqTw//BNhy9zrSsLgpgpeHXyd0Y6LIiqlrs/9/2JdXFFLbryvh5LPpYlnOdvHh0xglCmQ5wo05IkCCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by DS7PR11MB8828.namprd11.prod.outlook.com (2603:10b6:8:257::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 04:31:31 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%5]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 04:31:31 +0000
Message-ID: <9ff0775d-e568-46db-abb8-efad79ecb387@intel.com>
Date: Thu, 16 Apr 2026 10:01:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/xe/oa: Add support for 192B_MPEC8LL_NOA16 OAM
 format
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260415215257.898995-1-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20260415215257.898995-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0211.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::17) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|DS7PR11MB8828:EE_
X-MS-Office365-Filtering-Correlation-Id: cbad6c3a-a5a0-4feb-d8e9-08de9b710893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: ySD+noxpnSJTPEB234ZbNDzo7nNPIW2/qRITrurZpvtPyYnH0zTu8m4nokzPqR3KgP1yuWfQgdOdCCBHDiXhLfebp71uIlzFov2koDOIDczJ7O4cJUr1q0lDB2RZWe/4+YYp25lr8kT/lNXnsAfq17RE/wlwlfO6x6gBs3+2cyr56CfKjGYkJ3PDnikvxyFdjrNJ9PLPN/+chqsps1aC5apLW2tfxdgQlV5Bc77/iIrS6f0d7ICgdvGS61pSGOWzYWxvXohuXT/07gkedrRpvXO/GesvCIZjDDz/OaJ8PbfJmFQp9FR2uGRzVeuBXg5q1J3PaNXfjOaXHt4OQrTLnITxGp5CRpRwDMtNavlHj+FKkI8SrRTw/2Fj+pjjbK0rM9EQ2SGibXc1iaQGxBot0q4GQXavUogP2CaEfAvADCUeTMbT//otLEtov1XLJzJk2fELUmSZwHrZAbBpxQyGsE2hmkFSE6fAXX070HL35V53dlpnq2Lof1sG/CV62+dPS6WZfLLCB7NDCoGQGFJ0WNXrbD9hZPYyMqi7fzyatqc3XX49v1jJ7yV41S+phPUx2o/gkt7/RKi+IiM/tivRs0I1UkaSWHL72MK/g59YuxJzGxrmrQlLV2rYHujZ+/FlmOvURTvcj9vjNs+llg/DdKnaz/Agh+jV6You+N/zcsJFuncWCiIsq1eDq7y2VE/8KwICouhEHNWO9CUf3wB27WRNDJLn1soJkDTpr5brfig=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2svb0REVThZakIzdlQ3b3ZlbFQrRmtDL2xaQmRtQzk1aGxORm92Wlc4MWVY?=
 =?utf-8?B?N1pBTVh5V0J4a3hjMXY1RHhpcXBDSnFMeVFZQWhYRUZpT1JEaFM3bzZFbU5i?=
 =?utf-8?B?bkh3dHIxZ0JmOUx0RGZwN01MRFV6ckNIUjIvaE5tUTU2ZUhVV2FpNjJsc1hv?=
 =?utf-8?B?aXVtelZRN1lOZmZ2NDhuekd2SVRkVVNFaGlpbWpienlpVUZiblFBQVZPUUtE?=
 =?utf-8?B?Q1ZVNGVJeVhVMWVTTFM2NG9kWEdWK3JRM004cTBmZU9WUFdVU3dXVmJWZWFv?=
 =?utf-8?B?RDlzV1lLc1d5M3dQOEptWUVjVnhyRGhMNC92QXF0dTFyRjdQZ0I3ZGREMVRs?=
 =?utf-8?B?Mm56aVFpdFQ2dUltcEtrMklIcHFzckVwaDl2TDZMYmp4R1A4RlRBaDJDczlK?=
 =?utf-8?B?THV1eVVhSi9GYVVaaDlGYWZMWmY4b0VYNkF5bGFRcTJGYW44NHB2WXhBcHg4?=
 =?utf-8?B?bStjNTU3WEsyY3pWdmVVT2NvU1F1MVZ4NnVwQm5xekthM1RUVmV6OWl3aTQy?=
 =?utf-8?B?V1U3V3dFTXZ0a1NHdE03akQrdGJwdFNWT1NsYk1LVEd5NEF3YXcyOWVJQjJV?=
 =?utf-8?B?REhoMFN3cGJidkFxenlUS0JTc0tWR3hIZkd4bnlqeGlVcFJ0TmhWV1Y5WmpW?=
 =?utf-8?B?d3JVTHBzeFlOMDIrZHdqNmNVaU1aUTRIMWR3RFFERkZXUU5zT1Z1enVPblJT?=
 =?utf-8?B?ckVPYThDNUxhRFl4ZEUwV3JSaHAwZVZDMmwyQVdjOEtGaC9vQjUyaXF5aXRw?=
 =?utf-8?B?cjREcWpFSW5XTnJsc0p2YzRnMXNYYjF1Nk5zckZKSUNGdkxPTDYvNElKSXNz?=
 =?utf-8?B?TmJtZkFkM1NWTzFReDdKMWRINDZDR2dWU0JlZlhENEp6eFVSZ2dDMTBrZTZr?=
 =?utf-8?B?UkF1V2JMSHcwL0ZIZkZSNGpWQytmK0kwU29rcDllOFFuR0tXSEJoQVZ3ZFM5?=
 =?utf-8?B?V0Z0THlFWGVuc0NGOWdBOWhhRFZVamxrL3lXWTlSdXJab05FRCs2L0srR2Rm?=
 =?utf-8?B?YTF0V3N6ajhNYzV5UzFyNEhJS0FPQXQ2UnUwTkFONmptQXJGYXhBaHpKVmVH?=
 =?utf-8?B?WlBUeStkZ0Ixd2F6OEZSN2YySkN1Z1lxNmVTdVlyVnhxVjlWYnRtYjlrZG1u?=
 =?utf-8?B?ZHNnWVZFWGVPMG1obFZjQXFhU2lkRGNEYXdxbXo3UGxzUnhGcE5DT2lrMGor?=
 =?utf-8?B?OGNGQlcvcENvSlR4alMxL200TTdza2ZGZnR2c1RVOEw3TDlkNXFoNWZETlNJ?=
 =?utf-8?B?cm1MU2VUUjVjalZYZWJSWFk2WXlpb1grREVZVkJlbUdhVnpFVXkxZDVRQXFw?=
 =?utf-8?B?TmRiZzBWaEFpaHI2TndjekZnaCtVb3JDRFlRRWRxRTNaMitsNHBIS25BYkcy?=
 =?utf-8?B?QmN5V01NVTNoek9OM2d1VUNuWmNINDdHK1JFYkIvVTVnaFF6SjFaazRBTUNN?=
 =?utf-8?B?bUJKbldHOGNiTzhnWjYrbHRjZWppYW14VmZBRHA3WTBsaitnMHkrYWpES0hD?=
 =?utf-8?B?TW82TWFxOWdIZUcrSFlkdDJET0lMNWJsbndRUEZHWDVSQUFjM0RvVVZhaGEr?=
 =?utf-8?B?RWF1ai8rUDhScy9wSXQxUVI0UzRTMXNuSXNuS25rbTNvMFNzTnRTdzJ5NG0z?=
 =?utf-8?B?bTYvdTNBR2ZtK3pFaXZDS2tTRWh3Z3VUeU90YzBURU1PVnEzcVhDYmsvcy9l?=
 =?utf-8?B?eUJlRXJhZ09BYUNOMlRWZFJjVTBOcWhHcnhoV2E4Sm1WRzRBeGJpMUZpNlVD?=
 =?utf-8?B?aE5YeHNKNS8zWStjYnVHRUYyOVNjb0FBczhBRkpDQldlQmZUaFZmT3BoNlRZ?=
 =?utf-8?B?U0dGZi9GV2szanhTeDNqUUQ0QjFMNlZaRlZBRHF6TnpLSDJnVVdsT01yQ2Fa?=
 =?utf-8?B?VkJWQlM2VEwvVzVWa2Faei9IVTdCQ2xJYmhaZU9Nbm5jL0Jxcmk2Yjg5OTBL?=
 =?utf-8?B?eWl5d3lpUll4U3VFWWlWREczR2ZGS0d1VmplRi9oeHRVb2FiaFRuU2Zxb0JS?=
 =?utf-8?B?Z2RkQ1NJa3lYYStoeFpKR1VWYnZjek5sVzJ0aGZqL280M1VISjhOSW1kSXVu?=
 =?utf-8?B?VS84L2hqNllQVUZIUXhLcitoUk1yOWJZWUpmcEhoM1g0MjVmOS9TRm9EUzBV?=
 =?utf-8?B?OXlVUFEvSXBEcWg4WkhRNjFZUFJCdytTaXdDbjhHWDhBeVJ6Ym95S2RUOHRk?=
 =?utf-8?B?ZS9waGRHNExXK0pYZDQ5RE11N1Z4Y2taVjJhMmFzTml0ZlhQYkNDeDAyWnhK?=
 =?utf-8?B?cG1iUnliaHNScGRLTW5xck1xQ2RmUmpzbVkvd0JicUZPdG5QbUorNUlwOEZU?=
 =?utf-8?B?K3IvYUVlbEYyVnBmT0NmOHVVdXBFQ3BVZk9LUEVmb1RNQmhDKzYzcVhuRHZr?=
 =?utf-8?Q?XT/aNchpY8wSRF4I=3D?=
X-Exchange-RoutingPolicyChecked: dVyB5QteaoyLWF8dlj+wSYfP7PP4mC0y11x3bveoIyDAYbG6QSb3XQU26mfsPTjPSIC8R1e1reEah0QY04YfAZ7w3ANENStKCnvmn9FII/0Hm11QivdV7PcyzoRaLUXdD/6sw1b7jhJ0b3dno3Zm3XXS+R9TmawH+OT6a9CUHyscGVmKvolXe8ziUkm1IY7gJqdi+HrUILmLW/AtCd+KqCpLbw+UgheNzU3GtlIlzThsdL6WQwwQfx/1v0DVkAhQpTZpxKfZsZtPvrDl3yrkOrQpFpe6Cr/4kk9uUIPEdwx42uQTpozDz0dIRWK90zOvWTpuVUZKcjg0gQIAYie5sg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cbad6c3a-a5a0-4feb-d8e9-08de9b710893
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 04:31:31.4341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3GAUc7IBfMF96NsM/gwyrlw787SBIKkL+by7O7fn8yGHlmJTmoEqnvtx6RlMlq/GnuUgwFiZXrpohQfrv5rUeZ5gnaSq8XEPPXwimKyZNMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8828
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


On 4/16/2026 3:22, Ashutosh Dixit wrote:
> Support for CRI 192B_MPEC8LL_NOA16 OAM format was previously missed
> out. Add it.
>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   lib/xe/oa-configs/oa-metricset-codegen.py | 13 +++++++++++-
>   lib/xe/xe_oa.c                            | 24 +++++++++++++++++++++++
>   2 files changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/lib/xe/oa-configs/oa-metricset-codegen.py b/lib/xe/oa-configs/oa-metricset-codegen.py
> index c5c7a2c8d4..b44d4d73af 100644
> --- a/lib/xe/oa-configs/oa-metricset-codegen.py
> +++ b/lib/xe/oa-configs/oa-metricset-codegen.py
> @@ -139,7 +139,7 @@ def generate_metric_sets(args, gen):
>                       metric_set->perfcnt_offset = metric_set->c_offset + 8;
>                   """))
>           elif gen.chipset == "lnl" or gen.chipset == "bmg" or gen.chipset == "ptl" or gen.chipset == "cri":
> -            # See intel_xe_perf_accumulate_reports for the offsets
> +            # See intel_xe_perf_accumulate_reports for the offsets (value of idx variable)
>               if set.oa_format == "128B_MPEC8_NOA16" or set.oa_format == "128B_MERT_PEC8":
>                   c(textwrap.dedent("""\
>                       metric_set->perf_oa_format = XE_OAM_FORMAT_MPEC8u32_B8_C8;
> @@ -151,6 +151,17 @@ def generate_metric_sets(args, gen):
>                       metric_set->b_offset = metric_set->pec_offset + 8;
>                       metric_set->c_offset = metric_set->b_offset + 8;
>                   """))
> +            elif set.oa_format == "192B_MPEC8LL_NOA16":
> +                c(textwrap.dedent("""\
> +                    metric_set->perf_oa_format = XE_OAM_FORMAT_MPEC8u64_B8_C8;
> +
> +                    metric_set->perf_raw_size = 192;
> +                    metric_set->gpu_time_offset = 0;
> +                    metric_set->gpu_clock_offset = 1;
> +                    metric_set->pec_offset = 2;
> +                    metric_set->b_offset = metric_set->pec_offset + 8;
> +                    metric_set->c_offset = metric_set->b_offset + 8;
> +                """))
>               else:
>                   c(textwrap.dedent("""\
>                       metric_set->perf_oa_format = XE_OA_FORMAT_PEC64u64;
> diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
> index b2f447c944..d1a382bdd1 100644
> --- a/lib/xe/xe_oa.c
> +++ b/lib/xe/xe_oa.c
> @@ -875,6 +875,30 @@ void intel_xe_perf_accumulate_reports(struct intel_xe_perf_accumulator *acc,
>   
>   		break;
>   
> +	case XE_OAM_FORMAT_MPEC8u64_B8_C8:
> +		/* 64 bit timestamp */
> +		if (perf->devinfo.oa_timestamp_shift >= 0)
> +			deltas[idx++] += (end64[1] - start64[1]) << perf->devinfo.oa_timestamp_shift;
> +		else
> +			deltas[idx++] += (end64[1] - start64[1]) >> (-perf->devinfo.oa_timestamp_shift);
> +
> +		/* 64 bit clock */
> +		deltas[idx++] += end64[3] - start64[3];
> +
> +		/* 8x 64bit MPEC counters */
> +		for (i = 0; i < 8; i++)
> +			deltas[idx++] += end64[4 + i] - start64[4 + i];
> +
> +		
I feel the below increments are wrong. The added format is of 64bit.
> /* 8x 32bit B counters */
> +		for (i = 0; i < 8; i++)
> +			accumulate_uint32(start + 16 + i, end + 16 + i, deltas + idx++);
This should be "accumulate_uint32(start + 24 + i, end + 24 + i, deltas + 
idx++);"
> +
> +		/* 8x 32bit C counters */
> +		for (i = 0; i < 8; i++)
> +			accumulate_uint32(start + 24 + i, end + 24 + i, deltas + idx++);

And this, "accumulate_uint32(start + 32 + i, end + 32 + i, deltas + idx++);"

I'm still new to this, so I can be wrong. Maybe help me understand. 
Other than this, patch looks fine to me.

-shekhar

> +
> +		break;
> +
>   	case XE_OA_FORMAT_PEC64u64:
>   		/* 64 bit timestamp */
>   		if (perf->devinfo.oa_timestamp_shift >= 0)

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

