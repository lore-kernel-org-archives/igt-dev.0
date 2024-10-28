Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C33D5B158
	for <igt-dev@archiver.kernel.org>; Mon, 28 Oct 2024 21:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1870C10E583;
	Mon, 28 Oct 2024 21:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2YX8rB5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902FA10E583
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Oct 2024 21:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730152143; x=1761688143;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lUDLo5teJzIWdJCo3bXlVixvD8t38RMIc/Ii6SFoMtM=;
 b=M2YX8rB5w0Jmim0k8G1ui5wiDg/bhZd05LZzJUabQbMVCLpy1eJvSAU8
 HGaSx72R8rCPkja71rrRwtig4i7wOg/pgN0DJPCJsWPKmsA1iHvtBYywg
 mHpBJ8dzPeymvxt0sN7CZFS7WwWovbDJ29P6qudUbBRYM8w5bXPL42UDy
 nrx4TBYMqj3g7yUZYyk/h0Dx7lt4tZ2zq40qRUcPHwN4YbJq2BOZgRFIc
 8bjXp3Pj4zvS0LR1s90weCgEbG/MJFvWSlQFgX0N7VgbQV5ZMtdIBgU4p
 y76jTfWApbFzhZMkIbKGoBoXRJZSUwY5SrpkRYB/kf76TKYZT9WGEhoKQ Q==;
