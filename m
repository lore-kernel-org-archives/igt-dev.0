Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6010FCD37B5
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 09:07:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0219810E503;
	Mon, 11 May 2026 09:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XtBXpA1A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B07C10E503
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 09:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778490423; x=1810026423;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YzAgpHB26vqENrwCi2onFb0wVGdxIineGXmh3ABmiGM=;
 b=XtBXpA1A3WfXOWI2W1HPfwGRmd6UXgHo0f7INvec9Vdgpb1hZLGazP8i
 NXySOkPx6a/PKuLMkE/KNHHqLoBM4j1rkSzmb165ay9z71bOlm6c1PbNk
 dFmff/Un9RiUIu5m2fgdwjrfCyMosD7poWF467vdSS6XM8BjwNMbIVGtO
 mCdWuEqkkRp37Zy5XBp4il21OBhu643+CTYuGV1t3NA2aY95225YSRVks
 l0e7YOg1AqkEQTynPz8RSj3RPabT9wLwfEgV501hIqZvsDvvVBaj7M98R
 b+6Lse27fT7QIETQjmmwF71oDLXR8oRRe1xXFeXy87/grQGtX3zoLRDht w==;
X-CSE-ConnectionGUID: uCfIk+mrTFGYMVjwIhWIDQ==
X-CSE-MsgGUID: /fykFQ9yTleXRsJ0kr8vLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="82984768"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="82984768"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 02:07:02 -0700
X-CSE-ConnectionGUID: etuxmBmPQ/WTOMZk8z4ZGA==
X-CSE-MsgGUID: 4BsxSvqCTqimr+Sl1jfOSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="242385137"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 02:07:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 02:07:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 02:07:01 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 02:07:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkethWQ3Gj3Cp+13woHGGsR7BVDqM+OomiPocMMMsBwruH8I4kOgQD+iLjoF3MptnyMmZ2zM2hREFfsZj8kdpG+JVwVpPIDESMYixAONhsIGnUvN5M7ai96j1z5cMRrAFHFz1QXRF7q7EFLcqJZ9NEBhy5Vfia3mWXT00nTJ2tgwH/erQRHdZuLLtfx39ikiZGfEJp9XMBc9DsCpNUUlHWkp57ltH3d1jVS0by01bZMcZ3bpsng+Z+DyMB+gt1rIMBU6/v0O/BgVI4J03f1XL3fmIlJ4Ti9urS1d6V+JrtMchCCRfhctaaJoN+Td9MgfHvAtWGLc80cyHAs36prJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wm5w4CCVj1SYuK8faTZ4yqTwCyxqLxzY71NmvZdLFis=;
 b=FBqETkghMG/Z/SiSme0yPynhcmy6k9fcOeTuAlp2qhOgJiZMF1hVlrAsM79XGWBnC8I57J1gcJiIYEAbbwzTA7Z/K0L3DnzF8DHh/28wNt2Aq91zlx95lQVVsKUlnmyZla08brzndNAmMWahpVVpwyew81sg1prKXfoKMqFmcZCZtLchsILs6dS1HxXvUe8mKLX66TpfWaHjm7ob1rxfL3RHFoOrgBxPNRaLjBUUU0bR+/N87VTDlBmFTF+XiWZzF3LGfvVv/SEhLc2zpmiLD24nafMiDtJRBmk5c8naKiP1L9WtsLUf9RFqCHLhNDp6iQZcuUf86eZ5TSLtIeIf8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 09:06:58 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 09:06:58 +0000
Message-ID: <4aa29c9d-2c96-48dc-b53a-3b34bd7edcaa@intel.com>
Date: Mon, 11 May 2026 14:36:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 3/4] tests/intel/xe_madvise: Add atomic-global
 subtest
