Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18554FD5330
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 10:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2D910EAE2;
	Fri, 27 Feb 2026 10:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0kRnzW/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DA110EAE2
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 10:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772186535; x=1803722535;
 h=message-id:date:subject:to:references:from:cc:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X9xtkIKB8yEJm6sKVzcsmtzHnpNP2rzHkmlsjMRTeII=;
 b=n0kRnzW/J8g4hL4oJC3QRFMzcWr2bMF23hPngkKtoTFfSjOObDiF8nsu
 Fo8Yw3/LnDWPhmUldritUSSzkhZkV9RMksn32Ud+6U5gT+Tp9k+8/mpCc
 J58jZHg9HB9DVBQajv8ZLFWCeLCpnihXdMr7yDxKh62ZEx47ar22SoLhG
 WbIOdS5HCT9v62pkBVxN0MpFdzpsGw1DS+e6g/CgnnNABUFErJERUlEdx
 6P8Ie9yLQjqckurBF9jVpX2QuAVrJaW0DZg4CDBjPBWSzs6O5nat57ZyJ
 TyUDSucuR6cAoRv8yAqj76pANDgS3LRI99Z8l/cWHn2zJLgwuJmcZYnTJ Q==;
X-CSE-ConnectionGUID: s+wHo4O9QQGbg1Xmugx3PQ==
X-CSE-MsgGUID: qQUzxHV1T7+6EqeRmW0duw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="84353990"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="84353990"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 02:02:13 -0800
X-CSE-ConnectionGUID: GpBByQQeRT6teH+oL1ZOVw==
X-CSE-MsgGUID: zrnVLbQ9RjugySl14BqRNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="221857569"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 02:02:13 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 02:02:12 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 02:02:12 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 02:02:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTo79w1QfUPSMBEzCk9wq4bVSUwqTO+d9SAwSonYA1JSe30CrJQKLQPEjIp3mO4zMxNkGBst3bCykEk3NAjg/bDCQOUh4dj/vNPPaYiImAcQReWX4TC+Xv9tKfd5HJWFtrzXy/fMITvHgs22WtfAvMDei/Ufn5KqLrHqbjkYGhLcs7c0fQGW6mi6d+lKvFDtO2Ajywf0Afgh5cvPOQa8Fz+IrR4FENsk/n2WuTLnBDTZhauarjrG/AF3enzkqC/chW+jZglSm43ODJRA5WwKClurWjrbz1UH89rHacRyBpaIl9c9q269bInf47OYF6ogD+PxLt24KjHd7DR6YM1EIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEw8/2YHCyZ1fcm1xFXMFhmkFE+54Z780PasM5TML30=;
 b=cIt7hkzXvYh5cuFkTG665oMh/uFPUF8tifspBK4pf6h9YWqYD9mYict+Gs3aljmN2iXiymfKDRaRNlROKF0zrr/GadSTaEbmCUqoQa1M74b/IuQWeoRyScxRzUUh99XznrSyX9KZOlNEbqDUFhNC82cAzvMM/GA7Od30loL118H8Fex2SCwVoNvXa+neRm9w3ar+8TZa2CJDOBZAtr7n0RhA4jDviT2pOszbYA+bROviGO6in5Cq84nQwRJQFtpJJA+9n+Z7hfwf1hKaaQAStV8iYCVOUst8r/Sn7fpr2JMqD2iXoyPpytYQheoKl9gegUw3wvaCqSFrjTEeO2rFGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by PH8PR11MB8061.namprd11.prod.outlook.com
 (2603:10b6:510:250::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Fri, 27 Feb
 2026 10:02:09 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::682f:20b8:f518:49b3]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::682f:20b8:f518:49b3%6]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 10:02:09 +0000
Message-ID: <c6af424d-33fa-4c40-8a43-c217499aa379@intel.com>
Date: Fri, 27 Feb 2026 11:02:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/5] lib/[gpu_cmds|xehp_media]: Introduce gpu
 execution commands for an efficient 64bit mode.
