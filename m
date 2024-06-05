Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC78AC25B76
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 18:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E86F10E305;
	Wed,  5 Jun 2024 18:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDsgOqf/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC5810E305
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 18:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717611678; x=1749147678;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jFzoK5uKO4LLA4JlgG9Bz2SrZYGfl7d12B5a5qbwdmU=;
 b=aDsgOqf/3RES+zEFwPmwUJqoWGpIzTxCzfohk5VvPcZlTNrFjal/Gqag
 gGvekvi0JYEh4ujrJne6Ho49MmWbO2K6oLx1rKmnerCspBrCv+M9XyjNo
 m2dws4aShLsAiX84PG4Boi36LuyOB7hI7yK1Qtgk6Vw16+sSKfUCCYWxM
 bezu8hwIjzWoFDrvoH7dXF/ALvfFEhd8u/BQZu4MZp6D9vVLqjLk3+JLI
 8IB870xXKmmkijqZAo+6+fIXbO2IFeVvbHLh7CtJfiI4kNoMPRXmDQpV+
 s4T6LlBSUyu4t7A+JjUN9ijeBUVGz4TxNmjwUoDXWjpGWCO/rNCwCbp1t A==;
X-CSE-ConnectionGUID: 3rE8sRycRNuoSvxYW3rbsA==
X-CSE-MsgGUID: eZYivf5RRT+etIcczxNthg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="39645984"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="39645984"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 11:21:17 -0700
X-CSE-ConnectionGUID: qvH0/0+4QYSfrMaJNABAKg==
X-CSE-MsgGUID: zxdwEI8WTf6lIoCL9QEBUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="42134242"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 11:21:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 11:21:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 11:21:17 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 11:21:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTB3hk/kkQmHG/kkZieIBvHmrHA6ZQyRNAC1dtK7qzyXtNSq1sHa8Jx3oc2/Qxm6f9/CymC6FUtIL8BF09CS2RXpujNdiKiOw/2BMO9yJ1LXD7XBWOjgX9k+JvaeSc2K7yF0qEvb6VXb9g2rkcno/fKGnM0Yr6CnkjVTA+/ncvx1KLDOwi+AEJ0OSZcLplxJjp7nnSAhHc/oSPvF/089cWY/52WRMgexmV2v46T+38oZnKR7ZFcxFOHCmgR2mmK6snkc+HBxl6opVqbLJRpcvHXyynfvHCnpRMQV378nF7zW/HpW4ElJ9cS8KzJlT2KTbv31oswDgkMwumx2rf4imQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JODEcPpb1d+29zr/G3aUN2+N0SKgXayPVJXFgOEpkC0=;
 b=hcL0ffttJSaalIAC0cCLjsZGwC8w+M0z6vm6wHFRD4DhQcfk2CQlyvJNk9lvtfkBufYVeDH5slZ8u6k6U6QSRC1+nyvv3T9j1Or0yugmwQ2jJ75l1MMmZF7IS+ibLIOlc9yq1r0m+N/83e1DVOl9kcYxdCQdoiEdYhIGvHQK5fsHu4naYT+YppjXiXSKVQfgXNnQxTex8G86hCFlTm2BrKIgZzy2C26NbgI8fccqInh7ohNa0zbRO6l588UZeSAD/XE++LtRcw4Wn2V5Sg5GV/B1ehmk/rkKfuBCb5NTO1z47CuY2VH4t61ZKP/4AexCnKWXlOOwONnhFjmhsP0d/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB6370.namprd11.prod.outlook.com (2603:10b6:208:3ae::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Wed, 5 Jun
 2024 18:21:13 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7633.018; Wed, 5 Jun 2024
 18:21:12 +0000
Date: Wed, 5 Jun 2024 18:20:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <john.c.harrison@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH i-g-t v4 2/2] test/intel/xe_exec_reset: Synchronize
 cm-gt-reset gt resets
Message-ID: <ZmCsZK8ccLbqcUvO@DUT025-TGLU.fm.intel.com>
References: <20240605175843.2789838-1-jonathan.cavitt@intel.com>
 <20240605175843.2789838-3-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240605175843.2789838-3-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ2PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a03:505::11) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB6370:EE_
