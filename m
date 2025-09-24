Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE59CAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 13:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D63F10E737;
	Wed, 24 Sep 2025 13:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XokRJ5u5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA2710E238
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 13:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758720150; x=1790256150;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tzXDoEt2g7hKX/iuKCBOrk/g0et+YOizoBxyZkt7few=;
 b=XokRJ5u5GLpZ1N+xM0SkoPPsudRcG6U5kUSXdJkAIHSzDZm2US33QOLs
 PSyBb0sTZg5nOXkrQ9LmHrJD8huVm6vccvLc4DRBNprBuIomXB7U97wHE
 QUfQ5mfUBcZqXqwrz3yWIlsX7ey97dJ+h/wn149XCtlPXPUS0As3rmKJd
 2p9RBtnwaD5ReCs/rBdiMBuhA+6RjWpvYtA2F/zqDdDw7oGw2qtuQjRSA
 scmefrqjDu5y2gy4NU6zsT63i6qVdTGKFreFbLs2FNaLtJHEklTAANray
 pq2AyGfwgI2hkoRSQTZHCF6YRJsCbKrxoNL2LtKkQcXy9qTW94z3s4y2V w==;
X-CSE-ConnectionGUID: 5GMT9SU2Qa+VWyTYBaBYYQ==
X-CSE-MsgGUID: IGaYpD80TxaIXB6eL8ZFdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60929325"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60929325"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 06:22:30 -0700
X-CSE-ConnectionGUID: faoSkMBfRxyrgGZLJKyuww==
X-CSE-MsgGUID: aYoPCVKSQC+47/frvwlQ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="176325714"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 06:22:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 06:22:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 06:22:28 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 06:22:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WP2FVqIqkxi8ZnhgKOS+arWbQ/A3inQm3Ttsf5xP0KBrqkQ8fY79CCG/npLINaJ9wjx+7x4rhyXMmGav9qStpGmv2Q+5pQlTmRpQEZToxk0oKjbn+366LeETymJN8I8rxy0PV/mVu6cYKhDEgXY/J8arr7AE16tUS3Xh8rhFcyEK36e4Mlc7l76b5R+uUn5/U0UiD+Z9GE/OTS6d3OasosZwf2rPxTD1dfU3g+921Dyfdg4Pw8R+KbjRtCaKypaRyC9xeQ7zhp2OQaoTnoyr9fyHcVyQinVHi275ekKv93BK+Rde6xKdK9rPtuaOscbn3vbSmzXlXYpGmpQdXiqBVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwx26rHlXSLc3lEF95S5J41oFm4c7sSJjG3NenT+cYo=;
 b=f93XYRiCUMmgmBddl5yWKTgUws2M3b3/s9Ji17ftuUePL2ovip/7OYDCzqynuOo5tBd+3D+vw16rp9ZAHW2BeHJoB0LH7t3uzVj2RfOTrYz8nIVMbw4c32vsBcZzWlujbUp8TZ0dCsL3/3uZvrYxUl1lor64CzG8nl5abI5NxxN0rCxJnWOTlTyBAtDXhTLTefFgb7/ACE0LVuHpwSXWB7S53RFEQq+Z5RP2O3f5DGWB1nbRK9TmQo+Gtac7USO+vJIg/5Eg802RGVCnt8Q48vAErgsLhHUVKawrb4y8kKdlCeM8jSM7oNIbIQ6U9cIl5K/4nvaT0+5Xw9WT4G4+iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.22; Wed, 24 Sep
 2025 13:22:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 13:22:25 +0000
Date: Wed, 24 Sep 2025 08:22:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/7] lib/gt: Fix IGT_NO_FORCEWAKE handling
Message-ID: <pyt6omty62zzgrcedpr2fxdefmvst6frwvckri7nxmt7bo6pk7@jmc7pwo4x5pw>
References: <20250922160950.27250-1-ville.syrjala@linux.intel.com>
 <20250922160950.27250-2-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250922160950.27250-2-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: BYAPR06CA0023.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::36) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4555:EE_
