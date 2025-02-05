Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0FAC02192
	for <igt-dev@archiver.kernel.org>; Wed,  5 Feb 2025 22:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB6310E211;
	Wed,  5 Feb 2025 22:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SOV1105i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4A710E211
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2025 22:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738794450; x=1770330450;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bKoVLaWiMNqVbJ/oV3hrMk6Lh+WRmIcd1Uw/tdhfN5I=;
 b=SOV1105iCkG0zGUH+wt3hqZv3oC/8mdNwWwbNjFGKbzxmaTMrLG8RF9t
 DEjUdsBSEYgbcpxqCWaEbi194tkSknzO2ustBuNhgxQKgPQmMqKn2kpdw
 45mcokJ3k4AbgbDG93RWG3C7i6Tma0gi4+mchioo6LeY+4D8IZ6IAq82X
 VZbsfsFEWEwGR0lF7PpoMWInktp2yjyadQcoQ49a8f7ayxr4oajZ07vG7
 Y35GYwdrlrSKY6dQRtv+e28M8GgH5W6J9dNPOgpfv16UdNWGUAR/wkq0X
 OiqdeM2m+51eaZ4Xa56I9xYHR74aotBhxgiocCbkGspSS0pwe+CQOEN0H Q==;
X-CSE-ConnectionGUID: kI2jm50MRP2Piv2n8PzJeQ==
X-CSE-MsgGUID: mimSUb22QkqYfXq5mQHVow==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38613325"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="38613325"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 14:27:29 -0800
X-CSE-ConnectionGUID: /qVdhYrgSayH/E01oj5w5g==
X-CSE-MsgGUID: SpGA6GNIRIGhhGJEEhFlBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="111610183"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 14:27:29 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 14:27:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 14:27:28 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 14:27:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFEMlkrXdV2KHXF+hZqZhSwmZUL9GqqLCVsmJ7zDnW5ChrI6PXN39pLnh4kxvKPXrvlciVlQFNU1GcWKm9e+XheYFy1UTiL8jPJbLrjc0L90PrNyXpA4zqIcpYo8+HA5BS36Y4VhlXx9xZWSUE6tsuIDR7iJG1vLwhMYe69zowhKfEZlxYVbS1dygaDt6zVeEAvch/jgV8CniYT/I0Mh3U6em6F8NE4mE3OWsQdLsUThidTZFAHmZEos8YXP3kkvyo1v/7AN2IlL2a2Y5I7+MwRnjOSFSJ8J1hdroLH6j0JM8g2428Fua3B7hrwZaU7clZcmtFlgLKaSaeRMA1gDsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMO41DgAXewTWRYCewYpfZkNOlyMmY3FnKm04zDufZs=;
 b=M6FGx8skGp8ALhRJutxwRQbw9kYja7S5OQpu+kC/dwBnea77uM8hAjGHAVKbQnmY8qZVme2SkMU+0yjnq3w3UoLvP9aZL9HsgOdKe30w5UpT4FTlwfgjTNOBJ46g58TcakeQJ85CEy8MDhXYvtA9uSqNT/mZ70qT2SMT1Zx/gT1JWp/Hbtls76wOHRN3NSZPWWS6aG2bjMHjJ2QGHNs5PKtR7Gc5QrPt/mvN+fwFpXkdycNF5/Nt2Ooe6wMTE9JLEiUcKwLbSTki2nm5lZsvMGl93XVnSqEMBAznU3C/APAh8sCzGqvjGpksI4EUdxtFUpgfU1UQxspOqeZShLelTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB6774.namprd11.prod.outlook.com (2603:10b6:806:265::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 22:26:58 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 22:26:58 +0000
Date: Wed, 5 Feb 2025 14:26:55 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <nishit.sharma@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_multi_tile: Multi-Tile support in IGT
Message-ID: <20250205222655.GK4460@mdroper-desk1.amr.corp.intel.com>
References: <20250131142712.86716-1-nishit.sharma@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250131142712.86716-1-nishit.sharma@intel.com>
X-ClientProxiedBy: BY1P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: a8bf9c04-4fa6-446a-5b69-08dd46343429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?laDhvawnw1rL8eU5Nkj4e2k/WHFhwYCpMAD511TFjUkgUhAHKWINSPjY1m?=
 =?iso-8859-1?Q?rVROQglLstZl38ByZ6DLCuhSZ6hnOC6cJLlKSBqiP1GHyn8ByYlm+U4ksK?=
 =?iso-8859-1?Q?upczUv0vEK9ahP+4EnuVytqXkIPKsECQp9Gkow5j5NgNTTLtTObEUYUIiR?=
 =?iso-8859-1?Q?uGNUmTtY6oNIuQNd3t1EsjhorXzBIqB3948dVllY+sPSfXG4NKYA6eDzNi?=
 =?iso-8859-1?Q?K7f1+foovfNrxagZ79tooWJ76DCnN+tg0+IDp/RHqvctcYv9dfbTdptz+V?=
 =?iso-8859-1?Q?4uIO+haWhoZjXT/6w0bNHL+9BFdbgL5vVt050TsG2NDnsQfiyrimqRPzE2?=
 =?iso-8859-1?Q?01zp9PN1Mao9+zwAhAbYCkX0yUS9QO/t9kGpGnIRgZtnQJxzamo+sul0F8?=
 =?iso-8859-1?Q?igxOqSjuRyliJ+qiAsTXlBZ0G8PaeEEP33WNuWJ3im4qWXVd6/oANUH1vX?=
 =?iso-8859-1?Q?22rGP8TsYRU45sj2dCzqa+9lRDncZfTpwtblgo3CBYAie0iLNuuJx3Xzwu?=
 =?iso-8859-1?Q?Y70y9NsGsVJ+8Kx45Ko8zgspRaZCrjpJm2qDHwsXj/0kn2i4UQc3cZK5dJ?=
 =?iso-8859-1?Q?QZJY71UO9UbqjwaKwMW7G/XTnjB0ffEJXpHOKaW2uMIRDM/RZ8e0klYPeg?=
 =?iso-8859-1?Q?ElcZ7XmIGSZGkwAivGFaPLKleyRhkZZVlh7Hmw/xQYJUcpKnxZP8/o/xQa?=
 =?iso-8859-1?Q?tns0KfaroDMXMm8wdEaLQYUASdNCuSwDJ5YcrsZhjYmK51YeUHgibMYkkw?=
 =?iso-8859-1?Q?zrM/ef1Xd7yTX/tIHgwGkt8LcDQfjSL8+YuqyizcRL9pLnioEp/AhwfjvD?=
 =?iso-8859-1?Q?byyPLQVbAA+3wgfL6CyexSZyUwmrbiA7Y+W80TgvvVW3PH3cUhRKYjt2Ld?=
 =?iso-8859-1?Q?iYTphanyeY5inb6Ik4hNEGBaTyOkKYi7qPzm8b1veruug+0TDKO6JPhY2i?=
 =?iso-8859-1?Q?lxXU5KpxdRip7lm3yB17MPY+SlqH/uQaBWJAbb25UE15sJmVrfQjcS88DH?=
 =?iso-8859-1?Q?gpyhfEwf57gUPEiEHAkmEAvFvPBxGEeqYdtNZA3rpMfGsERH+ahIZmuunZ?=
 =?iso-8859-1?Q?zwJ6J+eItXCmqdQznylk2rZgWmLXUZo9DywGSm8YeAVkUr7n+mBXFOCYsN?=
 =?iso-8859-1?Q?kPBrIJeke3PXJtVUgF8s3siBV6FjRgYlv6FMAH7DeJEwwLkmj3Ex8s7U2n?=
 =?iso-8859-1?Q?KIKdO4rpD1DHv+Ph12LYnUyMmN3J3s7hkY6bQUJuELMseUNR3xUYr6XoE/?=
 =?iso-8859-1?Q?P69Xi6NMRPZdp+ZP2ci8O9TtDC2zYGEwYM3vvu5JKomMZ0clWkx4SD70Pl?=
 =?iso-8859-1?Q?sJlfAF5el9M7j7ojrVbe3hM0JEXoXGDaQy/u4wlOWaWvuHAdezT4dLTiXU?=
 =?iso-8859-1?Q?j2ayBMmOesexu/kxT2ZkkFgDlqI0UZ5quhiYZ3Q0Uwwry75bhAqMezWhJI?=
 =?iso-8859-1?Q?BsWjMXud3lK+Er6I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HDEKQFP8rbbwS2XHtpUfu68+s6BLXMs6GC0gXy2JgplM7dWpQUi0C9ZH07?=
 =?iso-8859-1?Q?+N5gtzpkAGvY4864bVusttP6/ze4vtTL8UxX6vUJUqUC35udiPlQmqVvPV?=
 =?iso-8859-1?Q?vBFQNLKzk+tWfvkspA7+BsMrLoSXkl1GWNcP4/R1Q7c2WZjnqZAFIuLf8h?=
 =?iso-8859-1?Q?OECP2EUKW9RVxg8w1K6wMezaizCivSvfHo1No7wv4OQIf+OhrCwr4HTVim?=
 =?iso-8859-1?Q?XXaMRm6fB65LM+zI0iuoObKz/BcDiHIrGpSJgBoZB0dRFgaPzh4mVK/56u?=
 =?iso-8859-1?Q?zeqUOLm6rgDQqWwRe5NfzIf61KnMwZ2ZmJEmkxO0LofKTZ8Eh8WTSy88++?=
 =?iso-8859-1?Q?Y2igHqn0w1XsGU6iGm0ua2N/WBgLuvkmtf3osXzASjOvN/ICUElI47qLhK?=
 =?iso-8859-1?Q?pB/mky3+EgEjWVp3X/Jj+8vjKZ9xCTNyAvdQ64c2yke6jqDR+XIvBinx05?=
 =?iso-8859-1?Q?WyKn8vI1FkfcfW7VC2krjC7QGWMrdVklHfRkKko0BXW8KeuPjqbYBiE2SM?=
 =?iso-8859-1?Q?bAiwQufoZOhpcfVk+SK+Xyuuxr56g1buv2fazHxnNukVIpmKfqg+sMIzok?=
 =?iso-8859-1?Q?C2laFo3yX5HQhYurW1PMM9vRyyyhD+u1PI9CAwBM+P8WK1Kur+cx7Rmuuz?=
 =?iso-8859-1?Q?Or/Os7HDKPNhnBE8eO9Gh0GCSQAmfRCpXhLNhaBGr2L1lgLgI1lKLKsTj4?=
 =?iso-8859-1?Q?LylxbRDrFkrTupyUA7QXFsunzFXH3eD4sXYbqiGKiuKXhUes7tPJb75s26?=
 =?iso-8859-1?Q?O784487ILe9ppoYkyePJIZjfuobLPnDET0zdwRhlPygReXPnTmNKJWm4qS?=
 =?iso-8859-1?Q?v6H6m8lgGT826e3aSr/Iltu3dJ65NW0qFyfXYKOoWgqRmC5boa66bT6mmr?=
 =?iso-8859-1?Q?7Cyl4CXcHHspd7MkdgnSpUE7EbKlHLYDEJBKfaQd9W5L/3x8bJvKA/GL5L?=
 =?iso-8859-1?Q?Kzc9RDMDZv5b0RArJe16NP9TLaeVP6Hyxd+73eZZV/lZTEWXfidqCrsmG7?=
 =?iso-8859-1?Q?MlwrJH27rX7rlTLoWhP5xgTYLYKzDAm+SXCNA4jYomSzHUp21nPf+ED1hM?=
 =?iso-8859-1?Q?v32rRpZvGYKx1y9gyOykRoMuHmbpwAAUaXc+euTSRM232azOCVs/vgEO2X?=
 =?iso-8859-1?Q?05UP/wZbg2fz70iGMFrqnzce8O04lZe+pnlkNo5VTxNCfJ0G1HlR5mnXsi?=
 =?iso-8859-1?Q?Q8ubKWvIDg2b18T9YQSvUZoG7ji8dsdKANhwQiMq0Of1fb0AMlTIbBfU/a?=
 =?iso-8859-1?Q?NugUYrmoL/FymMkQwUDG+67wgOrcNNYvt89LRAd7uzbJ50YctleSJT6Zfz?=
 =?iso-8859-1?Q?01M2O2d4YJPZ2K2BzlqHgEZFVOuk23R897KnhjFYdVXRkl8Qs+CAvnbvIr?=
 =?iso-8859-1?Q?l/Ne9vzzRVHKHJtC8ZouWzO/7RSRfmDB5T8R5Jc23C8hvYyi/hT7D7gQFT?=
 =?iso-8859-1?Q?BNVm8iZnOWUq8o2/PV+NB+tXkdYhDV7xAInSQNDlQtMODGoyb0MzgIzdl+?=
 =?iso-8859-1?Q?31xv8YV9n6uE09qvSGNZuaaQbc7qRKjrF7Od1aV5eA8kbA/2qxYIzaF8KG?=
 =?iso-8859-1?Q?lkeTSuIY4v0CWWr8JRWT+V4ip1hxsrEALSoQSoxDol9P0Q+xMbMTmjzOtR?=
 =?iso-8859-1?Q?cMr2CbyijckoQtqRvpwFNYP/4Twp/4gaEujQKp76+1xnfwEeXCMqr8Rg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8bf9c04-4fa6-446a-5b69-08dd46343429
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 22:26:58.6001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mihx9s+aYUNEzpBxBFe6XkFp+hjPECe6RX0Nei/wy70CjBlWpQTHWdwDpRXGAdr/rM/9SXg6OPHpnvUUS1UQqPfzQ8HqD9hKsRrhGNsBj/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6774
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

On Fri, Jan 31, 2025 at 02:27:12PM +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Added functionality to get Tile ID, GT ID, GT belongs to which tile ID
> in multi-tile/single-tile platforms. Added functionality to check if any
> tile_ID information not provided by driver. E.g.tile available in platforms in order tile0,
> tile1...tileX in serial order, If tile1 tile2 tile4...tileX populated
> than will get Warning tile3 not available.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/igt_sysfs.c             |   3 +-
>  tests/intel/xe_multi_tile.c | 191 ++++++++++++++++++++++++++++++++++++
>  tests/meson.build           |   1 +
>  3 files changed, 194 insertions(+), 1 deletion(-)
>  create mode 100644 tests/intel/xe_multi_tile.c
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 00d5822fd..37f1716e2 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -234,7 +234,8 @@ char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen)
>  
>  	if (IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)))
>  		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d",
> -			 major(st.st_rdev), minor(st.st_rdev), gt, gt);
> +			 major(st.st_rdev), minor(st.st_rdev),
> +			 xe_gt_get_tile_id(xe_device, gt), gt);
>  	else
>  		snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile0/gt%d",
>  			 major(st.st_rdev), minor(st.st_rdev), gt);

