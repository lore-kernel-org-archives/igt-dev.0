Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95570C3600B
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 10:13:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2666210E3C1;
	Mon, 31 Mar 2025 10:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UhEDsruc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D3E10E3C1
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 10:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743416010; x=1774952010;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=PpoqBWFGoTAQPPIiPgD5jgoAyW8PKWOcwNMflILjKjE=;
 b=UhEDsrucUyNwzU2A48Kz9dZmNzBnYhMwou8tV+V7lym4+l1qmSkXcnR8
 kAKnEojkuWs3aa27tmMQcNJ0F2oKJdm3uHzzUvSYhEkHB/nF/RNxclMf0
 phLvVGjTKTYMv+5dbqv9i6/bXRe+hhv2WKBW90YbyB43Axdom6L/tMWQP
 KkR2wnsb3wjYXYgwSN0xDVpNQVQNzYHLkhwc/zwREcUlRqznWoR5h2x0P
 5SLdJj+0YtmhhWy+wSlnFXwMmJqZoExUVkDtRPTYqgDFi1mx6Tw9HLEFZ
 Rnt8Gjb58ZZXP13pDXVV6sMziI/fAAUMPwbHFhNjhgmT/pTDLKgwSoRk/ A==;
X-CSE-ConnectionGUID: PiI2mQEpR5OiPdF0VJlvSQ==
X-CSE-MsgGUID: +T2qgZG7Rn+dlLgcJmiCEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="48569343"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="48569343"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 03:13:30 -0700
X-CSE-ConnectionGUID: uj0dLmuKQ4eRv1y5RG4jjg==
X-CSE-MsgGUID: P0sf22EZSoG698q/g38auw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="156976019"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 03:13:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 03:13:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 03:13:30 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 03:13:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4PV08eyJfhHuthY8whpJ9CRv+B+dZyfYQM2No4yug1Dw4hL3bZI4Axv1n91/bdST5Y/Euf1S6d/kIgQfVs7Qt8jk14H4uEuHmQ9ObCEqzyl8+VWxp8i3L2ajbdg+5kvpd4xgZ4evmTP4mhcYx6HRSR4DQxvtmXAvn12PbQotx/Rn040u+8Krge7nFOKCdMfEHrAO6/Rri4HJjrkFp5+rUN4hryAkGWCiNvHcQLWesENGpzew3HXwRzyRwqxRQTW2JbzXmUqI39uSQ1sGk6QQyyqWOFoLfpwV2HowMlN56Oa/3bNi9rX5r22myIPrLW3R+YtXeCSLnbmB3Hg8WhJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0giJB+BZNH6/6b0PfsJOMDDx7Y5V/YHXRhAyWBwt8fE=;
 b=ZHeihsgby1gNwlurZDhM0Wlpzgc3J43GmQXpPDf45DlN5Rt5DSmZayDsgj7nBIHfXvg1gpxEJjKtB6hpNokbFOEdvA8WYoka0JxcjKdxfaWslSPBIANmTl/bCQfiFlng0Pt3Ny90cwDD9H0B2vuQek43paNc64Hd3gAy7ydHRaoQC4rF/A8szW1dKuJJ2o4RX/r/I6lCVLl0wF4+1emZ9+ztIA88Trmf/zUU6XfO+m95pxX/q44muNCEWvtvtE+ndmAoF/5XOtKKbEkMcdHhYCko6/QllEwWxNv1iCp+Kvs5S/FUC397gTdam0bmKzJl+rzLRzP4mXRN/VztmtLk7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH7PR11MB6427.namprd11.prod.outlook.com (2603:10b6:510:1f5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 10:13:13 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%6]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 10:13:12 +0000
Date: Mon, 31 Mar 2025 13:13:14 +0300
From: Imre Deak <imre.deak@intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3] tests/intel/kms_pm_dc: Remove PKGC10 dependency
 to validate DC6