To: Varun Gupta <varun.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260511035310.32323-1-varun.gupta@intel.com>
 <20260511035310.32323-4-varun.gupta@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260511035310.32323-4-varun.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0149.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::14) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|BL3PR11MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: 3af9dae8-1912-45a5-1f50-08deaf3ca7c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 9qpLdGWyFnkk+zKFnyf/JVEw/LoummAJJ0IKfbwB74r8lf2QxQgP1cF+CFUujTJ2LSSu5J+ErLkUD4wZs6NMEJWxOAW7dpyYpocRjzlF8Cam4uQxlH2TayuFtdR1hPulGXf7YiSBYXclLg/g05hvL1p4WafCwro8Dj5F1xbw5fM8OefdyCAB0YVJzgC7Qjr+tJ1CjdjFkgmErupIVnmcTYByt2Y3lFolTHPkaKEeEjjgGhv0xkdzN1qcT0jHQMx4hxWS2crk3Ui6kHN1og3UgEN32HZKKau+UhLHNErie98ywhs0BUOHshv7hrueuuo7+TbonLli8ZcmVEB169BqXZXB635VgMhBp0doLieTFIoGLaOMWQLTOzG0/w1WPKfILE1v27nW00NdbpIC96Da9Tws9/1ogJzOr4NC/YAet4gT5JDnoTjKeBT1OFgVludtrqwPTJ0i98DJGTbMnqVhviH15vlrnewL/X7kKbM8d2JQ74cLMnFwfrZOqeGdKdS26v8Z5XS8nFYmhQfXO2Fn0djnc5Fca2bEhqoAJY6OuZIh3ZmRrLJJfRkrLv8gVUy1uaTtaQot9jlGHDRCV3370l0t93/1vQy3x1+FiujvcHEBZYAxfzh4DgF5wlAQk9S0e3/YiBU5mR3bFcL4d7U1aIJTkSRiBe20ah0uZvs+ucSmmc3qQgDQGFzIzczOP7uN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2RPdEx0YnV1ZTdydWxQeWVzZjljVTcrS0g2dlNtbHAxZHNLTXpLNHdrVDcy?=
 =?utf-8?B?VEVHUllCREd6WVBPUzBWNTJMTGh2VHpJOVUrWE1aZmFXQWcxTmhRK2Zid3pT?=
 =?utf-8?B?MVFlcVNOWmluMHJ5Z1RsaTh2NW9XUndLZ29kTS80ZGtzU1lOZm9VWlkzT1o2?=
 =?utf-8?B?d29pQ1FEd3R4MFo1bTN0QUJoa09MclZuZGRPZGNDbmZqMmcvVUU0MDhGdXhn?=
 =?utf-8?B?cDRISlNIQUM5K2tpUHBEdDJMWDIyaDFOOTc4SXlaRzJIUnFmYkVDdFhxbWpm?=
 =?utf-8?B?bS83OEhwa0lmSGFCTnI5cGlXRlRVMzc5MTd0UkI3ZnoreDFiTUdxNUtGcnJy?=
 =?utf-8?B?MFFpMGttZU4wdHh1L0UvY1V1OFdsM0s4YnZycThDWThXV1lkRGpOaU14UzZa?=
 =?utf-8?B?WitFN0FlT3VPNC9hNGhjY1Z6bnRPSUZFaG9GVUMyNHJ3c0Y3dVFjcTE4aUNy?=
 =?utf-8?B?d2RFU0hCeFZuZ3JYK0RFTXFmeTRtZ3JYVWJWY1lHcUtWMjFSR291Y2VWTkli?=
 =?utf-8?B?eEtGV2ZUbU54bDdVcjQ3dkhUQ1RYaVZXeUh2MkF2UmdxNk9adUVzenVnd0xy?=
 =?utf-8?B?R2FMbndLb3JIMHBzdzhPVEtTTnJhRG9NaUtSOHJMSGVTdHpPT0J1UW10dnVD?=
 =?utf-8?B?bDQ1bXIzdHl4L3gzRkRsWUp1TGtNd3VkckpiWURxTXloVm0wRXlhY3h1MWRI?=
 =?utf-8?B?akdhditzUUIxbG5qSm1Jc0F4L1VNaG52ZHBGamlXMUJZa2JySlhycy9EbjEx?=
 =?utf-8?B?d2JuaGVzUnVGVUZYVEZ0M2k3dHRCdGkwQXFrNDNQcXJSSE81YWw3aFhGeFhh?=
 =?utf-8?B?M2s4SFFFb0lMYUg5Z24rYUhEMW91UXViM3dDZ25Zc3k2OFlRZmZtWEtIN3Iv?=
 =?utf-8?B?S0RFT1dyRlZobEIvZXpia2ZZTTlveDlsQmE1RjZQcHphalpwU0ZCeWtKQlk0?=
 =?utf-8?B?VlVLWnVIVGZHdkZhNk5PV3VUaTh2WGRpdndjNHRxbDRPYTZVZzhSYlljT3Ns?=
 =?utf-8?B?MTlrZHo4dExVUW80UGNMSEE5VVlJbzBLS3U2WXhGTFh1cVRld0lmMmQ1d1dJ?=
 =?utf-8?B?Nm5hRGFXQjlkNzhkRkZiVWNHOStybUZTeU5QenNUMy8yQ0xLVXVaNjZoK1Bj?=
 =?utf-8?B?bzE3MVBwMExLSnIwTmJyTHZaNkhHckxVbjVVdkdFYjBBVkV2L0NZZlVVMWVM?=
 =?utf-8?B?VFBuOTU2V3JTSlVSUlZxSnJxR05kaEtOT01QRVZneXJra0VpUVQzU2ZKM1JW?=
 =?utf-8?B?VndYU0pSWTBMck5mMStIWHQ1RUowbUNRaWF4cVFoemtEa2pFTk1YejZMOGwy?=
 =?utf-8?B?ZHhEQjY2TS95ZTBFOHlFVDB5TkYzU3lMNzZubDZUNUZ1RG9URFBRd01iOGtw?=
 =?utf-8?B?dTArSkVsNGxoVGNvSFJMSG1lMStUNTlONGRPYUZ1UFJMUXphTk1EZXhUTHpo?=
 =?utf-8?B?aVB4eU5EZmJLSjRsQ0FnR2N0d0RIanVHSjRBajdrV01zL2g3SUNNcGcvZkpp?=
 =?utf-8?B?bm1KN3U2VTcrcVByU1M3WHl4MFZFTDNoa2g0Z2t6MXl6T0tNUlNkRndhK25u?=
 =?utf-8?B?YjIvWlgrZGZ6ZktDcENHdWltYmp0b0xMMzNWVXNIVHJjVHo5QVk1blhQaWhu?=
 =?utf-8?B?RVVDa2o4RTJkUWpPUlJjSWF1R3Bwc056Qll1R0pwblEvOVF4SCtOOVFBeWdP?=
 =?utf-8?B?Rmk0cUgvVWxpV3F1d2FSeWVmTXJFUHpkZmh2QUJWWUcrLzdTYS9YVzBCOVoy?=
 =?utf-8?B?WE9CZzd6TEVvNXE4NmZueGNXMnY0R1ZzQ3h3UUVnbFpJVDB0SU5xNFhlNmtu?=
 =?utf-8?B?SjZTOE5IQUNRSk1XdVhnZ2VsMEJWZkN5K29vTWgzZVhLNzNGRWdXKzE0NjRk?=
 =?utf-8?B?dEEzNXhIeWphb2Q0UE4yd3F0TnEyNUxYUkZUcjlXR0VJdDVEMm4yTmJjN3Nj?=
 =?utf-8?B?eEV0RWdZSUc2RFVsZVVlVnRMczZTdmxreFVMUllPcVV6S0xMMnFhR0dTd3pw?=
 =?utf-8?B?N2lsRzNCSCtPbnJXSjcrdDJxME05Mzh4TzVveUhHc3ZiTnJuOWJ3S3Y2MlBS?=
 =?utf-8?B?Ti9NN0R0Z1IzWW84SHFnWUJ0OFN5TXpncFJ1MFpZSUdTMnp1Y3huZWlXQndt?=
 =?utf-8?B?ZW1jUjNGU1BKUTJrSkw1aDBFS0grcDhWYVJLWW9IVy95ZjJqazhBRmo1N29m?=
 =?utf-8?B?Q3hDc2J3bmptSTRzeTJyTXYvL1AyN01XVEptYklyRWRmMnZRaXlNam1nSTBQ?=
 =?utf-8?B?VE9wVlRYYnVBTlRnUU1WUWcrbTVMaTFNRDFzaW5uei9uamFuMUpFYlJqN0pz?=
 =?utf-8?B?Umg2dDJSZW13SUtXVVBHRlVxSzM1ZVN1VnZrMDFRVGZQNlVtOG0rZz09?=