X-MS-Office365-Filtering-Correlation-Id: d6d5d14f-9634-4a15-e3a1-08ddfb6d66a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?VSGZDsAgvKwsBfwHq+s/TkyZ5Ey7aT50vRLL5GqixDEZklLLzKda/NZfTz?=
 =?iso-8859-1?Q?0EI8ikah536o5wNYQuLCRFrmnYq5bu0wCOxuWb2tLAdpzcpPNESRnCK8hU?=
 =?iso-8859-1?Q?ggxjnsiSy85VZ7xftJHYhfzVZTIE8odRaCJB3Cy1eqXDNjo1UYfv4uueQj?=
 =?iso-8859-1?Q?71dA8NpIvSPZ01efBLe4HjlwslPsvTOnETSjMn1YqsJGqrz49HCuKYuDBs?=
 =?iso-8859-1?Q?Z8NLrYVm7jmpRJ1V/Y9EnJW50m4pMh461nuAdErZFDUotCQ9KfyjmqMKzg?=
 =?iso-8859-1?Q?/1xOqbr8v5btiuF20vtMX3gOadD3FMD7sNwWmOI0CmEoIhvpcZKAaUoJyF?=
 =?iso-8859-1?Q?iBKfgdgWB4YLlmb6sUK23VXJpqpWCj5ogxXk6hZm5u6FpuMM+c4gAtd0A1?=
 =?iso-8859-1?Q?kDql7cGvmS1YpQlAywmirAUo6ZGsaE6PVe6fcNpuuwSkiG7R51UtgPN5UW?=
 =?iso-8859-1?Q?T4pi+jaN5DBRNMit6Ova72J1o/cDY2jqse8+irDfysqdVPHTGRVZCOKxPF?=
 =?iso-8859-1?Q?QkVCuqx0EcsYSD0qCwe6HG99vB4SH9YzQ2fZsy3UX1Msb1rd67Iz9GKhZO?=
 =?iso-8859-1?Q?RD8VWc91mde2oNCyNRVctoqJwWJ1jUzPmUxYSdbH/AhmypKKcF0d5oZzoT?=
 =?iso-8859-1?Q?30zEqtmqtk9fc1zdFuSG0LKp3je7XIvVmB1gr/Htt8ef/QE14a0a8oujwt?=
 =?iso-8859-1?Q?1i+RRQPSsFZqT1LhYm13UKh6GIejB4ex8GAVqFv88IAuTRVC/wFD2bGHlG?=
 =?iso-8859-1?Q?IttfOnTcKrLeJIjw3TFVe2ZjG6ziPJxm6JsD7aKbmSe0y4beZcWRxdu0uS?=
 =?iso-8859-1?Q?U9EPzOLKlqvHX+amI8uPQFX0p6NFO+VuIDsRgx1hIv/Aw0OuJGH+MGLDf3?=
 =?iso-8859-1?Q?sxMEVsyGTfCpCD2e37MfN9ARWj0AQH7MwDTp67fy21AXwd7p/bL7Z60vY1?=
 =?iso-8859-1?Q?2ssbUC//vl2Ww5hU7j2+VPEMyDAAIAtkAOT5R0GBQQ8lito02H2SB2AzQ4?=
 =?iso-8859-1?Q?9aOnf7CWvK5K1cOaYK82VtJOBEbcLuuDPr/jtOMuBQMzvYS1VKrETdQk+p?=
 =?iso-8859-1?Q?z6FxQK5DkJLpKhqNqJCVT37jhcpp2OnZXMQfTigm3pBdBXZvvkd+rFxDTa?=
 =?iso-8859-1?Q?pNqS6Id7pxu6Pk1aI+WjsIzvfOBRZ2qpD+VHC6YGESHrU+hpiIyEnSYFWz?=
 =?iso-8859-1?Q?X8Kd9Jc412ml3SdA2q4RePalXOw9CuSIKEVfouJkxSXpMfklXMrglSgWIP?=
 =?iso-8859-1?Q?e57UGe/TxqLH7JH+w+9h4RVYtLh7u2K3UoF82tU9/kto101nRDZoinNAwO?=
 =?iso-8859-1?Q?UunRFYSMyDOWEhA3HYd22ucbRuBW3EpqpDa0PF0MUArYzbXpusoGq/U+k2?=
 =?iso-8859-1?Q?3kRNllJg2kt+SdKpSTmsZZ944chu046trSu8botQJSr2GCKM8LikivrfX+?=
 =?iso-8859-1?Q?q12SRtdcD93M/3E5oR0d+0r65lYCkjHntKNHesEFsbHZ4U1xUppbSWPNR6?=
 =?iso-8859-1?Q?g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?d5bF3K7MnYCgymkT3pND8uvGX2063y0efbAvK+4OP8Z2gJsQdYQgXxKNgz?=
 =?iso-8859-1?Q?P4Ue3Ja74LMSoiIgC0L2S2X6zihLsVpTBZjNUA/fIOGRScnaPytFl+AH1L?=
 =?iso-8859-1?Q?9dNiGsAditsYpPsFxV/O5y6YFqWxSS1OC726pfGo5Tp0GIqbBHp4qNCkRp?=
 =?iso-8859-1?Q?u++p5PKoVLoFgV7a2XAiex7xyiolUvHXp6M7uW3XnuZNGg52tyomyF4oLU?=
 =?iso-8859-1?Q?JvP609rK9XgCKy8KMKisNY5LNyBzE6g/taK7QE+7NOY+KkPbok2rUe3xFK?=
 =?iso-8859-1?Q?fr5Jcw3lTXq8NW7G2/TIL71wNG6BfbBgo58f6TK9W2fmdJ2c73GLKklqKQ?=
 =?iso-8859-1?Q?CCxFeneDflflNj1k2gUR8rqQgBeCEoV2Mh6TfV5+1kUFdbtI4SplVvrP1h?=
 =?iso-8859-1?Q?B3OjEvJuy4N1SrYRnVxxMoZdbZ1EsHAUXZS2xjAEpFHwtzb5Qb0D+OacDN?=
 =?iso-8859-1?Q?Y70VecTUHkH8pzJCTpOb823j6+tj2Cf65SYc2YePo19ndNSxz1iHjXIam7?=
 =?iso-8859-1?Q?8RMmvvr5613HE07t2ZI2t3MCkpB3tylz86exPfF/83iyZN81sVIJyyxVfO?=
 =?iso-8859-1?Q?/WahjucEDj9hmxos3cf9HTl5F1+ZXhauEn3SqFD/o5gNc5RADokx2dDc4C?=
 =?iso-8859-1?Q?t5yqUq/mglja3BJYPNzQrVH3gJ9Gm28AJ7cRRM6TCARLYqDsL3rjjj+Mlb?=
 =?iso-8859-1?Q?8dhtpvB+oQOO6UnQjbmdpoCMQs/d7639xJhOS/XRAd4xakjt5hUzSFUY2v?=
 =?iso-8859-1?Q?TvYpnee7zyZoM17Ru+0UpktY+RcvOT8YnkX8RgCKc0XTZTuIlypO434gV0?=
 =?iso-8859-1?Q?eRhKyqNqEcFoU1mqcwKjLVl4OehA5rXkvsvcbOsoj5b9dRHPNWg84ZnV8t?=
 =?iso-8859-1?Q?MDLVOyfeopXcqDh54RsXhETRc8SAfbwtbZpvdpPP7JSn7vSSOShj0CSdLY?=
 =?iso-8859-1?Q?r95OjgLsEpgyqqku8G9uCr9jMeKm7Q9RexFLWif8xoJSRk6kCd25m0afQE?=
 =?iso-8859-1?Q?5IP+epiCSjOzl50vITm8pVH1FU1hXqsR6MLjxSNuFdjgMIT3DNKyVy4+YR?=
 =?iso-8859-1?Q?L8dQK1wzkgVLAw7cPiv9jCB2ARZCmWZ9CTd9WsMsKRem0f3Axdv8eXpeQj?=
 =?iso-8859-1?Q?4ag7HRtpEZymjBjMGM4hQ0qCtAhyE8O8vIWq1xH+N/esKBka5No1GLq0gz?=
 =?iso-8859-1?Q?yrLuLNLJnPdsu849qnuQWp4SzS2PX6U/HMNJHCtJGXUdj30+CZuU/ofjOM?=
 =?iso-8859-1?Q?JiVsK5lQgZrCqGW7a7f9ES1c1ljGYwFt/5AV+uOKZ+Obm+MaDpugz0iB+n?=
 =?iso-8859-1?Q?IWVymmYUUa6G5LfzRrHxRVI1LMvmtohI2tNne15aV07ZJnlr+jvasyn6I6?=
 =?iso-8859-1?Q?Xqlc3W84i86mYPTgurraOwIfB1iQKdNBQnwNzMLEIZBmoLQ2uraM/9Guam?=
 =?iso-8859-1?Q?zdwK880P2yo539eU8TCrW2xYlGOHrrxcS1PK/pUzG8rtO4D8RZbsD1ht9m?=
 =?iso-8859-1?Q?V4vUl+Cei7ETuqUQaTkALHB2o0cMA+Q1rfaL8V/PloAiNQs5+7iQzh2lzM?=
 =?iso-8859-1?Q?m7hZG9GeDbRt3sKSJzTvoZaWkFb5jfeXE95E9iqZbvtoUde+mVrPsfjOU4?=
 =?iso-8859-1?Q?hhNZKCSqAsQuhZodoyIkBA05Pq7wVVMT4X/Pg1f0GG270mjEWkMEsM0Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d5d14f-9634-4a15-e3a1-08ddfb6d66a9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 13:22:25.1050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jEr1/sl2wAE2dQkk1N+mAustRn94OmXL8Is9GnYOcmnP5xRiRVPqqCjTXeN9vrmWJa0/ohjuHUMM9O+r59g/cOm863ySL1mlKBIHf/Fz4Y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4555
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

