Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6684C83030
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 20:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89EA510E1CF;
	Thu,  3 Jul 2025 20:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mg9NhvWC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B654010E1CF
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 20:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751575197; x=1783111197;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=S78fJls2w1i5WtxSdDU3hOnSSbWEmipFm8HUTiPtZJM=;
 b=mg9NhvWCCONwXw8rH9FhjDsc7ebHiDCqRan4u48eRYcBkoerlQZgb4Nf
 8wLr7MEyWmtH6QrqC+S1B7qS8nfCJWYgjTgWDVQeg6fhMPyWmqimG4bI5
 NUgH41xcCDzq2IMlNvD7EYlyTGunbPW3i3siNlY94D2iNXEWrSPxWf6i2
 ArB+pv1ei6Bu4FRG571HuRqOT6C/gqyThEYdJx3W2uCyem6HYYTDFGeGz
 ANAGdbCnEDp9/Sq7m972wu/a2exTC9g6U7C2nDoJ06aXKhjxCCSgOoG12
 aJ4n/d1zLqDFn1OiuUzKTbqRAQ6ixFqklS0uLQs9azoWCFVP9nSqeU1n+ A==;
X-CSE-ConnectionGUID: GUA+/TgmQv6EobnUsjv91A==
X-CSE-MsgGUID: 2N5bFIJvQB+H3Qfn1Y7YBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57722159"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="57722159"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 13:39:56 -0700
X-CSE-ConnectionGUID: DYuFp1rKS6mwxCEBqHXtLg==
X-CSE-MsgGUID: GbAtq11qSXeaN/8qOg/tBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="153881827"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 13:39:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 13:39:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 13:39:55 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.60)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 13:39:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kT8Xtpv6I3wO+GB2cqZwsrBed392u71r2ZIYm9bwQf0j1+w4pjKNg7tmgN/GL41qz1mpekAyUkrVK9dpHEpP8u9akVSZBcFKhNYINNuQbpW/iTgurUrs+RCvwd4Du5cCOSvOLsMlfy89avHTz/6a//zmBaNZ4x7lMVIRoRWXT/0aXKBEVR+ukfz1DJAYFFgcurEu4Cnrr26puzKmTA/z20O08JemUKSBKu1NZzYhXcpvA11Z3FAjNke8xo1DaHJAy5V52rPU53aPwkJbacoJjRvWrC7K5BXerBupUKDleEcVxpRjbwDwMkLtr8T9BPQzBl0PpKf0byhnA61kRL4u1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBgNQeBonl76ksOXw01ePUIlSzaJ9lWkWJnXEHJPBl8=;
 b=gy/x4fJpQ+2ahadA+Nc9yJPw5c8VX/Mu0XR91oTtsbne2fBaFxiepVtCQR58YMyRsNVWzA8FAOV1zQq03fz4x1FWGOBkswlNuXX28Khn00t2gxWy3XWP2XDwFJBch7ugEkoprmdnk2PXIsBpx5ysIGhrsXexZZ0YvtcXPttdf63vtZepuPd8BtCXNdt6UUtLr66zksLcMdwVy/FSPKGCuQAqb9E+sWi/1VAhp+BUxkcLqP+r8Ez612Kv/f4O33poDO9L6yKcCgKaa6OHooBm4M4XkiqeepZEEhtLTxoq6alpKZ0+mcNa3UfbH5GqSba8ly9vGyGUa4P1XLBvfL3QNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS7PR11MB6038.namprd11.prod.outlook.com (2603:10b6:8:75::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.21; Thu, 3 Jul 2025 20:39:34 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.034; Thu, 3 Jul 2025
 20:39:34 +0000
Date: Thu, 3 Jul 2025 16:39:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <michal.wajdeczko@intel.com>,
 <marcin.bernatowicz@intel.com>, <kamil.konieczny@linux.intel.com>,
 <katarzyna.piecielska@intel.com>, <zbigniew.kempczynski@intel.com>,
 <ewelina.musial@intel.com>
Subject: Re: [PATCH v3 resend i-g-t 6/6] tests/intel: Remove
 intel_sysfs_debugfs
Message-ID: <aGbqgvyK9fzX0aA7@intel.com>
References: <20250616074240.45818-1-peter.senna@linux.intel.com>
 <20250616074240.45818-7-peter.senna@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250616074240.45818-7-peter.senna@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0367.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::12) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS7PR11MB6038:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a491bb-ef6a-4a74-92bf-08ddba71b874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?TWJS02HgP5Xhrn5KynnhJT9COEW1a6dCbBxLgH3gE4o4x5pq9KHWY7DmJn?=
 =?iso-8859-1?Q?H7V1JGL1KCOVfRZIJZciKttDJ0kFpYQoW6oRNITnVrL2AeRiBhlCOR3Ury?=
 =?iso-8859-1?Q?oxFUJYDuX7h5+slG3zr8tfNo7MWbtoUNGhACNRV2SkLUh1pWXGBatlaDNi?=
 =?iso-8859-1?Q?fCg+mp0SMW3rPim/aRXjfmp9bVKf4vK3mCL6TTD060v6VC4X7KGbBYNLMe?=
 =?iso-8859-1?Q?hFJGTafyXR79eCyD7iNsj/DYWncV4QHLE+egZQRq8V+YxfnAkUvfEHuVIY?=
 =?iso-8859-1?Q?tMZr8yQd9l6FuExa/dCGB26sVoYJCQx3+jZM5cj1v9aSEqbEkSL8bTWKrS?=
 =?iso-8859-1?Q?raFXibRJnlVc8Q18C2SNtgFNXz2nVvXa1v7dk1II7o+K3v3yzJOCuIiRrh?=
 =?iso-8859-1?Q?4+uKv3g5WixuUfcmpLzBdlDiynNbrktxXJ+w2gmSr8HOsUGOPz19NIkz9R?=
 =?iso-8859-1?Q?jEMt5HW671v185n+FbJvVqIsNWWmab2AkL5L0MkNfdrpbeYFXNl2CVZEi7?=
 =?iso-8859-1?Q?wuzhulsbzwwS0ys/+89XwPurxnirA5Fqa6d34lRIly2XGI/9HtQR+rBXlF?=
 =?iso-8859-1?Q?GFaoLn5aEIzaKze0mLWlf3/npoGkozI0CUMUJP5j9VEAa7KzdYKVb5thY1?=
 =?iso-8859-1?Q?JvV0jPj1FOyNmk3+vZwFP7Xt20a19n6Ek7zEKgsepob7axZBtKYyM2Ojiu?=
 =?iso-8859-1?Q?XHUpEDbbleliKmPIFPYbWQIeDhVo/lC87NA3zSZJPzsp9VeJIEkgZ1kyq3?=
 =?iso-8859-1?Q?1VNWin3AUm2bRHX9/QvodPvPUVyyjZEVxxX5CZOT9oXzlegXsI02g2jHA5?=
 =?iso-8859-1?Q?HvakHeeZKM5CgqccJGw++OQv0Wgr7oslsxwgUwOWhRHS6FUdYGQ7RdCVaX?=
 =?iso-8859-1?Q?h5THfwsq3xH8fR6L9Mk9cSYBw69U0lrFGHl4s4P0+ZwPN4OQyH3dcDV2Cp?=
 =?iso-8859-1?Q?jpazYrAvdM1N9kRv5QQ9Tg+bTawkVRn+KVipmOpbajfeVmATS/rttAawyg?=
 =?iso-8859-1?Q?CSl7ucNs8jiz4K8YDPj4BcbvizgJ2IV0QqqqylQJHNuZjRRIuXUQ4vcND0?=
 =?iso-8859-1?Q?IfrOu4q1/nT/NRgo1pIGUFa5TUeWMyjpE/9ajr16SP40fF0tUEneDeDOIx?=
 =?iso-8859-1?Q?BM7ta9PI3YzAFo9xYK+kccB80cZ54yjdPU4/gYwSZNHgjPgUIAYDoHw63S?=
 =?iso-8859-1?Q?GPE82Wc3LeXvqIKwyaNdF5sWWFG3sDVED3U5AIYvtKtwcjg6zAc1DteD9Q?=
 =?iso-8859-1?Q?rbT1i6DEYPxBRRX1ZdLl83Zq/SIRzVWZJD21PrIUK3wH/9exV3SJJZzNrM?=
 =?iso-8859-1?Q?LS0sLu8RzC+7RgeBx+/Irzq5kna/477xhHy06Q5u/xRrgW3HhYKjsuLIVt?=
 =?iso-8859-1?Q?ZHfWmzjApDnvFOJblCNx6rqCmAXk0SBTgG72/1MS50O6DW3udrOo8D2yVY?=
 =?iso-8859-1?Q?iMqAlb+qPMEj7Bx1Pd4+PaCwNmfl7qUirLBqTRY1n4tTjE3qMEoQZWu1x/?=
 =?iso-8859-1?Q?k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jeLqmud56HiWaE51RkMH+dAV1pP3/tZhSY4e3YCK9FM06O+2pP3vSY+wBC?=
 =?iso-8859-1?Q?HWhM/+tSwiuqZq4haCAiGELofHtLc1xmnj8BcVucWQO+QBcAHH8IK+iZKR?=
 =?iso-8859-1?Q?sBZGCqWUln3s06rW0+DGRaMEIj+u0Oq/jUVsrJ0yUm5GNhnI1uKvnZgvkH?=
 =?iso-8859-1?Q?tPBO35KVI/S6gUYePSuv1KxDenX7eQzct8eGcPTHcxCGIz92UwoPFYEvkG?=
 =?iso-8859-1?Q?e8VyKXzE1XqnGWuTrPa1ELyOPn1hcdfiU3a1qqPKrfJHpf/nJZSONRQNHL?=
 =?iso-8859-1?Q?/lmmA2rnhOGhpHXaO9TYvWg8qmgdreFqQIioAV5AUNfoTOkviZakNzlzPw?=
 =?iso-8859-1?Q?8u65zqMRvjbKMYbWfj+5u6r2snC+NCxCuXKV1dBc6myEK3Q0nV1PvGLQDZ?=
 =?iso-8859-1?Q?jxq0e38gn753SXiPxUvtVEWUMw2wrGJa4rUgmqEgunbwaBaPTbgP6gCLuR?=
 =?iso-8859-1?Q?ejA41vzlizcaTcT/wA/LpNjbDUWG7PV0flPof1oAHXu2mcFtCrMawBfdpr?=
 =?iso-8859-1?Q?1FnOWwEYZ0sOfaXEFBgYMJ4Bg1W45wEVAU+cpqSQA7YPE+IBpQCLkjqCIm?=
 =?iso-8859-1?Q?1MP5reKA59AFuKgWUFY5ClZAURzjHhX9mR1xDuxQfKqbfxbXJiJxIku+kw?=
 =?iso-8859-1?Q?/XIx5NILnbTrVoJ+YiQzXUPBV75kTBGi71rTHkVs5woi5UDkbzX7savPBU?=
 =?iso-8859-1?Q?N2JrNWbsXTqNkcMdlfRFAY5+i9SgmwURXZSZ7Vw3THIk5fMtg/h2jEwg1t?=
 =?iso-8859-1?Q?PpAfqTQnwUBvzHqGOombqKvkLfutECf3ppoH2VXTa5cJ0qVZfCwayaatEA?=
 =?iso-8859-1?Q?rFR1ZhTxEKjUXNmbUL+OmhaeOD8idI3o+oGPm189XANGBZyRk22ExA0CzZ?=
 =?iso-8859-1?Q?1K2PRA5qV4xOrMonyRxDJfPb2zuGWg9Gm8dSwUsxr32tHSGJcCMLLYlbuI?=
 =?iso-8859-1?Q?fJiENTYZudK5PJlBlhJJkdA/9TMuX0qZZKD5Z/GRqgc+Us5aadHAEa0CHe?=
 =?iso-8859-1?Q?yjtIFP5JwHjTo0YdzSophWQrinDpbN1VZNtgs3gUYaR1BCbM+Ld7kOD/4y?=
 =?iso-8859-1?Q?/Cs3bLTzBeNIfw6Vm2WS2o12FsbgkJC6IpOfQTc/Inw/nQ4eVluOIjKgJ4?=
 =?iso-8859-1?Q?PbwSVV4t6crAldvMY97f6ebSD/1smbAQgHWVhSoRtlJ65CcApS+rpVnx1y?=
 =?iso-8859-1?Q?pAZKSVlsOGfnGnYPuWrIgLKXXo3zsqkqnLL0FRBE29sUcnrqhx+8jWehAd?=
 =?iso-8859-1?Q?9HTFX2a9WVOfTg6v2k7ZfQO0KyPRlnh88CWz6B8bL8uYcYEGpz1NlsE1hB?=
 =?iso-8859-1?Q?HI/mz52i75JxpjlYGH7mG8Aot/c2dqEAViDd6/g+oOwXqJaWPjX8bckkp1?=
 =?iso-8859-1?Q?6HAfX0CoWexR1nxmpS94ikd2RWbz1FrHRLR+yZsy7Oh7CAOXDhpKEXyaTh?=
 =?iso-8859-1?Q?/KarfgOA3R+T//qMeu2dT2Ny8W5NSzh2emb0ZR/OFQc3Ym56u52vFfOKEe?=
 =?iso-8859-1?Q?r0TafZlcRu69kUMNgnkb6lZ4wS1EujnAbdxayDMk8V0w1LCjS4cTr/sY1Y?=
 =?iso-8859-1?Q?2YQsVExu3iTEDoFOQNFYGXAzODxQQFm1ohtDR4jG/uLtqIcIJSqV84bKEj?=
 =?iso-8859-1?Q?jHn03+wa+khNHFBURRrE0k29bwOBn2esJvAdDAYTh/ZFTY1sVdDZdR+g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a491bb-ef6a-4a74-92bf-08ddba71b874
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 20:39:34.7329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iuc7bKQLj09Byu1knosuqaV7LmfnfgYV924+tx2K0Yg91XZ1nrGUqIx69ANABceeaYSF/Nd3+7QsuGrn9n9fSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6038
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

