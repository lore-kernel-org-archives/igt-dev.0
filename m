Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8925BD1CA09
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 23:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC8610E4E5;
	Mon,  4 Nov 2024 23:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gTyiFHmG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB94110E4E5
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 23:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730761389; x=1762297389;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j1Ereo6I7ywk0AgK5/830+V/wK6J8avTegIts/Ke7AI=;
 b=gTyiFHmGyjxuANmeVoByf3Mtlk/Tvo5uQAAYGaUkJziKj0Ca19NRTfyz
 13fH7nf0TJGgJqRqi/GjufGbdpAqYgXf1AC2Bfplntb2qiDWHU5jwQWPj
 aIzW2R+QWSPtqX9Z1ibsKHt4iY9B+MwdvKXpnGfKwrT/Klzv9y8LQiQPf
 kYHgsjQPCOIsIBNvKbTMX5uHl/+/Me1DAr2vA3tn9LgD8ZJ8/4tt+rBuE
 eWKtWAQLdfT90XcanHNn8MlFuFaIodEEpyWmGhdNpPgurvn1O/ap+4p9u
 SBPqJabD5CAWLi09J6vNzwNdNR+Oaa0NNHdlQztOdU8vlxhSH+wyYFt0W A==;
X-CSE-ConnectionGUID: Dm8SttsCQ3mUUxh1Pli1Kw==
X-CSE-MsgGUID: jFUYxza9TJ6qY25iBGlzPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41031577"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41031577"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 15:03:08 -0800
X-CSE-ConnectionGUID: lA5XXgz0SMO1B+rceMC6Iw==
X-CSE-MsgGUID: S1olxqczQ6Km/y7qa5ASHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="84133910"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 15:03:08 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 15:03:07 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 15:03:07 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 15:03:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhhbyhEdtp8PCz9Od1Oc++LtnwXkFQIpTn2NaWd+37alN1+LFup1J1smIKN54aaJV2yEh4TteCDqMM28Us/sw1WXjN6yCQ/cpSzrFg461Dopl598+cyvWk5s9EazT1PDbr/+kHjaCgJwm167ouORgYkvXo2qltaH4YclyWBu8E3y+YLf5dVeAf+ArIk0VUlnjebK+0Vvrr0UhUYee6ppGRjuDe6joKPBtPNcX6/IUXhRHoIKzRus9d1JtHgIWOjsnTp+g8MSuLhKVVISRcijiiquYSaVryn7jMlyUo8mxob39jtuKhciUIrvFkfgH5g87inPkq377Pr5MeNKMKT8fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJVpsS/RvHMhBrMBSsaepDslbitce/A9FXDCPZwy40g=;
 b=PxYREDVW1CNXS2e/zjK+hCSDMkR+LChDepgGZlUjQ+rE+vA5tZcFPD/mKQWlC3JcTGpTw/VJIzGZ88x3rdfSuPilTqEASSBRMedkEhF8Bk1bXRN+1xXIf09Pm7s0EbYwW4EMDkkoxsm7lPiX6D4CTkHyFJhJVauzWs6T7O+fHEQ64qEfhvzfXDDTkD6okkG7VUgAXJhzumMt6LeRXVr9c6jw2PnswKbCx/lMdzX9DLaeC9MOuUubZIgzKxELwaDLqd01VRwWQ4q23BrS5mafXlrbGIzuI6q0EjPz9JDW5lxv8hEMJO+AIAc/hyAL8QCz8+Am2YlM+ru4zOxNhsTT3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4963.namprd11.prod.outlook.com (2603:10b6:303:91::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Mon, 4 Nov
 2024 23:03:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 23:03:04 +0000
Date: Mon, 4 Nov 2024 17:03:01 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kmod: Drop legacy kunit fallback
Message-ID: <4j7i3rcvciaeanywmir6xlqvtbjdq6c6bp2vn2fb36uo2wj3xq@h7eaxxagtqgr>
References: <20241031003142.863437-1-lucas.demarchi@intel.com>
 <3310304.N7aMVyhfb1@jkrzyszt-mobl2.ger.corp.intel.com>
 <t5p33w3s2bzaddakwcagzaab7ys2epo2bile3ubtanzuuqh4fb@5ypkaql3wtn7>
 <2672104.tIAgqjz4sF@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <2672104.tIAgqjz4sF@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0134.namprd04.prod.outlook.com
 (2603:10b6:303:84::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4963:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fac2ada-b50d-4a74-57a9-08dcfd24d6b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rWuHoeTKlvgFu/nYF6cl6+doFqnRo2LPfaCUKOJFp3qoNVzOt5ce6bs9HNnz?=
 =?us-ascii?Q?QNfLDNkWsA/CEJzEgN3YGls7jHmF4OEug0XMoTWI+PKIZPZGJjzU6qmBQEz/?=
 =?us-ascii?Q?zennFiYeA5ffeN4utg+UZMrwmD3XQxo7nf/z8z5KQR0/XWo9PuynL4QgFfpO?=
 =?us-ascii?Q?0V2H3z0JP4cdjaFJD/pS1guXbCKR79ZUDYWoFjb1SDK/caZVvo4jBW7GY1cv?=
 =?us-ascii?Q?MSwjZtbEeIPHRtOgNzyy9zOX7j+irKN2cNb/aaOqx3bWMQ1T57Xm2JXFP5by?=
 =?us-ascii?Q?Zivu2eCJUAyuMDyj66/fDbRZa/ndyF6+AJSYriubWvHX3we9mzZ5RTgk+O0r?=
 =?us-ascii?Q?anKsgiWK4lcrQ9MHFmJp5FVUfZioO+7PLxGKL8l0hJtqGgnen8x50mf4tUNr?=
 =?us-ascii?Q?NDqL3Zari2QV8WBt9w23kpyx9tJtN1SADUrUDu9s61u4GQj7II85n9dSEXm3?=
 =?us-ascii?Q?HIzNdALI9CTH4I9x+TQ0QhfkFaxqWPfS4vTmP7UsfjjTCq+L8fzX9bq7UjeA?=
 =?us-ascii?Q?WnoFZST3r98RxVRkjXemJRzOZ/vBv8uAet4ft0KvI/EwRPW0MHc/PNJhkeFA?=
 =?us-ascii?Q?jWNOL8ATYhz6na3EKR7qeOWhdYU9i9jUZ8xUGztKqOB/KXJhF8HVA0ji+F1g?=
 =?us-ascii?Q?+hgoEtCsFja5ZFn1lcXBNXTRDcz+e9X78H9zunE32aVoMBXm1MCPvD+c9nLY?=
 =?us-ascii?Q?PO4LisUQ3GIihAhqJSZEYlsWILidqEU7h+oEzAL3ss+aaX3orc/I5QfCdfAh?=
 =?us-ascii?Q?4adGYdBLJ9uK2oxhTuSa0j28ErhnUsjgDwKM4YBTG+8M4GsxSmj1puTFIQG2?=
 =?us-ascii?Q?jvOj+/t5jMY5hjpomukYeAuOQZpGmCjxLYB0XDq0pQBcpRz3ZhrYm5X3sGik?=
 =?us-ascii?Q?LC1068/GhVxacPQL5nyV2GT8w/S928lW0tO7lr7q5Ytv42jdsL+iXSHvf8eB?=
 =?us-ascii?Q?v13NfeMJ0DLzis97+aAwRTO/dK3PNjBPccjYeG0ujxEkkXr9Sh7iYAwEiWUh?=
 =?us-ascii?Q?vTI6aQiZU49NNvI0/pJ8ztEYqu8N2FUJz24iOD50+E14u83t+JrDIqsqDDhh?=
 =?us-ascii?Q?1ogsdyiuFLuDkogNOr9Xn0g8xID0yEKRjwQ6WGHKovnrlfCXebNdp1eW9oPS?=
 =?us-ascii?Q?GL8k+fTPbS7Ey9Vd6hHRnID+naOAXM/aHhs8g4WjXU6m+AXc41HIY9iiwzbM?=
 =?us-ascii?Q?bLPtcOmI0BbCkBwvOB9m5F+MU2AmdWzaU8oty+tfdaqeXyFeMwnUXUb+/gaZ?=
 =?us-ascii?Q?t6sKv+JZkK8zjV860egEJRFXZACDN7eKCpgLK07KdKBKH+lEqFSI8Vu56XnF?=
 =?us-ascii?Q?T+YbvfI5BD31QLf9drhWva3B?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MRNoIBn5RBMW7ZWan4oL1ci4XGm7CgsOiivIaX3r6vy8+2yWvppDTecKSjHW?=
 =?us-ascii?Q?JlNg8MgE4XlWqaFco8OofAF/dhyhMbdrWxtYK6FkCOB8TlP2P3SVaSj+4x6O?=
 =?us-ascii?Q?9OL7xHZpWxBgBZtBLCONPU/jG8sVPOJwaU/keva5snqJH1H5hMEXy+gReHf1?=
 =?us-ascii?Q?Iw0NEZs+5+ZD3veRRgfYFQe/b1SvE4F8zl2Y6yLT0FMTB+FDI3T9ZSfpvxmw?=
 =?us-ascii?Q?5DDfYcRE0TTrBoChq5i0hk5NXBs9y6MjkNU2ZWvtVweYwvOdFEkq3Vp8tKWb?=
 =?us-ascii?Q?gdnuHs2ghKjajtrxGFEgahUpgGZ9MhBXxbJmuSQoMfh0B3TeRFjVYRtnjO5i?=
 =?us-ascii?Q?34eGv4rg1njsjklckkyRIhXR/KTx+N2v8/liU/AXbyrsUdAeHYMCKR0UdJ1u?=
 =?us-ascii?Q?rlCzTpOZcsL0mUxAxDxHDv2MD5p61/OXZWwJPEl6QOKZ58/KMruKnt7uJTUa?=
 =?us-ascii?Q?Kx4xaWceJnnK1ivRgmoLo5TBX0dnu+BJZ3QKAZTdf/rcRXqMitSH4FsdxZbq?=
 =?us-ascii?Q?bd0ibfk5UjfD2tMRE8llqqg+/LUDC84Gb8nEo+zSoBHW5xV2USSmonQu4+ve?=
 =?us-ascii?Q?GDmSctES5Dx56GxBy3nDSFhZVdXZdOZTo/LLoYVxE+8TUc2+QHxxuLYy22Nn?=
 =?us-ascii?Q?kbqMRlCD7CusCDEeUtbVloG+QJJn33kbgbm0TwATX7g0xRUpUJtXcbeeUopX?=
 =?us-ascii?Q?OBIRa9ZKAoDNFEck8z9QjejAjWgrGj6xl9hPriltpmWWM/v6qpZsvI49Erhd?=
 =?us-ascii?Q?mdGBU/fMxQV/1m6vZTOT+fenmhM9Tml/u/e1yC9ME1qo6zqNIVt2YevMREWM?=
 =?us-ascii?Q?rcSuxFYv/wN0FFDWITJAm4ppEQZDxuxstEuDau/wBSqZyvNC1xw0czMXv0uE?=
 =?us-ascii?Q?qX2nHAEZv/No84zlfErz96klll2DeL71mbd3kfK7KYHdUyEk5gxl32nFc3eC?=
 =?us-ascii?Q?cxCpYel2Z5qs/DsoNvwFp9Sj7XThA2wtqyTWm8YiOXsZfrcGafRwECewyRzQ?=
 =?us-ascii?Q?oIi1uWLQvn2JG5sbNU30QXEe15wDsB4rcBaxPdqX/smDHtsmtk3mC6wYARTm?=
 =?us-ascii?Q?+Gy7kQ7C+JYEtN9HX1jc+XKSYcmludCzdWDSzsT92QiQ20J9dHPnGT8pdzJ8?=
 =?us-ascii?Q?lorWmZK3bTXkv+r2JTylLIbTp2k2Sl9i9NqXCmPO41QslWNTw2H/yFIGP8dv?=
 =?us-ascii?Q?Dgzzppmt2ffIXQaLS4lCk8SUybk7ITkAscQ78HmWRw7EhyJteWnJRBmCmktY?=
 =?us-ascii?Q?KD/VM5O6yfQNDwqKUEizh+TqcBSU3YHeWRFMIDovHICQpApjdVlV20YF6wgc?=
 =?us-ascii?Q?S7zHeeqOLFL4AWoeTZGgMSrrsi2qOOYUuZC54aK9/iBBxl6HjXeG26rnYSpm?=
 =?us-ascii?Q?xuWzCLmfB5Z7pRNZiyn1U5LsaLRZ03T/LgfeG55JX2VqpjP87xuo1qaINzYy?=
 =?us-ascii?Q?a482v2I5UD5RG8HvxA/Mg+fOU6HN7g8wiavmfSGhx10EC9P5k5WLGIIHlCjd?=
 =?us-ascii?Q?rqTd00ANPtndsFo1uXCMXOQ5N+qQ1H7zMuqgXZYMEx1/J6BQtU4jP8Mv9UQ4?=
 =?us-ascii?Q?HPOeNWlyGR058PJy3e8/Dlsvt+SH5ByPHQf9FwCPM04hPljc+VEKMLo3BcGx?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fac2ada-b50d-4a74-57a9-08dcfd24d6b0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 23:03:04.4341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRG6b3Wm7zsYXhpxxNPKib6JI+34Myw2mpmmulkZTWsQQJ0AKhC6xJWMCJdkeOEXPcSHkiYMrmEhT23vRArscGHdU57jo8bAj8FBHyzehqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4963
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

On Thu, Oct 31, 2024 at 03:58:11PM +0100, Janusz Krzysztofik wrote:
>On Thursday, 31 October 2024 14:18:25 CET Lucas De Marchi wrote:
>> On Thu, Oct 31, 2024 at 11:42:58AM +0100, Janusz Krzysztofik wrote:
>> >Hi Lucas,
>> >
>> >On Thursday, 31 October 2024 01:31:41 CET Lucas De Marchi wrote:
>> >> Kunit has support for listing tests with debugfs for quite some time,
>> >> there's no need for the fallback to be happening: let's just start
>> >> failing the tests if we can't get the list of tests from debugfs.
>> >
>> >We must not fail, we may skip, see below.
>> >
>> >>
>> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> >> ---
>> >>  lib/igt_kmod.c | 278 ++-----------------------------------------------
>> >>  1 file changed, 10 insertions(+), 268 deletions(-)
>> >>
>> >> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>> >> index 75a0d057c..4cb9e886d 100644
>> >> --- a/lib/igt_kmod.c
>> >> +++ b/lib/igt_kmod.c
>> >...
>> >> @@ -1523,25 +1268,22 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>> >>
>> >>  	/*
>> >>  	 * We need to use igt_subtest here, as otherwise it may crash with:
>> >> -	 *  skipping is allowed only in fixtures, subtests or igt_simple_main
>> >> +	 * "skipping is allowed only in fixtures, subtests or igt_simple_main"
>> >>  	 * if used on igt_main. This is also needed in order to provide
>> >>  	 * proper namespace for dynamic subtests, with is required for CI
>> >>  	 * and for documentation.
>> >>  	 */
>> >>  	igt_subtest_with_dynamic(subtest) {
>> >> -		/*
>> >> -		 * TODO: As soon as no longer needed by major Linux
>> >> -		 *	 distributions, replace the fallback to
>> >> -		 *	 __igt_kunit_legacy() processing path, required by
>> >> -		 *	 LTS kernels not capable of using KUnit filters for
>> >> -		 *	 listing test cases in KTAP format, with igt_require.
>> >> -		 */
>> >> +		bool has_tests;
>> >> +
>> >>  		kunit_debugfs_path(debugfs_path);
>> >> -		if (igt_debug_on(!*debugfs_path) ||
>> >> -		    !kunit_get_tests(&tests, &tst, suite, opts, debugfs_path, &debugfs_dir, &ktap))
>> >> -			__igt_kunit_legacy(&tst, subtest, opts);
>> >> -		else
>> >> -			__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, &ktap);
>> >> +		igt_assert(*debugfs_path);
>> >
>> >According to a comment followed by respective assert() inside
>> >lib/igt_core.c:igt_fail():
>> >
>> >	/* Dynamic subtest containers must not fail explicitly */
>> >
>> >that's why I suggested replacing the fallback with igt_require(), not with
>> >igt_assert().
>>
>> where did you suggest that?
>
>In the above TODO comment you are addressing with this patch.


oh, I see. I still don't agree with the approach of using skip here, but
I don't care enough to postpone this. Let me fix it and resubmit.
I went ahead and merged the second patch as it doesn't depend on this.

thanks
Lucas De Marchi

>
>Janusz
>
>>
>> >
>> >But maybe we could go a step forward and replace all
>> >
>> >	if (igt_debug_on(...))
>> >		return;
>> >
>> >inside kunit_debugfs_path() with
>> >
>> >	igt_skip_on(...);
>>
>>
>> I'd rather not skip and have a big red FAIL since it's not a valid
>> setup.
>>
>> >
>> >then we needed neither igt_require() nor igt_assert() here.
>> >
>> >> +
>> >> +		has_tests = kunit_get_tests(&tests, &tst, suite, opts,
>> >> +					    debugfs_path, &debugfs_dir, &ktap);
>> >> +		igt_assert(has_tests);
>> >
>> >Ditto, optionally with all
>> >
>> >	if (igt_debug_on(...))
>> >		return false;
>> >
>> >inside kunit_get_tests() replaced with
>> >
>> >	igt_skip_on(...);
>>
>> if those writes fail for whatever reason, I don't want the test to skip,
>> I want them to fail so we can fix them.
>>
>> a skip is a valid thing when there's difference in behavior from
>> platform to platform or when it's a valid difference in env setup. Here
>> it's not.
>>
>> Lucas De Marchi
>>
>> >
>> >and kunit_get_tests() returning void.
>> >
>> >Thanks,
>> >Janusz
>> >
>> >> +
>> >> +		__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, &ktap);
>> >>  	}
>> >>
>> >>  	igt_fixture {
>> >>
>> >
>> >
>> >
>> >
>>
>
>
>
>