To: <priyanka.dandamudi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260224082800.1581935-1-priyanka.dandamudi@intel.com>
 <20260224082800.1581935-2-priyanka.dandamudi@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260224082800.1581935-2-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0224.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::10) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|PH8PR11MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd8ec06-faf5-4e0a-a5b7-08de75e74543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 8tpBwAruFhsbYonbULqPOYDhEAAOzcq0bvLfAlHEjiqNTuoYZwiaDW3G2RA/j1PDRbOIWMO6jMD5zy6lkXPDh6olAOf8daNyJ/T+P1Ynx/JtemV3qdzfJn2fNVzC4QPeta9febzLyuHY7zqrZjclMZXdyD1Y4ExrQ3rpkIkiqbnGJ+dogo3K7a/vphNxaArd1g/wbPpJETQObkLgb0ejla3FhrkUocJl3zuFrzBE8PjaPjbTui+r74hPQvrBC01DUv3vj6EI3ZrOBd0rSZmvsCD1POQdljspoyQI5qfI5P2XMLgkwbA1QGOLFGBqMICKrNuhu0adPAscOlNEf9VxWYHAFnO0DI6Eoz0KCb2Sh84GN7VtxciRIOZSbBcZs9tB0AAB990q0/uUtdt35nDvLHc7QNFCuyWiC9t16DTNI2j8DUyXfkRpI2cSX3gs3ITm9UqQTxmViQDDZSy0yZ1jQqxtMCgDVmoerMQyXuNmUgSdYxxOetnkJhubRl8BguvUtbnxFYNt/grkSxArtuOkLrd3d063RD0sgJRkqnS1c7Djnh83mp7zG9ZL6LC4Cw4jpdPuJscKDq/n9Cs5L0JwXDNWK1kaj2fJoaoewYToNl89LGu4hUM9acI36roD9PUeCxqOesvqrJUOPis+8XpGvuEuYBkpXGNLuqWxgtyCyXcMW/6xdJofJ/++punYPND/EE2OeoF1QnwJ0j4wEHBWgjrH2Nr9a2ubSd2Yed+fNSA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzQ0d3BJSmdSQkc0WHdmT2dybkRrbmVPUTJSNzNIN3RLZUI3blVtQ1RBYVp0?=
 =?utf-8?B?b1dGU0FaUXNXUmpnQjdhODluZkdWd1JlNmJRWTM5VHBVRGZUbEhGYVRyWjQ4?=
 =?utf-8?B?TUU1eVEvb290VFRsRjgyS2Q4R0VFelFEc3BVMUw3am1yZy8rYUk5a0lGUlhJ?=
 =?utf-8?B?b0NHTzFocWZrVDBSL1FFMXMwc3pGRURndnpmZnUwNkxlVE1XVXA3cnJRQktH?=
 =?utf-8?B?TjZGeUNqOHVMektMek9mNm5VZjBmOVNMaXBxakdpSGI4OEE2bkhrbzBVRWhO?=
 =?utf-8?B?RnZuRXN6QllQZk4zK2dVdVgrR3NOSVNKbm1ISEJlb2VoTi9lODFuMEhhai9K?=
 =?utf-8?B?dlZLNjVZUkxSeEE1cmswVk53MThsZW4wYVRac1JHeWVvaitlb1NKbzdmc0Yy?=
 =?utf-8?B?Qmpyc2JWUHZ1em02bTJ6VDJCRy81a09Id3FzWVBZOVFhWlpoMjdURkVERzF3?=
 =?utf-8?B?T21wcTRldUJhSzMxZjlvSTJaK0M3ZHhrYXJhaWJNdkNTYmtwejB0L1pMQmg1?=
 =?utf-8?B?RStvM0o1TTc5TDQ1M1A2R1dPZFZHdnZpTnBOcExCRXo0bzZ2TlFuSVRlMVlt?=
 =?utf-8?B?Z0dlQ2c5K1QxTnY0TUJ0eUVCSzI2Q0hIL0djakVZaWJLRGRiSnlQZDRiZEph?=
 =?utf-8?B?bVVlckN1djNSU3ozV1l2Q1M3VE1LbTByRFlqd2tvSVFuSC9ydWR1bkIvTGxH?=
 =?utf-8?B?V1RTanRyVmFNTkpCNkdDbVp6QU9meUpxSmtleG5kTHhIMS8wK00xczUzWEJm?=
 =?utf-8?B?UTdDNUt0aWxnRGhzM3lVUWpjbHBiTndtRTR4eENYZ2tjWWFEb2dSekJubmY0?=
 =?utf-8?B?TzljK0NiL01QLzdXUkFsbkNoRExKQzNQSlNsWlQvYnpqa05aSGdnNG12cnp5?=
 =?utf-8?B?bnpkODUzMGJqZ2RlQkR0bE9FOWFTNWlvMVRLc3V1Wm9PZlVBNjJWUnJYejZl?=
 =?utf-8?B?T3dmaG8xUUlSYnZvbmdzZ1pyR2lvcGpWcGtnWVlWKzJudGJuUENhcjh5NDBT?=
 =?utf-8?B?OFhWbkFrWnppU1RLT1g5TkRyUnpWYnd0SmI0eGhaZFR0cnlhTmpjTlJHdDlx?=
 =?utf-8?B?cStVYytaRUNzZHc3d2UyU0tGT3BKNUlGQUdoeEo2UVBPWkZGQ1pJVXJzUmVw?=
 =?utf-8?B?dWRnZUtjSHgrYVRaZmVQL1dGcE1CbnFYd2d3cFpJYW45M1FiWVhGcnBtUFds?=
 =?utf-8?B?NEZ1Mm96dWpXUzBPWDVCS1JjWkR2UlVhZVEyVmVFMkdrOS95WmgxYmJKemRh?=
 =?utf-8?B?SVdoSUJTZkV5VUd5UzZIYkY0cThWSjd4OWxjTlk0UFVFVzNZK2J6bjhSOFRi?=
 =?utf-8?B?UzlOUGNjdVF1ZFZ1aXFqaUtkbGNyZklNWHNrL2RoY29DM1F6RGVHWVpEWEp5?=
 =?utf-8?B?d1N4S2RJN2MxSTZXU2pIdU9xd0NTdDdKVXJxVVlHdkNUcitIVGtNS2IwYkd2?=
 =?utf-8?B?MkZHS3VybmtkUlJZaHNmOEE0Q2ovbmFOc3VJcDg1Syt5cEFYWGVMa3pYTGRO?=
 =?utf-8?B?dTQwWnBqNWlQZ09RNEdveVdOK1JOMEdYRnZOM0sxNGNQb3UzZDQ0d1h3MXo1?=
 =?utf-8?B?eXRSUXkvOWtsb3MwREQ2VmNEbGR3VG5JL0kwQVhsYWtpV3RtTVpTY21WM1dX?=
 =?utf-8?B?N3ZOaGZxZG1Gb0hqbVQyZUJmL1RKZFEvaEUxYXVyb1V0TTJFbS9YK3h6d3pL?=
 =?utf-8?B?MlRkTFFlY0ZNQUZxRmxDT3JHVnlNdi9qTmM4ZnZSUS95cTJ3VUM1TlgzV2hU?=
 =?utf-8?B?NlR4ZzJjWklPN1VHNGVwTXdCNlpCQWNFRFN5emlGYzJhK29iMHZPWVhuODYx?=
 =?utf-8?B?azYreG5UVndOWWxYYjhKeVNZZ2xDeGVnQWtHZzdNZEc1ZjBPTHE5ZmVGbFBh?=
 =?utf-8?B?bE95VmFoSmt5cjlSMEhJSVI4U2lzcEUzS01pTjc2c2kydDVTK1ZkTkFaY2VT?=
 =?utf-8?B?RUZwKzg5K3RWbmwwYkUwVXZVYUdsM2d6ejN2VlRQVVpCdlQyWmNsMU9MN2xE?=
 =?utf-8?B?dDMwdU11L1Bzc3NDdEFEU1Z2ekxka01Ya0c2anU4YldQTkNUY2JFUnhyRzAr?=
 =?utf-8?B?UG5mbGlHTG8vMHBtd0RqTHVrMDVLalNuUmdrV2NHSEpqTEpjK0dFYnQ4bmw3?=
 =?utf-8?B?bnVuYWJJZUhMYU81SlZib1p6UGpjNUlDSnRTTkVQWHE3eWxMd2FwdXdqbFpX?=
 =?utf-8?B?TU91cUhHRHd0NitPMW0rTzNZZ1hJR1k0eUQ2M3pzZ3QreTZGMnZoT3BkUDA0?=
 =?utf-8?B?VTN3dlhLcitIa3ZRbk5USG5jOUlDTTFLQ1E3MDJOaDNqdmtPUTZIUW8yZU40?=
 =?utf-8?B?Qkc1NndnNWt2dG9HZTVoZmtnakRGMFpHS0xndVBKT0xOMHE5Z1Q0dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd8ec06-faf5-4e0a-a5b7-08de75e74543
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 10:02:09.4070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sy3Zu2uAHXJryeQ8aW6yHPSNqGYqpEMYphysVT4jU8dN7zeGHwtR2P4kTyHYwQPmmrnTJuozydwjQUhWPZqy4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8061
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