X-MS-Office365-Filtering-Correlation-Id: d7475d76-b568-4ede-407f-08dc858c4790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iHHZwIIcRrFSsXaga0JA0lsvnNnxa82NWfO4ZtxdxJmx8e8tzGmrYwi90rLU?=
 =?us-ascii?Q?MND4aiFPFJPxEdV79wd7x0pRn9a3Bk6L+fTky+tUXU5wRcMw/GtM4WMKGBqr?=
 =?us-ascii?Q?pHKds8jVQ2mhERQ0ZFYK8Uy220iL7+jsdG5S/ko0uXXH2IuOd648nL2Y8ltM?=
 =?us-ascii?Q?AUVehQ5VsbeQ8W1PgMc3akq8K3QIvhSkyg5sO1hL5ZpkXPQt2zUbMQrLGcA1?=
 =?us-ascii?Q?U+PLR3NTg4cwwkJ92bYV2CeOuqfF6n03XD6kKc6wNv7x5Pd2zA+KuZL7Ayzo?=
 =?us-ascii?Q?5+ZsbqcBpp+95TqI0AhpOnmZvPW5IYU7jIiqgOo3LkbyYuGVBgyKxUUhWUNN?=
 =?us-ascii?Q?dtCrSMTkul4ZeisBqR0IJEWycoV5L80/d7aCdnxL5I1IH9xdQFBz2vNYoFNq?=
 =?us-ascii?Q?nETfkUMvSyLy/z/x4RbPJaX/P7Mo9JyFx5JQAzTMHyeUolc3TPjNdAai6x9N?=
 =?us-ascii?Q?U8jNpykWKpEcrZAbvR3+VL9jkVDtp72rYt4PwAWufoj4/OxLyYGbfvLmy2gw?=
 =?us-ascii?Q?IVl+q1kAwU2X8ArE0AwTzIcae6SXNS/WePgklgSf6L93o38LFQFwx6c2F5Yg?=
 =?us-ascii?Q?qWrZmy7sou66qJkjg5W0Jo7NpZqR8qOqmKo3Mpbkm7sXnvngVRrt2OFWTPzd?=
 =?us-ascii?Q?zVNZRvme0i1Cms/3q9K1NSLfRtWD0nSYZLOPZ9omOSd6AFQYSnaf/zgtjSWF?=
 =?us-ascii?Q?hse0RSkT1/yBwEbk2KFU5BIxjsDrmPIT17FYJLvREZitJTID2QbDDfibli3J?=
 =?us-ascii?Q?1v4qd/2WOGYGJ+2JmWiPOGDmWpMHS6aLJnLP9W1fzTCJ20etlOD+8vJ1xG3V?=
 =?us-ascii?Q?H68jNhVTZx0Xzh9R18O7DqlV3L01RxpCGvpsHr7N8wPdnHNazGvr3r6RXJg/?=
 =?us-ascii?Q?Jt1HpUzRsBVboJbwsfyhThwwTZdCrNRctaaGlml4EVyNlE3T5CxODY/eEYja?=
 =?us-ascii?Q?7B/nnauahoL1gd/Qu4Yh+A65F2t3l9O2UEKTffi9UFuwWCteDIRMlq8k/JXE?=
 =?us-ascii?Q?PiTK3b4Fo/TXhUSMc0QvG6Co8qyExuXEaBhkqwjIhnQdN4ei7fOGBl4fevPt?=
 =?us-ascii?Q?6NF5nLPb58NRa5ephP6QNMaQl13gB7SKnOcjxsSh7PpnS/XcIZfochSJkz6F?=
 =?us-ascii?Q?jqjWr2CQtCvX/zeiURbmjO0qbDZDt4unVDy0osam3qJt/wXVQH5cRquCyuRr?=
 =?us-ascii?Q?TbFllpVxzOg53VtcO0+wvr4zGrBF4t4qoQKJiGhLF8eERUUq4SKofSQ0ZpWS?=
 =?us-ascii?Q?+t/uTpERXwo/RiKDjj2rn+qFtscqKxGKlasMKTGU6g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KLdUsHeI5Q8uALm8GKlldI1OHGwPCClcvnjISCgirVTbeCG1nGqTxaPSU5ex?=
 =?us-ascii?Q?o75ICR0yMKk6U4Kro8cYww0nhOWYtTx4ecQJ2TeU0fOMAu7iY+XZ/GLtq1rB?=
 =?us-ascii?Q?jbbwtfAislibzGNx8RCWMUKOkm8p7OSP4pHyWaGPNK769DwFd81qI7f3VpdC?=
 =?us-ascii?Q?jZi+05n+WXkeyo5wZezZSUgAeLDcMl1VcILePzspwkIrGRoNwZfooC+o5+hf?=
 =?us-ascii?Q?v474YXjlXvr4kqmU9m/oRTNiqt9n7Vsu6sXokCnyiYpcWOU3Msfw+68bbR7Y?=
 =?us-ascii?Q?V3x/pJ76ejuC0TLzdKy8htAe0BsBjVwdtdoPSmqNpAL4ckeVf+lPj7NI+5Cv?=
 =?us-ascii?Q?Z9zuxchc06EqmPamgp65aE75KX7ANtdrzxDhiPnqblE7IKBKC18Z3nHNAzi6?=
 =?us-ascii?Q?grWhuGtzka9mRFQgfHdjL8PXDXRqXRFpVxMB6IRamvPoBv2wVKZPT0yY0WW9?=
 =?us-ascii?Q?RA0sS0Jev6OfSQg/PQNpCKiO4YxzpdZvhwUgTdfNqijMrSu6ubn28HT9svGK?=
 =?us-ascii?Q?KAMs2fsBbJrm6g/qiIfqZ6gJZ5N+lnxD/b0gQN+E98vzC3wzh+xFEJZPmwNY?=
 =?us-ascii?Q?Zo1l1TIqPaj9Y1z9mu6v0Ds5y9CBeAVy7z7T4xqGahgbnvDPyYHuURfRqHjK?=
 =?us-ascii?Q?5hzdmUtuk+Vx37tVixrsDE77zkZgtYj/mSzCxjj1m9bsu7ooM3L6GMLHMgUD?=
 =?us-ascii?Q?K6Zm9G24S1b2oS2S1jdI9HIVF0ZNZTaWxWjCnx2yPGGSzqtHVx2huBqOzGmS?=
 =?us-ascii?Q?up8prMvD41lgYH+bK1QW+2Qaq7xBGkEerzmWKKnPrWuebU68wgFQUtUD2/mX?=
 =?us-ascii?Q?/d7Pd+sSId8D86FNacjtqs+Qc6HgWaiWglMkLWYIUblUPfeG9ZlSB1b9C+pF?=
 =?us-ascii?Q?q/gdsLelw27A02JXx0hqmS3JiwKCy0X17L+PxyADYi1dATBz0Q0bTdUToKUW?=
 =?us-ascii?Q?pyHfL8Ak+zROxof7ccY0GZF2+EMFPtfz4dNHHYgd016z/9omdPLrzQgIuiTq?=
 =?us-ascii?Q?cjyEQMv4NW+kYQJkL/2NWKLzWHunctjAtcWNahEr3bVrlEbKAASekVyoH7gC?=
 =?us-ascii?Q?Gr4LxAyEhNy5nDeSg5g4yZhIiFExN7pqFAsc94ME9sTMwgLlbrQn+/f59TFD?=
 =?us-ascii?Q?boqpaWb2RZw2CUSIC7RvwHkReaJIoCzoFGM5bf9v5v2fYN5THkmneq7XOdAK?=
 =?us-ascii?Q?OTgpircrdxxB+mN9kf0A3n57Ufx9uTknRTWzxFOTo/hI3nFZ90xw600bF1xg?=
 =?us-ascii?Q?RVNqlDjH9b/7gi7cJdhXdgDSrm/RLC5Di/TgRMVuhGC04z/MGfbMAWOLy4Hw?=
 =?us-ascii?Q?D2zN6YE1qtu/qd+dN//QZ6cd5QpeCzpM8gujwbq4fB00THPEjiRhIpwIlgsd?=
 =?us-ascii?Q?5CM21ZXzpmBqyTf4jG1f+y3BBI8obcHH/gINgiAa+T1zPgaq9CyibjVcMNsx?=
 =?us-ascii?Q?FOI4Ubj8SU+5Z3qqXwK9KjRJ/w4AVgphTpDoMtu9kZCVfMeMpq1G86GA+d56?=
 =?us-ascii?Q?IKlSP8TWOYqky2+INFAjvtDcdLzmPp65EsylvpvISxSbdtdRXDVir3JzV2eX?=
 =?us-ascii?Q?GVSsJr7GBywlfsuu+CZXJAGWiLoMacF04gr5W4BAiwt6H6YkizO4XdtDRi5a?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7475d76-b568-4ede-407f-08dc858c4790
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 18:21:12.3176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Wf0t2W8WOL0wv4Aku1IQty67Om7RkJ0muoRn6NsZO+5zCioAEv4F1mq/UCn8sMHbCdwvzxOnSd9XhwX49fPrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6370
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

On Wed, Jun 05, 2024 at 10:58:43AM -0700, Jonathan Cavitt wrote:
> The cm-gt-reset test has the potential to race with itself on the gt
> reset, so force the gt reset to be synchronous here.  The race condition
> occurs because the test does not have a fencing mechanism (I.E.
> dma-fence) to protect against this race, unlike in the gt-reset test
> case, for example.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: John Harrison <john.c.harrison@intel.com>
> CC: Stuart Summers <stuart.summers@intel.com>
> ---
>  tests/intel/xe_exec_reset.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 05d63c0ba5..817b82cdef 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -530,7 +530,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	}
>  
>  	if (flags & GT_RESET)
> -		xe_force_gt_reset_async(fd, eci->gt_id);
> +		xe_force_gt_reset_sync(fd, eci->gt_id);
>  
>  	if (flags & CLOSE_FD) {
>  		if (flags & CLOSE_EXEC_QUEUES) {
> -- 
> 2.25.1
> 