X-CSE-ConnectionGUID: lWoiBF+1Qz2UfLg3Bxglew==
X-CSE-MsgGUID: lmH59SlVTTGPbyE1OpC0pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="33562917"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="33562917"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 14:49:03 -0700
X-CSE-ConnectionGUID: hdBO/JUqRlSiRZr4I7R1YQ==
X-CSE-MsgGUID: Ek5TZPHiQPiXw0EWxTANLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="85700851"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 14:49:02 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 14:49:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 14:49:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 14:49:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZG3t+PO9x9TWRMDAQYyJYUGRkChgT+RosCxPRXwA/At0co9+2pAMPuZdqD1NPZOo4jI+q88PfxJtMgLr1cVGIoI6gaQ72NBMh2ZATKqkjJndjD+tLJ7vtJBQ/dnhShZdEs/vRNv3XAfZsoSWlfSSEZJR3kqsbWT9EhtNoW/32F4zvhtJdTvXXAuIrMrjcUL2AdhU0xzr5SGp/H1+JFfTVnKr5LkqZD+ms8xUuPYEgVmR11oSsCorcwnPDlEjjpbPdXQ8Il4h5ZRSeAjm4hvi4GHz8H64imP3Qr8sw19rSKEAKQRJCV0qpU6b/7tvxlgqQ49LtZpH36CPPcnvoVJrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/k7BQ/IX0hrlzpFfuerPMnI5qsw9l/iZEW9fkqZw18E=;
 b=mW3BKJHPe+sJoxoNpfVObQBNjhTdzEEdoUQifdFsIAwELD30xfHT+4/vUUmMJz/C16/5tCDrdOoZm9uJSoebRJ91pzoJoS94Pnht+T9lIp9/jzNF7nkKJDp0Z84lZwZE4RFMQ3f5FQqofuXzy2Uf+vuyh9e76c/6aieZSLyTL04pdUvnptEjcEN2bic9R4KdcPbX4r4V1ubxpx1WAnz77oICSnecd8YtsM2WZ8wfLzvi4m9GENoaBVmAKkkijxua9ei9OSUe/ewO+7e6rmR6YRYr2GFuyQymxVSM4kXQ3bizgE6Eg8U+lc77XiA4eTGsSOJ8PsBe+eMFyhRKTgPUaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB6543.namprd11.prod.outlook.com (2603:10b6:8:d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 21:48:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 21:48:57 +0000
Date: Mon, 28 Oct 2024 14:48:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <janga.rahul.kumar@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_reset: Add mocs reset test
Message-ID: <20241028214842.GW4891@mdroper-desk1.amr.corp.intel.com>
References: <20241028104748.3507388-1-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241028104748.3507388-1-janga.rahul.kumar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0208.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b4ed8ff-6805-40f9-b006-08dcf79a532d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yqjv7zfpkAo3vHszj8tAtrq5/ORc8UA00/a14tp0emNUC05AG/pwPz/0UW7c?=
 =?us-ascii?Q?GqYJZn0IwBPw5TRid0fKX8OX+BlwNrqu727k6s76zr8yZ5nxPxS0UAM8fqvI?=
 =?us-ascii?Q?g1aTRiaObpRA+7EzP57hr1E9AIAbL1wkzNFCV7hZ2phMyDpp3zJcwL37VV6t?=
 =?us-ascii?Q?L3zoaYdqPR+MBDuveZujcgjD36XVnsKej0TlvDMwJlUOTsPMYc/YMOJDKDcc?=
 =?us-ascii?Q?rCwShmqCTytxJAYpOKI/oK7o8cb+ST6YpZfjaUpln0jxW7UNfG4p1d/AFbgn?=
 =?us-ascii?Q?jdUASir4z432pkdEDCBc73Ie+OFGwAVTsbtfOJv9ran8Xakece82XdairBqI?=
 =?us-ascii?Q?idAby0H1/5tZ5Y539qwCXVWOkV1R0qx1f7IkHw1yJbqdEySrIqy/OmUn/Yyy?=
 =?us-ascii?Q?eWFnuT5Y6cOcE0GNcfh9/TurO2PrLvbIwDy4o1rqKz1HOeqgInfjaMe6tW6q?=
 =?us-ascii?Q?ezFe8+b6BHNcv9t7RzX2WUXpfv+G325QDtuUv3TQUxmcsYZViafiB9T6dUxm?=
 =?us-ascii?Q?LRa1Tu56I5V2gqjyc0gAiTD8AFlwzOcyxyQH3no8/zh0PvNGHXDWTqgNK6ot?=
 =?us-ascii?Q?1Vo7tuUC80bLtAPVxOixjZahmsCGJ/9UDLfDxA6OmTV+LZFsttMKLXCOElS8?=
 =?us-ascii?Q?5paP4yHZm/dvtQPQWq+0Uru1XQnmnoRCvRFu1dIAMFeik/kVtXYn/QJPFQJz?=
 =?us-ascii?Q?eXNnfWT3ebEAY4U4yBs+cFfTYXjjaj8UbIYsy3xpBxexNRJh1xX64gJkDBdj?=
 =?us-ascii?Q?L0Nfe6c14Ulreq2opGGq7+LCFmCkMKgW4vxlJgsOSkPNr3BNCmWvC+w2n0DA?=
 =?us-ascii?Q?NRZhggbE2isPJ9FQKQqU3tBE5gT8EAor66pmQnl7GKls87MjUUkXhQdWLGft?=
 =?us-ascii?Q?IagyXkfeFYZbZD0nfqc4expBEmQyu5huRamOFz3MMN8EKLFFy+M6SGG/vMtF?=
 =?us-ascii?Q?pd3THPVDEb9CddLtZlpPmlUAodlGpzXWbu7iQwCukzHeTdYiT1/OXCRNmN3h?=
 =?us-ascii?Q?yDuEnhbq0jowvKCebq1gMOCbw6drniOXiZrl6PuhyMHGvXKMm0QGhoX85MFD?=
 =?us-ascii?Q?D7ZqA+1l6xyaLh0NsuCzGybADl1zzZYOedgoUqvHv7xWrYmtNijKf+GELwLH?=
 =?us-ascii?Q?yjD2F/kjtdGw/TFhVjEaSiQZw4Y/9wiS5SleEjN2p57Y7IoyhO5j0QOYVZ0S?=
 =?us-ascii?Q?p1lwLGglnlCqOnRgq0fRjLNK6pafGtI7bABR81TE3xIFryzbpOrsGAEOj/ym?=
 =?us-ascii?Q?PPTbzWSfPI4Ubz8hd2606OBQaLPK0yub7LBOTcpI4WEiKo+SOrizKMhhblUm?=
 =?us-ascii?Q?f3sLEsl73a38RzzvsMkHI8a9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oE639NZhgp1O3H4E61z7n/30RkUzt3sS8fkqDNDobPvkpKJh5RRvhAzpD2bs?=
 =?us-ascii?Q?S7dTe0QA8MboBrZmk/F8lDXyK0qMePUubTJnTumCWwc5EiaUI7aj+VmuhvbP?=
 =?us-ascii?Q?LmuxPeqvtxlT/E/pbUjyGWSC6h/XWbe7U9EmP2oxehb4soybZDKuLDBVGpm5?=
 =?us-ascii?Q?tU47Aw5FvImNJoAfmP8Rs7b1Jz7jq0sQxJbuHYCpQ+eCIOuCXZXC65P1NvV7?=
 =?us-ascii?Q?Ofcyr13Pa5Kic61sWu6mZftXq4QkxQs8/XCK1KybUAcRG8Rk8A/kJS17GMp/?=
 =?us-ascii?Q?KFvDxpSP4YJS3fudWFKfnkLAlLp1T1EYW7qLTgJJtxNOnE0hke9vV8rU9B66?=
 =?us-ascii?Q?nNRGK9I9v8GiZH4ryKNQcvtit28oBNqfpGKRnvNB0Dbz7/EhYlRWtXaCoq31?=
 =?us-ascii?Q?NaMe9dI6KHB1MRWGRO9wvcLMCzZ8gHk8UTgExwDeS7Cj/eIRo0qNe02zZjfe?=
 =?us-ascii?Q?aJUvWrDjo5CDQPF4h+GmQ/TrA+Zer/fmcygrV1QvPFaRG9hzUPM/PqTUWbRg?=
 =?us-ascii?Q?ZpEbmT5g8Urf+7q+4sXrmOFIHHvUH15o637fZOG5PWCZK9Q/XDDukjiVmMjO?=
 =?us-ascii?Q?8euPimkZ/lAfKq/bPFOgaqjxs/wkiVYmJx89PLF/KJwvCwPAmfYDHUV0d47E?=
 =?us-ascii?Q?HRKYNBLQ9gV1JTM2rczM2+TJqVi3CHt9AXYl4gg7e/XPgZt9Cy2T0GPRk/e+?=
 =?us-ascii?Q?7hO/u3rfbsUIkoLWZ0y50dRDnYTO3LvglSncvhrxMBQjBGNyb6kV5vGWQW5c?=
 =?us-ascii?Q?ct2K+15FmRKzv314XrVQq0t7IItoLVB3/n7o+gCKToGKCvQ8M67YjjTawOSe?=
 =?us-ascii?Q?2K6gNKXmw42z+MXzU8QZyaxplrN2bIMcQkfviErC/CZsUFm95U8y1qdbOWXY?=
 =?us-ascii?Q?xV1/wRcC3vhNzelSmSLZJXcLvRFw4H0JqMzP2XA/IATjdr1Upi+qFRbjxuD8?=
 =?us-ascii?Q?m4odnbjbJhGIJf4jUSDjCV6U/uloUdwSxQ/wc+s7Ns83AsudTD/GfmvKoyxz?=
 =?us-ascii?Q?Fsp8KRPdGYZSSvxJWkS0u8RFkSrZRKKyM9ZQ8Ii4oHzy2LcuB+6ncmI62FaN?=
 =?us-ascii?Q?BeXTZ1ZRIpjI144lh1MJqDgYDzHEaIbMo5yY9SjGRau5D3mz50f6wuNw3Qtd?=
 =?us-ascii?Q?+ndoDoHSCXUE8xq5WSsn9+kSzy5ghnPuYXZcoSRu6FCFhpjfwSL205U5H62d?=
 =?us-ascii?Q?rwFHdt7kGIAxi8Xoxl2n9Ut4S+P5wB2+jZ4VoB+mkWacNMRfhi4vIpWVtxWh?=
 =?us-ascii?Q?tBw4XlIuKgLGqhayrVo85+kBwK3VLWzbGacdCKheC3G1cfDZL2PeIq4bF8J7?=
 =?us-ascii?Q?Y5I6xRkIv/qoXcbowaJg6YPKpTB9NRkFjA3yNrHExH52fjuyWfenDFLDjq3d?=
 =?us-ascii?Q?KLbkkByDLg4VgbM06HYdzX5kfXTMX+xM1pItqYynyy+/2DdqiXmtQ7ocJbdn?=
 =?us-ascii?Q?LPq1lLF0bOBgVPuX362jflK1lBg6aePXgG33aCOhH0jc7fR+5TdkubWeb3R/?=
 =?us-ascii?Q?3E7V+cfM/u1gQl+jdorOKEYZd6+7IoiskDXvLp0ai0DyQJPeIVBc47HuJvMu?=
 =?us-ascii?Q?GMJwWbT3gX1s7g5Z5E3iBqM2v9azRKZUpDAHygb3rdkwXcjJECVG88h+MYL6?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4ed8ff-6805-40f9-b006-08dcf79a532d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:48:57.4019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0T21G5fD9uz+DmUQae77ZZpw/KQ7gAE+cEB6Nw2sY6w5++2M/JKb/H9sD1M6ybAIJc1qebO7A+7rnMc8x1jr/lQPVuJzWbc9v0zz+MU5Kk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6543
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

On Mon, Oct 28, 2024 at 04:17:48PM +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Check mocs configuration over GT reset.
> 
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/intel/xe_exec_reset.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 43ef1e334..f4129dbd7 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -715,6 +715,37 @@ gt_reset(int fd, int n_threads, int n_sec)
>  	free(threads);
>  }
>  
> +/**
> + * SUBTEST: gt-mocs-reset
> + * Description: Validate mocs register contents over GT reset
> + * Test category: mocs
> + * Functionality: mocs
> + *
> + */
> +static void
> +gt_mocs_reset(int fd, int gt)
> +{
> +	char path[256];
> +
> +	// Mocs debugfs contents before and after suspend-resume
> +	char mocs_content_pre[4096], mocs_contents_post[4096];

These are pretty big to be allocating on the stack.  But I'm also not
sure if they're large enough to hold the complete data on all platforms?
I didn't calculate exactly, but for Xe_LP platforms we have 64 MOCS
entries and the debugfs has data for both the global mocs table and the
lncf mocs table.  So about 128 lines of data; the LNCF lines are 40-ish
characters and the GLOBMOCS lines are 80-ish characters.  That's already
over 7500 bytes of output, without accounting for a few extra
miscellaneous lines of output.


> +
> +	sprintf(path, "gt%d/mocs", gt);
> +	igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
> +	igt_debugfs_dump(fd, path);
> +	igt_debugfs_read(fd, path, mocs_content_pre);
> +
> +	xe_force_gt_reset_sync(fd, gt);
> +	usleep(250000); /* 250 ms */

Why do we need this usleep()?  Isn't the point of using the _sync form
of the reset that we expect the reset to be complete at this point
without further waiting?

In general relying on magic sleeps like this in IGT tests causes us a
lot of headaches down the road.  A delay might look long enough in
normal usage, but once we start running tests in certain kinds of debug,
highly-instrumented environments it sometimes slows things down enough
that we find whatever number we picked isn't always long enough.  We
should always try to wait for true completion of an action rather "this
is hopefully long enough" delays.


Matt

> +
> +	igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
> +	igt_debugfs_dump(fd, path);
> +	igt_debugfs_read(fd, path, mocs_contents_post);
> +
> +	igt_assert(strcmp(mocs_content_pre, mocs_contents_post) == 0);
> +
> +}
> +
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
> @@ -820,6 +851,10 @@ igt_main
>  	igt_subtest("gt-reset-stress")
>  		gt_reset(fd, 4, 1);
>  
> +	igt_subtest("gt-mocs-reset")
> +		xe_for_each_gt(fd, gt)
> +			gt_mocs_reset(fd, gt);
> +
>  	igt_fixture
>  		drm_close_driver(fd);
>  }
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