W dniu 24.02.2026 o 09:27, priyanka.dandamudi@intel.com pisze:
> From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> 
> The efficient 64-bit mode introduced with XE3p and it makes manage all
> heaps by SW. In order to use efficient 64bit mode, the batchbuffer command
> have to use new introduced instructuctions (COMPUTE_WALKER2, etc) and
> new interface_descriptor for compute pipeline configuration and execution.
> 
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
 > --->   lib/gpu_cmds.c   | 210 
+++++++++++++++++++++++++++++++++++++++++++++++
>   lib/gpu_cmds.h   |  17 ++++
>   lib/xehp_media.h |  65 +++++++++++++++
>   3 files changed, 292 insertions(+)
> 
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index a6a9247dce..dd12c046c7 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -934,6 +934,38 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
>   	idd->desc5.num_threads_in_tg = 1;
>   }
>   
> +/*
> + * XE3P
> + */

This comment serves nothing xe3p is already prefixing func name.
So either full doc either drop it.

> +void
> +xe3p_fill_interface_descriptor(struct intel_bb *ibb,
> +			       struct intel_buf *dst,
> +			       const uint32_t kernel[][4],
> +			       size_t size,
> +			       struct xe3p_interface_descriptor_data *idd)
> +{
> +	uint64_t kernel_offset;
> +
> +	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
> +	kernel_offset += ibb->batch_offset;
> +
> +	memset(idd, 0, sizeof(*idd));
> +
> +	/* 64-bit canonical format setting is needed. */
> +	idd->dw00.kernel_start_pointer = (((uint32_t)kernel_offset) >> 6);
> +	idd->dw01.kernel_start_pointer_high = kernel_offset >> 32;
> +
> +	/* Single program flow has no SIMD-specific branching in SIMD exec in EU threads */
> +	idd->dw02.single_program_flow = 1;
> +	idd->dw02.floating_point_mode = GEN8_FLOATING_POINT_IEEE_754;
> +
> +	/*
> +	* For testing purposes, use only one thread per thread group.
> +	* This makes it possible to identify threads by thread group id.
> +	*/
> +	idd->dw05.number_of_threads_in_gpgpu_thread_group = 1;
> +}
> +
>   static uint32_t
>   xehp_fill_surface_state(struct intel_bb *ibb,
>   			struct intel_buf *buf,
> @@ -1086,6 +1118,66 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
>   	intel_bb_out(ibb, 0);                                       //dw21
>   }
>   
> +void
> +xe3p_emit_state_base_address(struct intel_bb *ibb)
> +{
> +	intel_bb_out(ibb, GEN8_STATE_BASE_ADDRESS | 0x14);            //dw0
> +
> +	/* general state */
> +	intel_bb_out(ibb, 0 | BASE_ADDRESS_MODIFY);                   //dw1-dw2

Not sure what is the point of "0 |", here and other places.

> +	intel_bb_out(ibb, 0);
> +
> +	/*
> +	 * For full 64b Mode, set BASEADDR_DIS.
> +	 * In Full 64b Mode, all heaps are managed by SW.
> +	 * STATE_BASE_ADDRESS base addresses are ignored by HW
> +	 * stateless data port moc not set, so EU threads have to access
> +	 * only uncached without moc when load/store
> +	 */
> +	intel_bb_out(ibb, 1 << 30);                                   //dw3

Define and use BASEADDR_DIS instead of "1 << 30" magic.

> +
> +	/* surface state */
> +	intel_bb_out(ibb, 0 | BASE_ADDRESS_MODIFY);                   //dw4-dw5
> +	intel_bb_out(ibb, 0);
> +
> +	/* dynamic state */
> +	intel_bb_out(ibb, 0 | BASE_ADDRESS_MODIFY);                   //dw6-dw7
> +	intel_bb_out(ibb, 0);
> +
> +	intel_bb_out(ibb, 0);                                         //dw8-dw9
> +	intel_bb_out(ibb, 0);
> +
> +	/* instruction */
> +	intel_bb_emit_reloc(ibb, ibb->handle,
> +			    I915_GEM_DOMAIN_INSTRUCTION,              //dw10-dw11
> +			    0, BASE_ADDRESS_MODIFY, 0x0);
> +
> +	/* general state buffer size */
> +	intel_bb_out(ibb, 0xfffff000 | 1);                            //dw12
> +
> +	/* dynamic state buffer size */
> +	intel_bb_out(ibb, ALIGN(ibb->size, 1 << 12) | 1);             //dw13
> +
> +	intel_bb_out(ibb, 0);                          	              //dw14
> +
> +	/* intruction buffer size */
> +	intel_bb_out(ibb, ALIGN(ibb->size, 1 << 12) | 1);             //dw15
> +
> +	/* Bindless surface state base address */
> +	intel_bb_out(ibb, 0 | BASE_ADDRESS_MODIFY);                   //dw16-17
> +	intel_bb_out(ibb, 0);
> +
> +	/* Bindless surface state size */
> +	/* number of surface state entries in the Bindless Surface State buffer */
> +	intel_bb_out(ibb, 0xfffff000);                                //dw18
> +
> +	/* Bindless sampler state */
> +	intel_bb_out(ibb, 0 | BASE_ADDRESS_MODIFY);                   //dw19-20
> +	intel_bb_out(ibb, 0);
> +	/*  Bindless sampler state size */
> +	intel_bb_out(ibb, 0);                                         //dw21
> +}
> +
>   void
>   xehp_emit_compute_walk(struct intel_bb *ibb,
>   		       unsigned int x, unsigned int y,
> @@ -1175,3 +1267,121 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
>   		intel_bb_out(ibb, 0x0);
>   	}
>   }
> +
> +void
> +xe3p_emit_compute_walk2(struct intel_bb *ibb,
> +			unsigned int x, unsigned int y,
> +			unsigned int width, unsigned int height,
> +			struct xe3p_interface_descriptor_data *pidd,
> +			uint32_t max_threads)
> +{
> +	/*
> +	 * Max Threads represent range: [1, 2^16-1],
> +	 * Max Threads limit range: [64, number of subslices * number of EUs per SubSlice * number of threads per EU]
> +	 * TODO: MAX_THREADS need to use (number of subslices * number of EUs per SubSlice * number of threads per EU)
> +	 */

The comment either should be removed, either applied to the code.

As this is upstreaming of internal code, maybe it is OK to keep it as 
is, to avoid rebase conflicts? Ask for IGT maintainers what is preferred 
solution here?

Regards
Andrzej



> +	const uint32_t MAX_THREADS = (1 << 16) - 1;
> +	uint32_t x_dim, y_dim, mask, max;
> +
> +	/*
> +	 * Simply do SIMD16 based dispatch, so every thread uses
> +	 * SIMD16 channels.
> +	 *
> +	 * Define our own thread group size, e.g 16x1 for every group, then
> +	 * will have 1 thread each group in SIMD16 dispatch. So thread
> +	 * width/height/depth are all 1.
> +	 *
> +	 * Then thread group X = width / 16 (aligned to 16)
> +	 * thread group Y = height;
> +	 */
> +	x_dim = (x + width + 15) / 16;
> +	y_dim = y + height;
> +
> +	mask = (x + width) & 15;
> +	if (mask == 0)
> +		mask = (1 << 16) - 1;
> +	else
> +		mask = (1 << mask) - 1;
> +
> +	intel_bb_out(ibb, XE3P_COMPUTE_WALKER2 | 0x3e);			//dw0, 0x32 => dw length: 62
> +
> +	intel_bb_out(ibb, 0); /* debug object id */			//dw0
> +	intel_bb_out(ibb, 0);						//dw1
> +
> +	/* Maximum Number of Threads */
> +	max = min_t(max_threads, max_t(max_threads, max_threads, 64), MAX_THREADS);
> +	intel_bb_out(ibb, max << 16);					//dw2
> +
> +	/* SIMD size, size: SIMT16 | enable inline Parameter | Message SIMT16 */
> +	intel_bb_out(ibb, 1 << 30 | 1 << 25 | 1 << 17);			//dw3
> +
> +	/* Execution mask: masking the use of some SIMD lanes by the last thread in a thread group */
> +	intel_bb_out(ibb, mask);					//dw4
> +
> +	/*
> +	 * LWS =(Local_X_Max+1)*(Local_Y_Max+1)*(Local_Z_Max+1).
> +	 */
> +	intel_bb_out(ibb, (x_dim << 20) | (y_dim << 10) | 1);		//dw5
> +
> +	/* Thread Group ID X Dimension */
> +	intel_bb_out(ibb, x_dim);					//dw6
> +
> +	/* Thread Group ID Y Dimension */
> +	intel_bb_out(ibb, y_dim);					//dw7
> +
> +	/* Thread Group ID Z Dimension */
> +	intel_bb_out(ibb, 1);						//dw8
> +
> +	/* Thread Group ID Starting X, Y, Z */
> +	intel_bb_out(ibb, x / 16);					//dw9
> +	intel_bb_out(ibb, y);						//dw10
> +	intel_bb_out(ibb, 0);						//dw11
> +
> +	/* partition type / id / size */
> +	intel_bb_out(ibb, 0);						//dw12-13
> +	intel_bb_out(ibb, 0);
> +
> +	/* Preempt X / Y / Z */
> +	intel_bb_out(ibb, 0);						//dw14
> +	intel_bb_out(ibb, 0);						//dw15
> +	intel_bb_out(ibb, 0);						//dw16
> +
> +	/* APQID, PostSync ID, Over dispatch TG count, Walker ID for preemption restore */
> +	intel_bb_out(ibb, 0);						//dw17
> +
> +	/* Interface descriptor data */
> +	for (int i = 0; i < 8; i++) {					//dw18-25
> +		intel_bb_out(ibb, ((uint32_t *) pidd)[i]);
> +	}
> +
> +	/* Post Sync command payload 0 */
> +	for (int i = 0; i < 5; i++) {					//dw26-30
> +		intel_bb_out(ibb, 0);
> +	}
> +
> +	/* Inline data */
> +	/* DW31 and DW32 of Inline data will be copied into R0.14 and R0.15. */
> +	/* The rest of DW33 through DW46 will be copied to the following GRFs. */
> +	intel_bb_out(ibb, x_dim);					//dw31
> +	for (int i = 0; i < 15; i++) {					//dw32-46
> +		intel_bb_out(ibb, 0);
> +	}
> +
> +	/* Post Sync command payload 1 */
> +	for (int i = 0; i < 5; i++) {					//dw47-51
> +		intel_bb_out(ibb, 0);
> +	}
> +
> +	/* Post Sync command payload 2 */
> +	for (int i = 0; i < 5; i++) {					//dw52-56
> +		intel_bb_out(ibb, 0);
> +	}
> +
> +	/* Post Sync command payload 3 */
> +	for (int i = 0; i < 5; i++) {					//dw57-61
> +		intel_bb_out(ibb, 0);
> +	}
> +
> +	/* Preempt CS Interrupt Vector: Saved by HW on a TG preemption */
> +	intel_bb_out(ibb, 0);						//dw62
> +}
> diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
> index 846d2122ac..c38eaad865 100644
> --- a/lib/gpu_cmds.h
> +++ b/lib/gpu_cmds.h
> @@ -126,6 +126,13 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
>   void
>   xehp_emit_state_compute_mode(struct intel_bb *ibb, bool vrt);
>   
> +void
> +xe3p_fill_interface_descriptor(struct intel_bb *ibb,
> +			       struct intel_buf *dst,
> +			       const uint32_t kernel[][4],
> +			       size_t size,
> +			       struct xe3p_interface_descriptor_data *idd);
> +
>   void
>   xehp_emit_state_binding_table_pool_alloc(struct intel_bb *ibb);
>   
> @@ -137,6 +144,9 @@ xehp_emit_cfe_state(struct intel_bb *ibb, uint32_t threads);
>   void
>   xehp_emit_state_base_address(struct intel_bb *ibb);
>   
> +void
> +xe3p_emit_state_base_address(struct intel_bb *ibb);
> +
>   void
>   xehp_emit_compute_walk(struct intel_bb *ibb,
>   		       unsigned int x, unsigned int y,
> @@ -144,4 +154,11 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
>   		       struct xehp_interface_descriptor_data *pidd,
>   		       uint8_t color);
>   
> +void
> +xe3p_emit_compute_walk2(struct intel_bb *ibb,
> +			unsigned int x, unsigned int y,
> +			unsigned int width, unsigned int height,
> +			struct xe3p_interface_descriptor_data *pidd,
> +			uint32_t max_threads);
> +
>   #endif /* GPU_CMDS_H */
> diff --git a/lib/xehp_media.h b/lib/xehp_media.h
> index 20227bd3a6..c88e0dfb62 100644
> --- a/lib/xehp_media.h
> +++ b/lib/xehp_media.h
> @@ -83,6 +83,71 @@ struct xehp_interface_descriptor_data {
>   	} desc7;
>   };
>   
> +struct xe3p_interface_descriptor_data {
> +	struct {
> +		uint32_t rsvd0:					BITRANGE(0, 5);
> +		uint32_t kernel_start_pointer:			BITRANGE(6, 31);
> +	} dw00;
> +
> +	struct {
> +		uint32_t kernel_start_pointer_high:		BITRANGE(0, 31);
> +	} dw01;
> +
> +	struct {
> +		uint32_t eu_thread_scheduling_mode_override:	BITRANGE(0, 1);
> +		uint32_t rsvd5:					BITRANGE(2, 6);
> +		uint32_t software_exception_enable:		BITRANGE(7, 7);
> +		uint32_t rsvd4:					BITRANGE(8, 12);
> +		uint32_t illegal_opcode_exception_enable:	BITRANGE(13, 13);
> +		uint32_t rsvd3:					BITRANGE(14, 15);
> +		uint32_t floating_point_mode:			BITRANGE(16, 16);
> +		uint32_t rsvd2:					BITRANGE(17, 17);
> +		uint32_t single_program_flow:			BITRANGE(18, 18);
> +		uint32_t denorm_mode:				BITRANGE(19, 19);
> +		uint32_t thread_preemption:			BITRANGE(20, 20);
> +		uint32_t rsvd1:					BITRANGE(21, 25);
> +		uint32_t registers_per_thread:			BITRANGE(26, 30);
> +		uint32_t rsvd0:					BITRANGE(31, 31);
> +	} dw02;
> +
> +	struct {
> +		uint32_t rsvd0:					BITRANGE(0, 31);
> +	} dw03;
> +
> +	struct {
> +		uint32_t rsvd0:					BITRANGE(0, 31);
> +	} dw04;
> +
> +	struct {
> +		uint32_t number_of_threads_in_gpgpu_thread_group: BITRANGE(0, 7);
> +		uint32_t rsvd3:					BITRANGE(8, 12);
> +		uint32_t thread_group_forward_progress_guarantee: BITRANGE(13, 13);
> +		uint32_t rsvd2:					BITRANGE(14, 14);
> +		uint32_t btd_mode:				BITRANGE(15, 15);
> +		uint32_t shared_local_memory_size:		BITRANGE(16, 20);
> +		uint32_t rsvd1:					BITRANGE(21, 21);
> +		uint32_t rounding_mode:				BITRANGE(22, 23);
> +		uint32_t rsvd0:					BITRANGE(24, 24);
> +		uint32_t thread_group_dispatch_size:		BITRANGE(25, 27);
> +		uint32_t number_of_barriers:			BITRANGE(28, 31);
> +	} dw05;
> +
> +	struct {
> +		uint32_t rsvd3:					BITRANGE(0, 7);
> +		uint32_t z_pass_async_compute_thread_limit:	BITRANGE(8, 10);
> +		uint32_t rsvd2:					BITRANGE(11, 11);
> +		uint32_t np_z_async_throttle_settings:		BITRANGE(12, 13);
> +		uint32_t rsvd1:					BITRANGE(14, 15);
> +		uint32_t ps_async_thread_limit:			BITRANGE(16, 18);
> +		uint32_t rsvd0:					BITRANGE(19, 31);
> +	} dw06;
> +
> +	struct {
> +		uint32_t preferred_slm_allocation_size:		BITRANGE(0, 3);
> +		uint32_t rsvd0:					BITRANGE(4, 31);
> +	} dw07;
> +};
> +
>   struct xehp_surface_state {
>   	struct {
>   		uint32_t cube_pos_z: BITRANGE(0, 0);