The fix for the library code should probably be a separate commit from
the new test being added since this will presumably change/fix existing
code.

> diff --git a/tests/intel/xe_multi_tile.c b/tests/intel/xe_multi_tile.c
> new file mode 100644
> index 000000000..7ca40f1fe
> --- /dev/null
> +++ b/tests/intel/xe_multi_tile.c
> @@ -0,0 +1,191 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + *
> + * Authors:
> + *      Nishit Sharma <nishit.sharma@intel.com>
> + */
> +
> +#include <dirent.h>
> +#include <fcntl.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +#define MAX_TILES	8
> +#define MAX_SLICES	2
> +
> +struct xe_gt_info {
> +	/** @type: GT type: Main or Media */
> +	uint16_t type;
> +
> +	/** @tile_id: Tile ID where this GT lives (Information only) */
> +	uint16_t  tile_id;
> +
> +	/** @gt_id: Unique ID of this GT within the PCI Device */
> +	uint16_t gt_id;
> +};
> +
> +/** @info: tile-gt info */
> +struct xe_tile_info {
> +	uint8_t tile_count;
> +	uint8_t gt_count;
> +	uint8_t mis_tile:1;
> +	uint8_t mis_tile_id;
> +	struct xe_gt_info gt_info[];
> +};
> +
> +/**
> + * TEST: Test to get tile_id by iterating gt on xe
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: mapping tile/s with slices available
> + * Functionality: gt operation
> + */
> +
> +/**
> + * SUBTEST: show-tile-info
> + * SUBTEST: gt-configuration

These don't seem to match the name of the subtest in the code
("multi-tile-info").

> + * Description: Test iniitialize xe_tile_info structure with tile_id

This doesn't really seem like a meaningful description since
'xe_tile_info' is just an internal structure used inside this test.  

What is the actual goal/motivation here.  Are you trying to verify that
the Xe query interface returns data correctly?  Are you trying to
confirm that some kind of hardware behavior is sane?  Are you trying to
confirm that different interfaces give consistent information (e.g.,
query ioctl vs sysfs)?  It's hard to give feedback on the test when it
isn't clear what the primary goal is.

> + * Test category: functionality test
> + *
> + */
> +struct drm_xe_query_gt_list *xe_gt_list(int fd)
> +{
> +	struct drm_xe_query_gt_list *gt_list;
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = DRM_XE_DEVICE_QUERY_GT_LIST,
> +		.size = 0,
> +		.data = 0,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +	igt_assert_neq(query.size, 0);
> +
> +	gt_list = malloc(query.size);
> +	igt_assert(gt_list);
> +
> +	query.data = to_user_pointer(gt_list);
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	return gt_list;
> +}