On Mon, Jun 16, 2025 at 09:42:38AM +0200, Peter Senna Tschudin wrote:
> The intel_sysfs_debugfs test was originally introduced to unify testing
> for both i915 and Xe drivers, aiming to prevent gaps in test coverage.
> However, the implementation fell short in addressing scenarios where
> both i915 and Xe were present in the system.
> 
> To address these limitations, it was replaced by:
>  - tests/core_debugfs (gpu agnostic)
>  - tests/core_sysfs (gpu agnostic)
>  - tests/intel/xe_debugfs (complementary to core_debugfs)
> 
> Cc: michal.wajdeczko@intel.com
> Cc: marcin.bernatowicz@intel.com
> Cc: kamil.konieczny@linux.intel.com
> Cc: katarzyna.piecielska@intel.com
> Cc: zbigniew.kempczynski@intel.com
> Cc: ewelina.musial@intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> v3:
>  - unchanged from v2
> v2:
>  - changed style of comparison to NULL
> 
>  tests/intel-ci/fast-feedback.testlist    |   2 -
>  tests/intel-ci/xe-fast-feedback.testlist |   4 -
>  tests/intel/intel_sysfs_debugfs.c        | 430 -----------------------
>  tests/intel/xe_test_config.json          |   2 +-
>  tests/meson.build                        |   1 -
>  5 files changed, 1 insertion(+), 438 deletions(-)
>  delete mode 100644 tests/intel/intel_sysfs_debugfs.c
> 
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index 5d4d101ef..2799bbaa5 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -55,8 +55,6 @@ igt@i915_getparams_basic@basic-subslice-total
>  igt@i915_hangman@error-state-basic
>  igt@i915_pciid
>  igt@intel_hwmon
> -igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries
> -igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries
>  igt@kms_addfb_basic@addfb25-4-tiled
>  igt@kms_addfb_basic@addfb25-bad-modifier
>  igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index c52f08953..017e3ba2a 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -9,10 +9,6 @@ igt@fbdev@write
>  
>  igt@core_debugfs@read-all-entries
>  igt@core_sysfs@read-all-entries
> -igt@intel_sysfs_debugfs@xe-base
> -igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries
> -igt@intel_sysfs_debugfs@xe-forcewake
> -igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries
>  igt@kms_addfb_basic@addfb25-4-tiled
>  igt@kms_addfb_basic@addfb25-bad-modifier
>  igt@kms_addfb_basic@addfb25-modifier-no-flag
> diff --git a/tests/intel/intel_sysfs_debugfs.c b/tests/intel/intel_sysfs_debugfs.c
> deleted file mode 100644
> index dfd8d52d8..000000000
> --- a/tests/intel/intel_sysfs_debugfs.c
> +++ /dev/null
> @@ -1,430 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -/*
> - * Copyright © 2025 Intel Corporation
> - */
> -
> -#include <dirent.h>
> -#include <fcntl.h>
> -
> -#include "i915/gem.h"
> -#include "igt.h"
> -#include "igt_sysfs.h"
> -#include "xe/xe_query.h"
> -
> -struct {
> -	bool warn_on_not_hit;
> -} opt = { 0 };
> -
> -/**
> - * TEST: debugfs test
> - * Description: Read entries from debugfs, and sysfs paths.
> - * Category: Core
> - * Mega feature: General Core features
> - * Sub-category: uapi
> - * Functionality: debugfs
> - * Feature: core
> - * Test category: uapi
> - *
> - * SUBTEST: i915-debugfs-read-all-entries
> - * Description: Read all entries from debugfs path validating debugfs entries
> - *
> - * SUBTEST: i915-debugfs-read-all-entries-display-off
> - * Description: Read all debugfs entries with display off.
> - *
> - * SUBTEST: i915-debugfs-read-all-entries-display-on
> - * Description: Read all debugfs entries with display on.
> - *
> - * SUBTEST: i915-sysfs-read-all-entries
> - * Description: Read all entries from sysfs path validating debugfs entries
> - *
> - * SUBTEST: xe-debugfs-read-all-entries
> - * Description: Read all entries from debugfs path validating debugfs entries
> - *
> - * SUBTEST: xe-debugfs-read-all-entries-display-off
> - * Description: Read all debugfs entries with display off.
> - *
> - * SUBTEST: xe-debugfs-read-all-entries-display-on
> - * Description: Read all debugfs entries with display on.
> - *
> - * SUBTEST: xe-sysfs-read-all-entries
> - * Description: Read all entries from sysfs path validating debugfs entries
> - *
> - */
> -
> -IGT_TEST_DESCRIPTION("Read entries from debugfs, and sysfs paths.");
> -
> -static void read_and_discard_sysfs_entries(int path_fd, int indent)
> -{
> -	struct dirent *dirent;
> -	DIR *dir;
> -	char tabs[8];
> -	int i;
> -
> -	igt_assert(indent < sizeof(tabs) - 1);
> -
> -	for (i = 0; i < indent; i++)
> -		tabs[i] = '\t';
> -	tabs[i] = '\0';
> -
> -	dir = fdopendir(path_fd);
> -	if (!dir)
> -		return;
> -
> -	while ((dirent = readdir(dir))) {
> -		if (!strcmp(dirent->d_name, ".") ||
> -		    !strcmp(dirent->d_name, ".."))
> -			continue;
> -
> -		if (dirent->d_type == DT_DIR) {
> -			int sub_fd;
> -
> -			sub_fd = openat(path_fd, dirent->d_name,
> -					O_RDONLY | O_DIRECTORY);
> -			if (sub_fd < 0)
> -				continue;
> -
> -			igt_debug("%sEntering subdir %s\n", tabs, dirent->d_name);
> -			read_and_discard_sysfs_entries(sub_fd, indent + 1);
> -			close(sub_fd);
> -		} else if (dirent->d_type == DT_REG) {
> -			char buf[512];
> -			int sub_fd;
> -			ssize_t ret;
> -
> -			igt_kmsg(KMSG_DEBUG "Reading file \"%s\"\n", dirent->d_name);
> -			igt_debug("%sReading file \"%s\"\n", tabs, dirent->d_name);
> -
> -			sub_fd = openat(path_fd, dirent->d_name, O_RDONLY | O_NONBLOCK);
> -			if (sub_fd == -1) {
> -				igt_debug("%sCould not open file \"%s\" with error: %m\n",
> -					  tabs, dirent->d_name);
> -				continue;
> -			}
> -
> -			do {
> -				ret = read(sub_fd, buf, sizeof(buf));
> -			} while (ret == sizeof(buf));
> -
> -			if (ret == -1)
> -				igt_debug("%sCould not read file \"%s\" with error: %m\n",
> -					  tabs, dirent->d_name);
> -
> -			close(sub_fd);
> -		}
> -	}
> -	closedir(dir);
> -}
> -
> -static void kms_tests(int fd, int debugfs, const char *card_name)
> -{
> -	igt_display_t display;
> -	struct igt_fb fb[IGT_MAX_PIPES];
> -	enum pipe pipe;
> -	int ret;
> -	char test_name[64];
> -
> -	igt_fixture
> -		igt_display_require(&display, fd);
> -
> -	snprintf(test_name, sizeof(test_name),
> -		 "%s-debugfs-read-all-entries-display-on", card_name);
> -
> -	igt_subtest(test_name) {
> -		/* try to light all pipes */
> -retry:
> -		for_each_pipe(&display, pipe) {
> -			igt_output_t *output;
> -
> -			for_each_valid_output_on_pipe(&display, pipe, output) {
> -				igt_plane_t *primary;
> -				drmModeModeInfo *mode;
> -
> -				if (output->pending_pipe != PIPE_NONE)
> -					continue;
> -
> -				igt_output_set_pipe(output, pipe);
> -				primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -				mode = igt_output_get_mode(output);
> -				igt_create_pattern_fb(display.drm_fd,
> -						      mode->hdisplay, mode->vdisplay,
> -						      DRM_FORMAT_XRGB8888,
> -						      DRM_FORMAT_MOD_LINEAR, &fb[pipe]);
> -
> -				/* Set a valid fb as some debugfs like to
> -				 * inspect it on a active pipe
> -				 */
> -				igt_plane_set_fb(primary, &fb[pipe]);
> -				break;
> -			}
> -		}
> -
> -		if (display.is_atomic)
> -			ret = igt_display_try_commit_atomic(&display,
> -					DRM_MODE_ATOMIC_TEST_ONLY |
> -					DRM_MODE_ATOMIC_ALLOW_MODESET,
> -					NULL);
> -		else
> -			ret = igt_display_try_commit2(&display, COMMIT_LEGACY);
> -
> -		if (ret) {
> -			igt_output_t *output;
> -			bool found = igt_override_all_active_output_modes_to_fit_bw(&display);
> -
> -			igt_require_f(found, "No valid mode combo found.\n");
> -
> -			for_each_connected_output(&display, output)
> -				igt_output_set_pipe(output, PIPE_NONE);
> -
> -			goto retry;
> -		}
> -
> -		igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> -
> -		read_and_discard_sysfs_entries(debugfs, 0);
> -	}
> -
> -	snprintf(test_name, sizeof(test_name),
> -		 "%s-debugfs-read-all-entries-display-off", card_name);
> -
> -	igt_subtest(test_name) {
> -		igt_output_t *output;
> -		igt_plane_t *plane;
> -
> -		for_each_connected_output(&display, output)
> -			igt_output_set_pipe(output, PIPE_NONE);
> -
> -		for_each_pipe(&display, pipe)
> -			for_each_plane_on_pipe(&display, pipe, plane)
> -				igt_plane_set_fb(plane, NULL);
> -
> -		igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> -
> -		read_and_discard_sysfs_entries(debugfs, 0);
> -	}
> -
> -	igt_fixture
> -		igt_display_fini(&display);
> -}
> -
> -static int xe_validate_entries(int fd, const char *add_path,
> -			       const char * const str_val[], int str_cnt)
> -{
> -	int i;
> -	int hit;
> -	int found = 0;
> -	int not_found = 0;
> -	DIR *dir;
> -	struct dirent *de;
> -	char path[PATH_MAX];
> -
> -	if (!igt_debugfs_path(fd, path, sizeof(path)))
> -		return -1;
> -
> -	strcat(path, add_path);
> -	dir = opendir(path);
> -	if (!dir)
> -		return -1;
> -
> -	while ((de = readdir(dir))) {
> -		if (de->d_name[0] == '.')
> -			continue;
> -		hit = 0;
> -		for (i = 0; i < str_cnt; i++) {
> -			if (!strcmp(str_val[i], de->d_name)) {
> -				hit = 1;
> -				break;
> -			}
> -		}
> -		if (hit) {
> -			found++;
> -		} else if (opt.warn_on_not_hit) {
> -			not_found++;
> -			igt_warn("no test for: %s/%s\n", path, de->d_name);
> -		}
> -	}
> -	closedir(dir);
> -	return 0;
> -}
> -
> -/**
> - * SUBTEST: xe-base
> - * Description: Check if various debugfs devnodes exist and test reading them
> - */
> -static void
> -xe_test_base(int fd, struct drm_xe_query_config *config)
> -{
> -	uint16_t devid = intel_get_drm_devid(fd);
> -	static const char * const expected_files[] = {
> -		"gt0",
> -		"gt1",
> -		"stolen_mm",
> -		"gtt_mm",
> -		"vram0_mm",
> -		"forcewake_all",
> -		"info",
> -		"gem_names",
> -		"clients",
> -		"name"
> -	};
> -	char reference[4096];
> -	int val = 0;
> -
> -	igt_assert(config);
> -	sprintf(reference, "devid 0x%llx",
> -			config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff);
> -	igt_assert(igt_debugfs_search(fd, "info", reference));
> -
> -	sprintf(reference, "revid %lld",
> -			config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] >> 16);
> -	igt_assert(igt_debugfs_search(fd, "info", reference));
> -
> -	sprintf(reference, "is_dgfx %s", config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
> -		DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM ? "yes" : "no");
> -
> -	igt_assert(igt_debugfs_search(fd, "info", reference));
> -
> -	if (intel_gen(devid) < 20) {
> -		switch (config->info[DRM_XE_QUERY_CONFIG_VA_BITS]) {
> -		case 48:
> -			val = 3;
> -			break;
> -		case 57:
> -			val = 4;
> -			break;
> -		}
> -
> -		sprintf(reference, "vm_max_level %d", val);
> -		igt_assert(igt_debugfs_search(fd, "info", reference));
> -	}
> -
> -	snprintf(reference, sizeof(reference), "tile_count %d", xe_sysfs_get_num_tiles(fd));
> -	igt_assert(igt_debugfs_search(fd, "info", reference));
> -
> -	igt_assert(igt_debugfs_exists(fd, "gt0", O_RDONLY));
> -
> -	igt_assert(igt_debugfs_exists(fd, "gtt_mm", O_RDONLY));
> -	igt_debugfs_dump(fd, "gtt_mm");
> -
> -	if (config->info[DRM_XE_QUERY_CONFIG_FLAGS] & DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM) {
> -		igt_assert(igt_debugfs_exists(fd, "vram0_mm", O_RDONLY));
> -		igt_debugfs_dump(fd, "vram0_mm");
> -	}
> -
> -	if (igt_debugfs_exists(fd, "stolen_mm", O_RDONLY))
> -		igt_debugfs_dump(fd, "stolen_mm");
> -
> -	igt_assert(igt_debugfs_exists(fd, "clients", O_RDONLY));
> -	igt_debugfs_dump(fd, "clients");
> -
> -	igt_assert(igt_debugfs_exists(fd, "gem_names", O_RDONLY));
> -	igt_debugfs_dump(fd, "gem_names");
> -
> -	xe_validate_entries(fd, "", expected_files, ARRAY_SIZE(expected_files));
> -}
> -
> -/**
> - * SUBTEST: xe-forcewake
> - * Description: Check forcewake debugfs devnode
> - */
> -static void
> -xe_test_forcewake(int fd)
> -{
> -	int handle = igt_debugfs_open(fd, "forcewake_all", O_WRONLY);
> -
> -	igt_assert_neq(handle, -1);
> -	close(handle);
> -}
> -
> -const char *help_str =
> -	"  -w\t--warn-not-hit Produce warnings if it founds a devfs node without tests";
> -
> -struct option long_options[] = {
> -	{ "--warn-not-hit", no_argument, NULL, 'w'},
> -	{ 0, 0, 0, 0 }
> -};
> -
> -static int opt_handler(int option, int option_index, void *input)
> -{
> -	switch (option) {
> -	case 'w':
> -		opt.warn_on_not_hit = true;
> -		break;
> -	default:
> -		return IGT_OPT_HANDLER_ERROR;
> -	}
> -
> -	return IGT_OPT_HANDLER_SUCCESS;
> -}
> -
> -igt_main_args("", long_options, help_str, opt_handler, NULL)
> -{
> -	int debugfs = -1;
> -	int fd = -1;
> -	int sysfs = -1;
> -
> -	igt_subtest_group {
> -		igt_fixture {
> -			fd = drm_open_driver_master(DRIVER_INTEL);
> -			igt_require_gem(fd);
> -			debugfs = igt_debugfs_dir(fd);
> -			sysfs = igt_sysfs_open(fd);
> -
> -			kmstest_set_vt_graphics_mode();
> -		}
> -
> -		igt_describe("Read all entries from sysfs path.");
> -		igt_subtest("i915-sysfs-read-all-entries")
> -			read_and_discard_sysfs_entries(sysfs, 0);
> -		igt_describe("Read all entries from debugfs path.");
> -		igt_subtest("i915-debugfs-read-all-entries")
> -			read_and_discard_sysfs_entries(debugfs, 0);
> -
> -		igt_describe("Read all debugfs entries with display on/off.");
> -		igt_subtest_group
> -			kms_tests(fd, debugfs, "i915");
> -
> -		igt_fixture {
> -			close(sysfs);
> -			close(debugfs);
> -			drm_close_driver(fd);
> -		}
> -	}
> -
> -	igt_subtest_group {
> -		igt_fixture {
> -			fd = drm_open_driver_master(DRIVER_XE);
> -			__igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
> -			debugfs = igt_debugfs_dir(fd);
> -			sysfs = igt_sysfs_open(fd);
> -
> -			kmstest_set_vt_graphics_mode();
> -		}
> -
> -		igt_describe("Read all entries from sysfs path.");
> -		igt_subtest("xe-sysfs-read-all-entries")
> -			read_and_discard_sysfs_entries(sysfs, 0);
> -		igt_describe("Read all entries from debugfs path.");
> -		igt_subtest("xe-debugfs-read-all-entries")
> -			read_and_discard_sysfs_entries(debugfs, 0);
> -
> -		igt_describe("Read all debugfs entries with display on/off.");
> -		igt_subtest_group
> -			kms_tests(fd, debugfs, "xe");
> -
> -		igt_describe("Check if various debugfs devnodes exist and test reading them.");
> -		igt_subtest("xe-base") {
> -			xe_test_base(fd, xe_config(fd));
> -		}
> -
> -		igt_describe("Check forcewake debugfs devnode");
> -		igt_subtest("xe-forcewake") {
> -			xe_test_forcewake(fd);
> -		}
> -
> -		igt_fixture {
> -			close(sysfs);
> -			close(debugfs);
> -			drm_close_driver(fd);
> -		}
> -	}
> -}
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index edca243f1..27de0efaa 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -2,7 +2,7 @@
>      "description": "JSON file to be used to parse Xe documentation",
>      "name": "Tests for Xe Driver",
>      "drivers": [ "xe" ],
> -    "files": [ "xe_*.c", "../core_*.c", "../device_*.c", "../sriov_basic.c", "intel_hwmon.c", "intel_sysfs_debugfs.c" ],
> +    "files": [ "xe_*.c", "../core_*.c", "../device_*.c", "../sriov_basic.c", "intel_hwmon.c" ],
>      "fields": {
>          "Run type": {
>              "_properties_": {
> diff --git a/tests/meson.build b/tests/meson.build
> index 847598255..c8f586982 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -86,7 +86,6 @@ test_progs = [
>  intel_i915_xe_progs = [
>  	'api_intel_allocator',
>  	'intel_hwmon',
> -	'intel_sysfs_debugfs',
>  ]
>  
>  intel_i915_progs = [
> -- 
> 2.43.0
> 