Message-ID: <Z-pqurXVlSjpw09x@ideak-desk.fi.intel.com>
References: <20250217170809.175276-1-mohammed.thasleem@intel.com>
 <20250330104544.41774-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250330104544.41774-1-mohammed.thasleem@intel.com>
X-ClientProxiedBy: DUZPR01CA0081.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::6) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH7PR11MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d80a0b3-7516-421f-42af-08dd703ca515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vQsDg1nIYtwdlrDXBMpD1JzrxEBXq5o/LefktmCInRq/s4JXDxCKnDNHqRW8?=
 =?us-ascii?Q?EMhQlSwbh2rdGlOybVyn+4DTrrYyqLKGzFLlswLiPTt53LbOlqXSR/AmXhrX?=
 =?us-ascii?Q?kWAHvxIvrQan8H9S6ghwehhWjKPjnBD9H6CZIs67BB1eSayC5aJuKmGpYFSD?=
 =?us-ascii?Q?U+P5sX8gQc4+H4/dlJbcsiyE2LbYxSnEJPAhwYLyQsOkdmco32UEa9RpBVgX?=
 =?us-ascii?Q?Bx+pjtmIlXrjCm7jRUjrNE3nl6KlEsZA6ECwaH85RXlRr2Oix0w5BK3NJ7uc?=
 =?us-ascii?Q?7sGpipW3hsugGdlEgCot87sPdCLwwYsaiOVrzbUhElT9z9ZyzgPwYtnGUfxg?=
 =?us-ascii?Q?NifebGjRGcG6WQG0+LB66DUBzO24TLySfefK3xHJMQSxUJtobbB6m0Iauv9J?=
 =?us-ascii?Q?mTSnzutVrlJK2IK/+/Ho29wqkDjLjsTz/+vTJ+SgaxlOuCXWKgbPysqWvAu9?=
 =?us-ascii?Q?gMXQLMq/0z4DWhMhH7lJ3RIH+bDFYSXwiA6tAv3k1Od0qysuOquYYvS1k10c?=
 =?us-ascii?Q?XEEFD0eVcExaAXceM3SsOq2NR+lzl+HNL0iYLEgydkHyEJaGcP6eLw9ljVME?=
 =?us-ascii?Q?Y/J9NbqVj83paUFaZv/bSaDoxj9r9a7L0KiDyR2lY2FZRlXwB8kbwNOpPG+N?=
 =?us-ascii?Q?tE1sDw0Pk5KuMxcE5S1T4ZlvjBMnAqLkJnmofsH5PYn/tNHa2WwhYmmcNFDT?=
 =?us-ascii?Q?AmIM1hUMmPpS6K5xioAfkhGFChI7AMNOUgXSwh4VquCq4YBSpROTO+LCS5t6?=
 =?us-ascii?Q?b/aHoh0XoTsau1yGw5mIwFPHYhDU+irY9Z7WMsmZ2FDc3N2eGjKC7Ce78lWw?=
 =?us-ascii?Q?9oWuZds9PbTIUXxL4oJj7zQvlNj7Tv7FZ4zVjJJiURPVIv7xd3JjfLhggifn?=
 =?us-ascii?Q?IZZQHAuSe5+jhKwpMWToHbTBVb/UR9o1Ao1K1Rwb/0cxHbtJJAPCVG9EDSl7?=
 =?us-ascii?Q?VjW4f+luBEyLlnG7llzuYlcNFUIebZ7xlZKE6qHyKiJIp2BuzPUDZkMn38HM?=
 =?us-ascii?Q?owdBo0DB02v38FmzJm6ySISKN/WagL24bVLF+bjC4NYrj6IEwlSPTvsOfOVL?=
 =?us-ascii?Q?Y+acSBcuQ7Iq1L/SyImJVNsuAglcj8CckiqhI+cgkcZ9cyi8JThTF88GgNIR?=
 =?us-ascii?Q?OIVNC/zpihTgXq/83hgBGWKLe4e/HkZUdCoFQjLbkvvgOC4A+PJxvz2tA7iZ?=
 =?us-ascii?Q?sVjIfq689sOb/WBrnSx6BzFzkHJjlbvWV6jkL0+QHdnZZsw2g4bmMHI/UjFe?=
 =?us-ascii?Q?7VT60EhQCgdH7jmCefWQX4NvQBRfVygi4zHlIBgFH6KXxwkdnpe/DX1JA+Un?=
 =?us-ascii?Q?7Cc/3a4i0RDXoz0T0HL2fGFpYrxxbFqLrpHWOVxDta0+KjgbN5EjeMcupboC?=
 =?us-ascii?Q?YKyFGd+77ODmFx7Ex7f+QIrX1PFb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jnkri31eeLjlm7y/93GvHvMC3OGOD2o+nzCWdCv1KiKO3WYr8RLG7H5xuZHU?=
 =?us-ascii?Q?O09rRIBX9KAepYN4ujoo7cXsph/iznnTifqLOfHoB+zJn+T8yRHqSC2ZGmw1?=
 =?us-ascii?Q?JYEApg/J30XONYMSZVmh1weK5lbEQeeu8yUiFgSuVK9WuV3/Ec4rm308Ax/U?=
 =?us-ascii?Q?LTgVeWUPjnHPfzc36/1jE2qy+V5QRln4J2R5/AClTi5tRxHSHwgijq7XWbtP?=
 =?us-ascii?Q?20BdV10vX2IhfPidlhcxaVMIil2HHLu5t0HeT9u7tH7RiIlCxsUumXQaT3d2?=
 =?us-ascii?Q?wAbBlBY7yE7plO8jOdc6+5k0wZ9jSVBaAPY5zz0qCVQnbhl+2cTXlx0gEteH?=
 =?us-ascii?Q?R8nciSWDnkPoKmmTFAw7mVVmG4PeXpf1UFV2qv+gtZp1CEU7w64jY+YBOKtt?=
 =?us-ascii?Q?lwkLRL+1VNIgtef9QQI07RbMj5nlZH1uSBNZs0I0mB8LncXoTYm8+lR80p2h?=
 =?us-ascii?Q?HIOooIuWToqR9Ev3pa2INtQsi2e51T3fsMddyW9cbBCNCZjFf0AaB/8laiOD?=
 =?us-ascii?Q?3OqDUZdtKU//FaTteD/nYgpyr45nxJlBQzCiTcCFfZm0/3CwEuDM8ekhMhoM?=
 =?us-ascii?Q?L/9mBhxw+LZHyqYS01NmyCqrdncn77ZzEFhGRT63ENI5+ggj4mtVRli5LyNo?=
 =?us-ascii?Q?8Us9nfXs0iy4krY4Z7nPDYCFMegHgQi7EOUrYYXzQgDvohrioN67DilGuGgQ?=
 =?us-ascii?Q?ZxE0rp/3gCz+L5XUoB8OSXPOdP/E0F2oyhOGBrD91vo37VuQ2PqKT5LmIQ7P?=
 =?us-ascii?Q?HnSHCvIqO1AtXvsTj5WygiveJaer89a6DMH451Zf9yixjw6WCejSOuW6xlYi?=
 =?us-ascii?Q?AvVOE2bVxghz3SluTCQs+PpCrsvTan4vzhPTTN42mm6JQX8/w/s4RIDnh3/i?=
 =?us-ascii?Q?MkLyCIHgJTUI8LaLu+yvya8xTdxNZg+rVpoGn9xSXnfinIV3jpGwRd9zaZZJ?=
 =?us-ascii?Q?bEnyF5uzC1sM2IxctZ8KybTkQjiRfYRlyxpjETU0NEJsWdG4fPbGKFHI3Lv5?=
 =?us-ascii?Q?Fn/cUbTWuWr/BrvhqcZeJTrylckRMbmB3yDMRGGMWG12B5kubqxtUj5grAlU?=
 =?us-ascii?Q?YuvF8Y2lj9pIcf9cT7PSiDVQuzslNxgxd+9076HcQa3idAqLSkUkICu1MXrz?=
 =?us-ascii?Q?ieLEQrfehpvTcZFZrqXVlX09OSDUMdlm/VE6OjCq0UrUMyl8hS+Pc/n6Su2s?=
 =?us-ascii?Q?VIL6XbgVH3tPMeJ6H0+oCgvb8z92eEcOyJDR8kpYR7F/3GEg6RPOh9luucuD?=
 =?us-ascii?Q?91nXmYf0B/T78Bcr5/maNyRFbLpKXxl9lN92fjD3ddACDFvbqkLGJzjXyFol?=
 =?us-ascii?Q?kR16AHkEA/EWY4jCHZKUklX6d49VeOxNhUNvMX2SY7taeU4Ge92cbeVndGzc?=
 =?us-ascii?Q?PoMAzfLGlHRvwMYUb94UON5aT1y0ymJOvMhCYiVqTFZh0Joi7c5Wq+g9incO?=
 =?us-ascii?Q?J+aluVf44JRDVdHzg1hsXQf9JkKitRl9+vgs2n1RIWzMR8FiZegHvGnuVOgS?=
 =?us-ascii?Q?vmYdiOU2a1o9sQktxeQdaIiRAMGqFhvQfIvpDyy9mPklX2O4uGfWg/sdJas1?=
 =?us-ascii?Q?4z7LzwGhfYcBqZqQq2Tk7NSVLLeXMYksMMwx6ten?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d80a0b3-7516-421f-42af-08dd703ca515
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 10:13:12.8275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bcnH/XOHh/hvV/5KGm8XiT08SjHDHwKgIaEZ4lzu4C0tXOyQAd0RqsQxExhgfmTnEiundgDj00HwzyuzDiLhNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6427
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
Reply-To: imre.deak@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Sun, Mar 30, 2025 at 04:15:44PM +0530, Mohammed Thasleem wrote:
> DC6 counter was removed MTL onwards, so pkc10 counter is used
> to validated DC6 tests but with the new approach of kmd changes
> created DC6 debugfs entry counter to validated DC6 tests and
> removeing the existing PKGC10 code.
> 
> v2: Update debugfs message.
> v3: Remove display version check. (Imre)
>     Update commit subject and description.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 76 +++++++++--------------------------------
>  1 file changed, 17 insertions(+), 59 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 2491cd1f8..56488083d 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -285,7 +285,13 @@ static uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag)
>  		igt_assert_f(str, "DC5 counter is not available\n");
>  	} else if (dc_flag & CHECK_DC6) {
>  		str = strstr(buf, "DC5 -> DC6 count");
> -		igt_assert_f(str, "DC6 counter is not available\n");
> +		if (!str) {
> +			str = strstr(buf, "DC5 -> DC6 allowed count");
> +			igt_assert_f(str, "DC5 -> DC6 allowed count "
> +					  "is not available\n");

These strings shouldn't be wrapped, so grep can find them.

> +		} else {
> +			igt_assert_f(str, "DC6 counter is not available\n");

Here str is not NULL, so this assert never fails and hence is redundant.
You can remove it and change the text for the above assert to stg like
"No DC6 counter available".

You could also add a function for the above, used both here and below.

> +		}
>  	} else if (dc_flag & CHECK_DC3CO) {
>  		str = strstr(buf, "DC3CO count");
>  		igt_assert_f(str, "DC3CO counter is not available\n");
> @@ -376,6 +382,7 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
>  
>  static void require_dc_counter(int debugfs_fd, int dc_flag)
>  {
> +	char *str;
>  	char buf[4096];
>  
>  	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
> @@ -391,8 +398,13 @@ static void require_dc_counter(int debugfs_fd, int dc_flag)
>  			      "DC5 counter is not available\n");
>  		break;
>  	case CHECK_DC6:
> -		igt_skip_on_f(!strstr(buf, "DC5 -> DC6 count"),
> -			      "DC6 counter is not available\n");
> +		str = strstr(buf, "DC5 -> DC6 count");
> +		if (!str) {
> +			str = strstr(buf, "DC5 -> DC6 allowed count");
> +			igt_assert_f(str, "DC5 -> DC6 allowed count is not available\n");
> +		} else {
> +			igt_assert_f(str, "DC6 counter is not available\n");
> +		}
>  		break;
>  	default:
>  		igt_assert_f(0, "Unknown DC counter %d\n", dc_flag);
> @@ -417,20 +429,6 @@ static void test_dc3co_vpb_simulation(data_t *data)
>  	cleanup_dc3co_fbs(data);
>  }
>  
> -static void psr_dpms(data_t *data, int mode)
> -{
> -	igt_output_t *output;
> -
> -	for_each_connected_output(&data->display, output) {
> -		drmModeConnectorPtr connector = output->config.connector;
> -
> -		if (connector->connector_type == DRM_MODE_CONNECTOR_eDP)
> -			continue;
> -
> -		kmstest_set_connector_dpms(data->drm_fd, connector, mode);
> -	}
> -}
> -
>  static void test_dc5_retention_flops(data_t *data, int dc_flag)
>  {
>  	uint32_t dc_counter_before_psr;
> @@ -721,40 +719,6 @@ static void test_deep_pkgc_state(data_t *data)
>  	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");
>  }
>  
> -static void test_pkgc_state_dpms(data_t *data)
> -{
> -	unsigned int timeout_sec = 6;
> -	unsigned int prev_value = 0, cur_value = 0;
> -
> -	prev_value = read_pkgc_counter(data->debugfs_root_fd);
> -	setup_dc_dpms(data);
> -	dpms_off(data);
> -	igt_wait((cur_value = read_pkgc_counter(data->debugfs_root_fd)) > prev_value,
> -		  timeout_sec * 1000, 100);
> -	igt_assert_f(cur_value > prev_value, "PKGC10 is not achieved.\n");
> -	dpms_on(data);
> -	cleanup_dc_dpms(data);
> -}
> -
> -static void test_pkgc_state_psr(data_t *data)
> -{
> -	unsigned int timeout_sec = 6;
> -	unsigned int prev_value = 0, cur_value = 0;
> -
> -	prev_value = read_pkgc_counter(data->debugfs_root_fd);
> -	setup_output(data);
> -	setup_primary(data);
> -	igt_require(!psr_disabled_check(data->debugfs_fd));
> -	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL));
> -	psr_dpms(data, DRM_MODE_DPMS_OFF);
> -	igt_wait((cur_value = read_pkgc_counter(data->debugfs_root_fd)) > prev_value,
> -		  timeout_sec * 1000, 100);
> -	igt_assert_f(cur_value > prev_value, "PKGC10 is not achieved.\n");
> -	psr_sink_error_check(data->debugfs_fd, data->op_psr_mode, data->output);
> -	psr_dpms(data, DRM_MODE_DPMS_ON);
> -	cleanup_dc_psr(data);
> -}
> -
>  static void kms_poll_state_restore(int sig)
>  {
>  	int sysfs_fd;
> @@ -818,10 +782,7 @@ igt_main
>  		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
>  		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
>  			      "PC8+ residencies not supported\n");
> -		if (intel_display_ver(data.devid) >= 14)
> -			test_pkgc_state_psr(&data);
> -		else
> -			test_dc_state_psr(&data, CHECK_DC6);
> +		test_dc_state_psr(&data, CHECK_DC6);
>  	}
>  
>  	igt_describe("This test validates display engine entry to PKGC10 state "
> @@ -866,10 +827,7 @@ igt_main
>  	igt_subtest("dc6-dpms") {
>  		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
>  			      "PC8+ residencies not supported\n");
> -		if (intel_display_ver(data.devid) >= 14)
> -			test_pkgc_state_dpms(&data);
> -		else
> -			test_dc_state_dpms(&data, CHECK_DC6);
> +		test_dc_state_dpms(&data, CHECK_DC6);
>  
>  	}
>  
> -- 
> 2.34.1
> 