Isn't this function basically the same as xe_query_gt_list_new()?  Can't
we just call that instead?

> +
> +static void igt_get_gt_info(int fd, struct xe_tile_info *tile_info)
> +{
> +	uint8_t iteration = 0;
> +	uint8_t gt_id = 0;
> +
> +	igt_info("GT iteration\n");
> +
> +	for (int tile_id = 0; tile_id < tile_info->tile_count; tile_id++) {
> +		for (gt_id += iteration; gt_id < tile_info->gt_count; gt_id++) {
> +			if (tile_id == tile_info->gt_info[gt_id].tile_id) {
> +				igt_info("GT :gt%d belongs to :tile%d\n",
> +						tile_info->gt_info[gt_id].gt_id,
> +						tile_info->gt_info[gt_id].tile_id);
> +				iteration++;
> +			}
> +			else {
> +				igt_info("GT :gt%d belongs to :tile%d\n",
> +						tile_info->gt_info[gt_id].gt_id,
> +						tile_info->gt_info[gt_id].tile_id);
> +				continue;
> +			}
> +		}
> +	}
> +}

Was this function supposed to do/return something?  With a name like
this I expected it to return information to the caller, but it seems
like this just loops and prints some debug logging.  If we removed this
function completely it wouldn't actually affect the test in any way.