X-Exchange-RoutingPolicyChecked: juoor5DxC46E+eGrt8ljq9xXaa/6JV5hAWXU9c/UE8/MH4jE6OHr38etLEptdccIpQUnH4cNCUbqKamoIkcAV0s7A4udRg8A+kATamDW0NvZjEI8dMdvuqNIhouwLg8cuO8qKGHVfHQegu7t2vcqvisrLLI08hi2Q1Nd4znWPh7SGkr4W/6Z8/I5X1ZEegk27EZ8PjkK5awNTJobRl8pnTsdBRupXFmw5ynE8hVHtn/CUF8+L7W2LqV0lkAddbqG5EnRdo74/uepGfdvMRqnCeqy0h24SxsS+04JcuMR15cp/kGWU6Zaxbo2zO8xsh2IBkAat+qDKflv/YpjGclq4g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af9dae8-1912-45a5-1f50-08deaf3ca7c3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 09:06:58.4045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOBbsT6cat2tmudjCee7TQ6WZ/BXynZbMfqQ/0K2lYsak0n9IUxnfx+TkexUNsJxz2DwVkb0J1DmadMRAZ+Jag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6362
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


On 5/11/2026 9:22 AM, Varun Gupta wrote:
> Validate that madvise ATOMIC_GLOBAL permits both CPU and GPU atomic
> access on SVM memory.  The test sets ATOMIC_GLOBAL on heap-allocated
> memory, performs 100 CPU atomic increments while data resides in SMEM,
> then executes GPU MI_ATOMIC_INC which triggers the page-fault handler
> to migrate data to VRAM.  The final counter value must equal 101
> (CPU + GPU increments).
>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
>
> v2: Add UNMAP of CPU_ADDR_MIRROR binding before xe_vm_destroy.
>      Add pagefault count print before/after exec (Nishit).
> ---
>   tests/intel/xe_madvise.c | 86 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 86 insertions(+)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index f343f3c8c..baf50774d 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -877,6 +877,88 @@ static void test_atomic_device(int fd, struct drm_xe_engine_class_instance *eci)
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +/**
> + * SUBTEST: atomic-global
> + * Description: madvise atomic global supports both CPU and GPU atomic operations,
> + *		test does CPU atomic increments on SMEM then GPU MI_ATOMIC_INC
> + *		which triggers fault-driven migration to VRAM
> + * Test category: functionality test
> + */
> +static void test_atomic_global(int fd, struct drm_xe_engine_class_instance *eci)
> +{
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		  .timeline_value = USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	struct atomic_data *data;
> +	uint32_t vm, exec_queue;
> +	uint64_t addr;
> +	size_t bo_size;
> +	int va_bits, i;
> +	int n_cpu_ops = 100;
> +	int pf_count_before, pf_count_after;
> +
> +	va_bits = xe_va_bits(fd);
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +
> +	bo_size = xe_bb_size(fd, sizeof(*data));
> +	data = aligned_alloc(bo_size, bo_size);
> +	igt_assert(data);
> +	memset(data, 0, bo_size);
> +
> +	addr = to_user_pointer(data);
> +
> +	sync[0].addr = to_user_pointer(&data->vm_sync);
> +	__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
> +			    DRM_XE_VM_BIND_OP_MAP,
> +			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> +			    sync, 1, 0, 0);
> +	xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> +	data->vm_sync = 0;
> +
> +	xe_vm_madvise(fd, vm, addr, bo_size, 0,
> +		      DRM_XE_MEM_RANGE_ATTR_ATOMIC, DRM_XE_ATOMIC_GLOBAL, 0, 0);
> +
> +	for (i = 0; i < n_cpu_ops; i++)
> +		__atomic_fetch_add(&data->data, 1, __ATOMIC_SEQ_CST);
> +
> +	igt_assert_eq(data->data, n_cpu_ops);
> +
> +	atomic_build_batch(data, addr);
> +
> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = addr + ((char *)&data->batch - (char *)data);
> +
> +	pf_count_before = xe_gt_stats_get_count(fd, eci->gt_id,
> +					"svm_pagefault_count");
> +
> +	sync[0].addr = to_user_pointer(&data->exec_sync);
> +	xe_exec(fd, &exec);
> +	xe_wait_ufence(fd, &data->exec_sync, USER_FENCE_VALUE,
> +		       exec_queue, FIVE_SEC);
> +
> +	pf_count_after = xe_gt_stats_get_count(fd, eci->gt_id,
> +					       "svm_pagefault_count");
> +	igt_info("Pagefault count: before=%d, after=%d\n",
> +		 pf_count_before, pf_count_after);
Same nit as in Patch-2/4
> +
> +	igt_assert_eq(data->data, n_cpu_ops + 1);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
> +			    DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0);
> +	free(data);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -944,6 +1026,10 @@ int igt_main()
>   		igt_subtest("atomic-device")
>   			xe_for_each_engine(fd, hwe)
>   				test_atomic_device(fd, hwe);
> +
> +		igt_subtest("atomic-global")
> +			xe_for_each_engine(fd, hwe)
> +				test_atomic_global(fd, hwe);
>   	}
>   
>   	igt_fixture() {

with above nit fix LGTM

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

