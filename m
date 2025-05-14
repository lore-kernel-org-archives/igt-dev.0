Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BEFC3ABDA
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 23:06:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3AF10E755;
	Wed, 14 May 2025 23:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W28Eqt25";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AE810E755
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 23:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747263964; x=1778799964;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dkHJTSRqxfBHGjnWWEZGHXJa+ppgqYpfXx1nyEnNu8M=;
 b=W28Eqt25Fl7Q0NecB0yTAFxTMZEdWReCbc4klN97DKPExUD+/DRNhEGH
 6EPNb+7WiY2ZDzms5bVliXYA+xMCBqM18J+nC89fRWaQsOfWHzwK5xQo2
 CIjcgY1EvMRqno82zA0QAlALbrcBi0QCs9fFvdkU30VenApQgmpM8XsAx
 Ob/MvTwRXodmPrMFdzoEVPS3iZBTt7mebpQo9z5JjhqplQ/BETqZIenkx
 v1H/k51jSDzpfmP9x2USoRVlvPKXOpBMVffo+Su9zZxCrmdDL5donG3qQ
 DlUMl71+2Ft8A4nfosnMKHEddK2F1fr3Sf5AzfqYAt0dDvXo0rT+cLAfA Q==;
X-CSE-ConnectionGUID: Graeliz8SBKj+qNLXmcaDg==
X-CSE-MsgGUID: fhTDNL/XQvOlmkqnaA+D7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49322933"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49322933"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 16:06:04 -0700
X-CSE-ConnectionGUID: hWeHYzr/Tn+ud0w+AqYRGw==
X-CSE-MsgGUID: f47ixhIMSwyxKkTc80QrvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="142204173"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 16:06:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 16:06:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 16:06:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 16:06:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIaZDdYJ6nYnFeVfXVYwgIDWdnoFIOVZ/bTlRXuaAZct1hhPfkj43mYcHKUwYcSieUeHqd4Q+qebjHh2XVQnlvDndoZqzQp16AzEl584IUn9cbL/wzFmIhtA3E0Gs/LQpT7PdO4iZKIBQdvVjmhiDRu1XHvpT4IxwIo/4+C0pxZ/0v7dfAQT4bf4HcG0Unv2YfbuFaW4zLbppNL0TMktmzUAoTt2QDhYDR6g8qSh8qMQNXV+VTKEI/Mpzrm/R2Xa5/SGGUGruRQwYcuYaWMN7JQOoT8TZkSqvCyuGFxmWa2LfYKK4AdlGRCavx0CvN/uNcfMR/vwm5/JHOvoqM3KVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5edgNHMVkzseVmNp4qE662ZO2KaM3dYqADctw1LPIS0=;
 b=embE4Z8GpFWt9oHoXow4tGfRbXh2WyfsU4avRoHmbr2fGIXjF9TDDAOOT968ifoMqzjI9s464//uWWSNLjbhutoZEgyocXEL5pUzjDN15DYBW7PohKanJQrOllLkS0XBtJxiVTu+tD8IG0FE/TIFwWDOSHnWvHHhUPi/agyyRFNWxBoN0G3i7z6vbbWIn+ilI050D8iNMM0AmSv89SDKzne/363yBrYVMBA9qHy0n/TPnagJNaMdflnPXye1zuM6BB41nRISlFyWwQnVC19i1XRuLcbduSYq6h+Q0b3FkWq8vXObZ79b13VIYkiW3JZkbmr7On/0ocLsB6A7m5T63w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5170.namprd11.prod.outlook.com (2603:10b6:303:91::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 23:06:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 23:05:59 +0000
Date: Wed, 14 May 2025 16:07:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sai.gowtham.ch@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 3/3] tests/intel/xe_exec_system_allocator: Rebind the
 prefetch ranges
Message-ID: <aCUiL2ZEbdCLFBRw@lstrano-desk.jf.intel.com>
References: <20250513170711.14518-1-sai.gowtham.ch@intel.com>
 <20250513170711.14518-4-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250513170711.14518-4-sai.gowtham.ch@intel.com>