> +
> +static void igt_check_if_missingtile(int fd, struct xe_tile_info *tile_info)
> +{
> +	if (tile_info->mis_tile == true)
> +		igt_warn("Missing :tile%d\n", tile_info->mis_tile_id);
> +}
> +
> +static void igt_check_if_multitile(int fd, struct xe_tile_info *tile_info)
> +{
> +	igt_info("Check for Multi-tile support in Platform\n");
> +
> +	igt_skip_on_f(tile_info->tile_count == 0,
> +		      "No Tile :%d found in platform\n",
> +		      tile_info->tile_count);
> +
> +	if (tile_info->tile_count == 1)
> +		igt_info("Single tile :tile%d found in platform\n",
> +			 tile_info->tile_count);
> +	else {
> +		igt_info("Tile count :%d in Multi-Tile platform\n",
> +			 tile_info->tile_count);
> +
> +		for (int tile_id = 0; tile_id < tile_info->tile_count; tile_id++)
> +			igt_info("Tile :tile%d available in platform\n", tile_id);
> +	}
> +}

It seems like this is a lot of unnecessary debug logging; all we really
need is a skip at the callsite rather than a whole dedicated function to
do the same thing.

> +
> +static void igt_get_tile_info(int fd, struct drm_xe_query_gt_list *gt_list,
> +			 struct xe_tile_info *tile_info)
> +{
> +	uint8_t tile_mis_count = -1;
> +	int prev_tile = -1, tile_id;
> +
> +	tile_info->tile_count = 0;
> +	tile_info->mis_tile = false;
> +	for (int index = 0; index < gt_list->num_gt; index++) {
> +		tile_id = gt_list->gt_list[index].tile_id;
> +		if (prev_tile != tile_id) {
> +			if (++tile_mis_count != tile_id) {
> +				tile_info->mis_tile = true;
> +				tile_info->mis_tile_id = tile_mis_count;
> +				tile_mis_count = tile_id;
> +			}
> +			prev_tile = tile_id;
> +			tile_info->tile_count++;
> +			tile_info->gt_info[index].tile_id = prev_tile;
> +			tile_info->gt_info[index].gt_id = index;
> +		}
> +		else {
> +			tile_info->gt_info[index].tile_id = tile_id;
> +			tile_info->gt_info[index].gt_id = index;
> +		}
> +		tile_info->gt_info[index].type = xe_is_media_gt(fd, index);
> +	}
> +	tile_info->gt_count = gt_list->num_gt;
> +}
> +
> +igt_main
> +{
> +	int fd;
> +	struct xe_engine_list_entry *en;
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct drm_xe_query_gt_list *gt_list;
> +	struct xe_tile_info *tile_info;
> +
> +	tile_info = malloc(sizeof(*tile_info));
> +	igt_assert(tile_info);
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		xe_device_get(fd);
> +	}
> +
> +	igt_subtest("multi-tile-info") {

As noted above, this doesn't really seem to match what the test is
doing.  It appears the goal of this test is to make sure that all tiles
have consecutive IDs, at least as far as we can see from the query
interface.

> +		gt_list = xe_gt_list(fd);
> +
> +		igt_get_tile_info(fd, gt_list, tile_info);
> +		igt_check_if_multitile(fd, tile_info);
> +		igt_check_if_missingtile(fd, tile_info);
> +		igt_get_gt_info(fd, tile_info);

As noted above, this function doesn't do anything; we could just drop
it.

> +	}
> +

Depending on what your goal is, should there be other tests here as
well?  E.g., should we confirm that the query interface is consistent
with sysfs (no tile IDs reported in one that don't appear in the other)?
Is there anything else we should be checking?


Matt


> +	igt_fixture {
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 2724c7a9a..2cc01aa0c 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -292,6 +292,7 @@ intel_xe_progs = [
>  	'xe_exec_reset',
>  	'xe_exec_sip',
>  	'xe_exec_store',
> +	'xe_multi_tile',
>  	'xe_exec_threads',
>  	'xe_exercise_blt',
>  	'xe_fault_injection',
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