On Mon, Sep 22, 2025 at 07:09:43PM +0300, Ville Syrjälä wrote:
>From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
>igt_open_forcewake_handle_for_pcidev() forgets to check for
>the IGT_NO_FORCEWAKE environment variable, which is a real
>problem when one wants to frob the registers without forcing
>power state changes in the hardware (eg. to observe display
>low power watermark residencies/etc.)
>
>Add the missing IGT_NO_FORCEWAKE check.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Fixes: 114b9ff31d19 ("lib/igt_gt: Add igt_open_forcewake_handle_for_pcidev()")
>Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

We should also probably update this comment in lib/intel_mmio.c:

        /* Find where the forcewake lock is. Forcewake doesn't exist
         * gen < 6, but the debugfs should do the right things for us.
         */
        ret = igt_open_forcewake_handle_for_pcidev(pci_dev);
        if (ret < 0)
                mmio_data->key = FAKEKEY;

because it's not only about gen < 6, but rather that it can also be
bypassed.

Also odd that there's no way to differentiate a real error from a fake
forcewake.

Lucas De Marchi

>---
> lib/igt_gt.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/lib/igt_gt.c b/lib/igt_gt.c
>index d3421b3d7f0d..bec50e38833c 100644
>--- a/lib/igt_gt.c
>+++ b/lib/igt_gt.c
>@@ -528,6 +528,9 @@ int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev)
> 	char path[PATH_MAX];
> 	int dirlen, ret;
>
>+	if (getenv("IGT_NO_FORCEWAKE"))
>+		return -1;
>+
> 	if (!debugfs_root)
> 		return -ENOENT;
>
>-- 
>2.49.1
>