X-ClientProxiedBy: MW4PR04CA0036.namprd04.prod.outlook.com
 (2603:10b6:303:6a::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5170:EE_
X-MS-Office365-Filtering-Correlation-Id: 71d0e500-b3ca-4b21-5938-08dd933be428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wFgxOIJo4aPtu3Wx1zNSXvhqrhwNBiZ1oA7ChP6NToXld3ZqRLKGjRC8fLdK?=
 =?us-ascii?Q?tuo96SgtksavVzdERb0UmEL9Y3KbSeYeuaDPdXx9+NCSITXrkkY/aOyOBM2v?=
 =?us-ascii?Q?oKlmk1u07l1uoqGuXmxBzhxVA+OaB1fwcS1tMTXiLAihTwL6nM3BBtJPXoSH?=
 =?us-ascii?Q?mey4nFRCDs482wr+bKjqOaucEWhl8YJZU24Nl/sJawsuSFaH3RHm39QK1Hoc?=
 =?us-ascii?Q?0D8Sc0qKMtaWeFm74np00ztTmqcQvXWZAM+IdTORP5SL7x05wKCxoubobMfb?=
 =?us-ascii?Q?hQ/yhr8ClnOX1BVGGegtZeGqcWJYGy1JZwpRtD0xhFtC/5ZoZAOYxWepNSs9?=
 =?us-ascii?Q?fosDLzgl2brDoVGUwZdwMG9nofrczRdNbzAMyZfBOrwywXyvk/H81Oqq/4Xt?=
 =?us-ascii?Q?mRgd/1YD/Mds1H4EoxrDtooYDf6db7aYIpWEW8gwhOxhmNxYMR545oqZmPUG?=
 =?us-ascii?Q?/IZ0KtS1mCM0y9L1M7NZx0fyx0Leqv775yTdfYW3XKbdZYCpkacrL9W7HSLS?=
 =?us-ascii?Q?T0oiEYSj5jRp2e6YSRWgtlWojiAk1ddK3g8HHqYrRJ/1zzthITns/mXFyfBb?=
 =?us-ascii?Q?NalTCEfpJ3tYr+GOYa7skFUpmAsPABa0HZHa7m1l0ehj2r+69E8eOxqAhGB4?=
 =?us-ascii?Q?zfnoLh1dnbe9+qGyl9PoitRy9Rxddy8yf8bUz0qbMFxfoR3tsDh/6SKWBUL7?=
 =?us-ascii?Q?+x1QiJ3GXWiJNr+nz85SFbsRV7AtTj1mtqEYcqy/4IuGXnbqzLxS5OjwbhQN?=
 =?us-ascii?Q?UrTf+3Yu09nnT1Z0nbvquNXK0aZU3V++trhGw1kBZU93mZ+72nEWn1BDKgLz?=
 =?us-ascii?Q?g8d5paUJsl2lFe646AMfTnWayewgRZDSVTlMxuY4NnnMtHsNQSHK1jX9sHer?=
 =?us-ascii?Q?7Osg3Z9u2SDqnLT4QoM2lGjyOSjdZelunLDdKBOvu7lRpp48apH+QKQt7rCU?=
 =?us-ascii?Q?Ue2MCuhrApGWEKd9ngX0ga/3tUp9/5vD1oEJuhfJCBnameyYtqCjRKmQPeqG?=
 =?us-ascii?Q?QKOQSvzoZqhZywGLkOzuaUXs+F909b0IOTHtFzsy8nVyZVcklC/+O/C+s2Ll?=
 =?us-ascii?Q?hwiZnY9aMdPgDn7vNDtNHYPPgpVLIDdx8/94dJhMIEaZd4PmVSSScpReeTXg?=
 =?us-ascii?Q?FhTlFGS2OKZekzQ6HeOvt8ppSlMtu9rlp9EEqoyPC6/ywfcG0zb+8GWo8aZa?=
 =?us-ascii?Q?e4UnIt9RfhXg1uyae1mjrywbBbghlHAjvPcexSOcB+CixIOxnNTacQT3YGyL?=
 =?us-ascii?Q?8+lEiFiiK9ZmlbEQh9vYKTxEN8rLs5W4S1wrHupJK6pf99ybZ/RhbRuakyb8?=
 =?us-ascii?Q?jV4D2TNMFtbW3sz6ZASy2TXiW3NybqJoC3AEv/gsYfpfh8dm1TL+01i+0XAt?=
 =?us-ascii?Q?6Hxv+yBkWlq4U2Sts4kmGYbVqstdcJ/D2uDgHYwsJCUtzR1A6F6ba+M3zroX?=
 =?us-ascii?Q?4qagDF4EnGg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dSGXa+JSRGxSS6I85tFP1Z34/zPZLNfsVIZXJk7TqL8hVWy3RVvjbDKbLc61?=
 =?us-ascii?Q?kgL77vUJB7UeAulsixr5D4uKeJPbFPY3ms2hjwLjARmTsS7YjVkMCH+ODrOL?=
 =?us-ascii?Q?NlmTWndLrlSTJM7i/N7WV+UkPd4StCz2XHapt+hfpgm4mWyLAboPcsHwaZQO?=
 =?us-ascii?Q?iOPRlTb/qj5bCtcgwo62hmZxreeyu3Hh+Q8Mrc3q6R7U1QYdpXiRDlF8BR+7?=
 =?us-ascii?Q?TimX7OW3FHI6ZxHE6xKRBhjDQmtWyF7TYwLjNiO8IFFE8f1NjcrthXv9/6vk?=
 =?us-ascii?Q?p0uyt4TEmvsbiYw7hktLu0FtW/3Ydxt9Xb61DFqpAZnGBqPuqeGgnuSD+Jp0?=
 =?us-ascii?Q?XLgqKU4Frxf7ldY/gueu86CP38glxQGFtKtZyoAlPpT/toL9dPHfCqf+z0OP?=
 =?us-ascii?Q?+NVf02zJ3haT0dLWSR7aYrwa1qSNe8DRKManHPYnd7p4qGXMYj+CF6LHcZ/N?=
 =?us-ascii?Q?LoCSIKVKMsjc46BkU4KgDiY506lF9ThEA2MSVjs0ugzesdFiJ9GznxQdPD23?=
 =?us-ascii?Q?7uFFW+aLmDezHwzyVQxGUZ/T+qywIQvD7BLomHj5JdjCqv+PZDte0lTaWZ7Q?=
 =?us-ascii?Q?7o3bs9dsR/JnbG40W5yRaxsxFqMT4/mW2BQc41X/NxwcoKuK1Mo+7jZ6iP7K?=
 =?us-ascii?Q?SqeUe/aIg/ovK6O3NMAN+U1SEOc+0pElc2HEraS/iaZLgQ7n2J0eBkYfglWT?=
 =?us-ascii?Q?q268GRZEn/u2XguAmQV0mPcXEfr1+DiFyg8zE6BUffQUKm4G0hBdgLH1Busr?=
 =?us-ascii?Q?/8IV4cFi7BOp4T8LK2Bcq4ra17j6NWsOI+6Y97A/ncvJ87ch6tquGE0MdsTX?=
 =?us-ascii?Q?tleTh5VONWE2VCXkkS4MSWojAXm6nN98/Sd+9pczUdx+jfK5pjpB/7QPaNmr?=
 =?us-ascii?Q?3XKkpp9HPRqogsfiBDXVSKBYSPofKdWd6qmvM5YbNRny3VavVBTzYOhxKCuf?=
 =?us-ascii?Q?20udpJgO+jZSMWPFUHgtG5nPGHOjh5bBiWXCJ7zFW+iSF75QdcfW8LFGOnZ/?=
 =?us-ascii?Q?1v+kPxfu6YorVr4bzy6TM0W+fL/4F13x5I+dXmZcBWz8fWNU35z2pupk/1TP?=
 =?us-ascii?Q?Q/szW49Q75WoiR8+DSs97AbrgZlejrxNbmWDHm4A+nr6AWRGSSdo1H9flcOo?=
 =?us-ascii?Q?ruve4qFhAwF/aWU33sxv7+DTYeON3gxRSzfuYs2I5TFlpshocLdXoaCwKFNL?=
 =?us-ascii?Q?yaDBdjSqVGHI5erBvDkT05XmAPxsa909Fce8rUgbnX0UNLYzK0lnH4XG2AiX?=
 =?us-ascii?Q?akV7G/IWhe7yvfhlgEyyUNKcGYuFt7qsHz7g2OZHZSeI7aXBUdP7pNYZEIw2?=
 =?us-ascii?Q?xhShqGwlbqXjLPoV49SPu/nQPodn+U99LQB0Hw8ONrUxVYpgzHNg4BV9PNtL?=
 =?us-ascii?Q?vizfZnK564VClDao/D4Dik4ra9xTk0aSVlGFLP2pfFNDTz7JsNRwTTDzuQJ1?=
 =?us-ascii?Q?X8FR95nFS+YS318CdrSov4pfNFeVsOAyIQ/Dni+aiFn16uEQezfzOatgRLHM?=
 =?us-ascii?Q?W3fDKlmOfNPfQSlHfa9yNDzvXM6LIJWQzj7O1Ku+IJVZgg3tO7548PFGKC9d?=
 =?us-ascii?Q?gEAOwr9WQ2yNJUQInlBUszDAycbCU3koaMqHQjdQTTwgRKvXJ1hnwkxwb4zb?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d0e500-b3ca-4b21-5938-08dd933be428
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 23:05:59.8323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5SxefboIBC2bXm16I9m17rIXV1e0e88g52NE8z7qIkEASUH3IsAG47qUYt52NWQGJsE9xjXaclKvy6E5mN19AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5170
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

On Tue, May 13, 2025 at 05:07:11PM +0000, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Test rebinds the prefetch ranges to check the ideal behaviour of prefetch mechanisim,
> expecting address ranges in the corresponding mem regions has to be created again and
> use those address ranges to submit workloads.
> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 47 +++++++++++++++++++++++---
>  1 file changed, 42 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index c3f0e61f3..94907847c 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -484,6 +484,24 @@ static void test_basic(int fd, struct drm_xe_engine_class_instance *eci,
>   * Description: Prefetch of mutliple ranges within arg[1] size and check if multiple ranges are created
>   * Test category: functionality test
>   *
> + * SUBTEST: bind-vram-%s
> + * Description: Validate prefetch-smem of size arg[1] by rebinding them with prefetch-vram to
> + * 		check the behaviour, ideal behaviour is to migrate ranges
> + * Test category: functionality test
> + *
> + * SUBTEST: bind-smem-%s
> + * Description: Validate prefetch-smem of size arg[1] by rebinding them with prefetch-vram
> + * 		check the behaviour, ideal behaviour is to migrate ranges
> + * Test category: functionality test
> + *
> + * SUBTEST: multi-range-bind-vram-%s
> + * Description: Validate multiple ranges of size arg[1] by binding them with multiple ranges at vram
> + * Test category: functionality test
> + *
> + * SUBTEST: multi-range-bind-smem-%s
> + * Description: Validate multiple ranges of size arg[1] by binding them with multiple ranges at smem
> + * Test category: functionality test
> + *
>   * arg[1]:
>   *
>   * @SZ_4K: SZ_4K
> @@ -492,7 +510,7 @@ static void test_basic(int fd, struct drm_xe_engine_class_instance *eci,
>   */
>  #define MAX_BATCH_DWORDS 16
>  static void prefetch(int fd, struct drm_xe_engine_class_instance *eci,
> -		     size_t bo_size, unsigned int flags, int num_dwords)
> +		     size_t bo_size, unsigned int flags, int num_dwords, bool bind)

You have flags field but added a bool for bind? Confusing.

Again I think you should build prefetch tests within existing tests (the test_exec function).

Matt

>  {
>  	struct batch_data *data;
>  	uint64_t target_addr;
> @@ -542,6 +560,13 @@ static void prefetch(int fd, struct drm_xe_engine_class_instance *eci,
>  	sync[0].addr = to_user_pointer(exec_ufence);
>  	xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRAM ? 1 : 0);
>  	xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +	if (bind) {
> +		exec_ufence[0] = 0;
> +		sync[0].addr = to_user_pointer(exec_ufence);
> +		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRAM ? 0 : 1);
> +		xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +		exec_ufence[0] = 0;
> +	}
>  	exec.exec_queue_id = exec_queues;
>  
>  	for (int i = 0; i < num_dwords; i++) {
> @@ -2045,16 +2070,28 @@ igt_main
>  
>  	for (m = mode; m->name; m++) {
>                  igt_subtest_f("prefetch-smem-%s", m->name)
> -                        prefetch(fd, &engine->instance, m->size, 0, 1);
> +                        prefetch(fd, &engine->instance, m->size, 0, 1, 0);
>  
>                  igt_subtest_f("prefetch-vram-%s", m->name)
> -                        prefetch(fd, &engine->instance, m->size, VRAM, 1);
> +                        prefetch(fd, &engine->instance, m->size, VRAM, 1, 0);
>  
>                  igt_subtest_f("multi-range-smem-%s", m->name)
> -                        prefetch(fd, &engine->instance, m->size, 0, 10);
> +                        prefetch(fd, &engine->instance, m->size, 0, 10, 0);
>  
>                  igt_subtest_f("multi-range-vram-%s", m->name)
> -                        prefetch(fd, &engine->instance, m->size, VRAM, 10);
> +                        prefetch(fd, &engine->instance, m->size, VRAM, 10, 0);
> +
> +		igt_subtest_f("bind-vram-%s", m->name)
> +			prefetch(fd, &engine->instance, m->size, 0, 1, 1);
> +
> +		igt_subtest_f("bind-smem-%s", m->name)
> +			prefetch(fd, &engine->instance, m->size, VRAM, 1, 1);
> +
> +		igt_subtest_f("multi-range-bind-vram-%s", m->name)
> +			prefetch(fd, &engine->instance, m->size, 0, 10, 1);
> +
> +		igt_subtest_f("multi-range-bind-smem-%s", m->name)
> +			prefetch(fd, &engine->instance, m->size, VRAM, 10, 1);
>          }
>  
>  	igt_fixture {
> -- 
> 2.34.1
> 
