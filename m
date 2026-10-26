Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAAD606A338
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 19:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iG4F2gAv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7D810F100;
	Mon, 26 Oct 2026 19:45:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDD710F0F6
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 19:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793043850; x=1824579850;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8+JLu/Bob/6hihOkFDg8RJ/yD29RuSmvaoUC2jIyUvQ=;
 b=iG4F2gAvbd2fIz3msG9kn6FSn2p2cqaNPdCZMvHjTajWrIGote4zsi43
 pBsgsBTo5EQb3sEDxHJqADhoHiYN0qRzMoW0sBjRLcrGpAEumOL0L/V6K
 MlAdatNJj6syDsWNdrSxPJ38A04jjMA+jkzKaX1X/Nq016loI389Xd7Cn
 C3h0ziZrMQE02d+dlOBVRosJa8hFT21vUXq/eRg/7XCxgAFbuLRgLKp1o
 9/TJWJacXm8g+kdzfm+hoR/PUpZFd90AsEKS4UlDieNjU0y4fIPSNdd/N
 RjVPy59Kk6gOYU+YILQf7rwtC/zFfL8F4ui2iQfLjFSU6Xk+DizlP8JIE Q==;
X-CSE-ConnectionGUID: YtdTml+US5u2CKaOMxcZhw==
X-CSE-MsgGUID: wE9BJ+KETCW5IURcG+MYLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1761048"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1761048"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 12:44:09 -0700
X-CSE-ConnectionGUID: c80tRYVqRQy9DlSoa1B2Pg==
X-CSE-MsgGUID: m8mxgFZlT5eMuvVgBGrvpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4431818"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 12:44:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 12:44:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 12:44:08 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 12:44:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aX20Q2cKYusN9ZQc4JVtU5Y+Er4b2U7T/6hviYFCDZ9qbCWI9wCE2Zx0V1U8YR6Edjf7/lfELX3AkwSUI2cQ9ngrlGXFH2mmX7xCyxoh+hxMvmhttMfB9WnfSIBvhUOjtSMQN9gbj+vwaJeavwB7PCv8j75gTc3T3BviVM5MHn0zE+XbZ9bQZMWU7yF5vg1aPg5Y/GfJBSqjYKuJb2+pRW6AF9grWI18lBYVJld5DWvNQduWpWLdnabh0Hgf+CRMtWGPdTXjND87UMFWz/LcoyoZPyLIelNltjhVVG3Vi5M+0xa5M2JyF7Bun7vzFUcRs6DzrFqHi2YhUfb4xptKxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+7shIwQm57TUNLpqqksZk4YgymgHFqe0CsgNpcrKsM=;
 b=nezwMq/sfm/DJRS4zwwRNC8lRIvq0w6Id0ZS4MVYHAfyudDatfAPZ5FwCy2W1FA+bQ+fFHgkpRR/XwKvpwihAEqtLBjWAkxzspxY0y64PoHJ6M7++XK/vPXFdDnKxhfSDUzUJQ7RAP3X7WT06az7zCV7zenlsmPufojJ5/WxASqoE6rJdnEwmRfV9Hp68BkpG4otxziMO4ZQz+u0JO2Ub0BZbEpHNBH2C6WW6ETi9y3sYiIP1v4J2SCw3qTVmRPWXMPZELjVII1tSgj3lbwd2HAUP5ivPt766duqv9v3nK40Bell7cKeDWDsM1n4+5Sub7xC0SHs9NmJK+SzJxp56Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by CO1PR11MB5155.namprd11.prod.outlook.com (2603:10b6:303:91::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 19:44:06 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 19:44:06 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 2/2] runner/executor: Report command used for
 test exec
In-Reply-To: <20261026141702.44811-3-kamil.konieczny@linux.intel.com>
References: <20261026141702.44811-1-kamil.konieczny@linux.intel.com>
 <20261026141702.44811-3-kamil.konieczny@linux.intel.com>
Date: Mon, 26 Oct 2026 16:44:01 -0300
Message-ID: <87wlr49ri6.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ2P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::13) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|CO1PR11MB5155:EE_
X-MS-Office365-Filtering-Correlation-Id: 247347b5-faf4-4237-7e33-08df33997ec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|261026121527099003|4143699003|11063799006|56012099006|261026135527099003|261021123027099003|261021121427099003|261022115727099003|261022113327099003|261022075727099003|261021133027099003|261021135927099003|261021130227099003|261022105027099003|261009223027099003|10067099003|22082099003|18002099003|6133799003|261026140227099003|261026130827099003;
X-Microsoft-Antispam-Message-Info: Uwnfky+k1ZaEp+YP5mwoMZpjhbKYyWihNyp9ufpFhcudllhOaKvUZHjYFWQqW1CHEy2jq0V7J/ZsauGnxwQt9DcACHjzsB0xNXarnrU2Kf0hYjBqv6bdvrpuEGreQu+7ntXMBgfvrv9dY7dadaYrEYShTlbfVqIrnI93xq55xXB4hNF4Eo/BVEZOJdl7/1YKer2ngrk1QDTi4YcH94Z4q9/3Xa6EPzx7veLAojC8Pl9aVddmTUDB6Y7mvL5wKJwkNCdP4poeNigAIywS9ijczxzWoGQ8xmbQNTA6yNV+8TO587eYs9c2t1QAnCC/QPSezZ8NA2aCbPlLszH0SGEUQ3gWaKJDJkNE/kJZrmf5aLBrpR6Vrgsv6g0wBZVvxvT1lnHYr7Xp0FOsV+Ay0N4KB74Yp2Rk/eUGDdUX3KI8Pjenq+/A/7T4YLDdL4mLLNdNFTsNdVkMsApFoA1V7RqkBltV/qImLgWsZCt8YLD0SN2xywd29HhtjD/uutEUgNocUXjjKagdh25OHJrY1EaftYUZ/JuOvtc0fqYWQBCMCzDszNceJ6j1lMtfd1t3jINT2+13qv82eZlfS8dAfrMPutMy3GoXd5iob10cs4+EzMRlpUL4xyDoKu2CdqVZNTZCQYQakzCPbklMdCpkUVw2X1azOvMz4qzzgmpgEI/f8bs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261026121527099003)(4143699003)(11063799006)(56012099006)(261026135527099003)(261021123027099003)(261021121427099003)(261022115727099003)(261022113327099003)(261022075727099003)(261021133027099003)(261021135927099003)(261021130227099003)(261022105027099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(261026140227099003)(261026130827099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zCLtPe8Fadu6rPAgtwEm6i/ShbNcUXFBIV7RvwjPjnvMJR/SwA1XOh/ZqiVG?=
 =?us-ascii?Q?r+2TQ3NYK5d71M3LgkWMEUXY27Nyn2EASJL2VHZtoMUWmO+JBYGyKxqfOXC8?=
 =?us-ascii?Q?FAk6/i3Q0PRItqrrn2UMtdlpEgsi0xGgy1yM+gr7H5FXoNsRvI7UBAlxk2Jo?=
 =?us-ascii?Q?cw9gNtrGsgGi3c5aTKfoqURxNPTGZ5sGj4VemNlcwYC0cM1h3syUXfP4rGHk?=
 =?us-ascii?Q?fN07jnbDoixyagOduGTjyqX+yoDhUdU8LDSr3/AlfA74PfSsIFibqRfhbkje?=
 =?us-ascii?Q?IXJXMsJ2/T4m0o4cUU0U47yLWBKr+tLAflM+LEKCzm1eAGfZHPkZq3MyxPXj?=
 =?us-ascii?Q?DCt24a85BYDQAYhXRGpPQNyNPbLmvZWxauZbGJ8IP7DtmaBYVRzOy0BcAu6S?=
 =?us-ascii?Q?y8cccybtFN1QAznYQEBnl2T6MdxAKCEM1TASaATmMtwfwzO0frAeYvVxf1li?=
 =?us-ascii?Q?iGCXuhLR+7GzI+UluOPbWCf21VVmuqGCheoQKcT0JuKzOM310W9b1QfM9pjd?=
 =?us-ascii?Q?5kDAJLd8qAXWRpXTaQNR+DLlsHPaQK7yrzGeYTqiownSKiDhmf2dZbvJsXU1?=
 =?us-ascii?Q?41e6f6ttp5NE+oYlGD9bwQEI52zGrEPYDwaGF2+VD1VCS4EZ0NJmuXX9M9ov?=
 =?us-ascii?Q?6rw7Enn/YkzKmM8HI6dIydgqgsTc++v8TGsAywjG7trMHGb63XQvr92d4j/2?=
 =?us-ascii?Q?6UXSjJDg0s8sEygf/bfwZniDqLgUDbO3Wp60ij+4RkKh9xGUYQ44Y2mZ77x3?=
 =?us-ascii?Q?jV3qcmnHNWJLoYzsLzynP7o313GncuvvyQGI0pQk6qS9nJzHgTN+C/RCtIDb?=
 =?us-ascii?Q?3l/UaJkmdMOQz7aySfp6JeP2qYPghrTBixP6AnhhaoN5zG1iDPIo1cmVHzFw?=
 =?us-ascii?Q?Pob5LN0OMYHMfhpzkfgqNZEiRa+v9vsSmBYmG7J9l0mKJNo9kGCrk2y2R2ig?=
 =?us-ascii?Q?KmXRYJFQJtumCjURzS1ZFLcm+UUYTZwK3NutytKZKbnxkaKwHmJN1+PkP64j?=
 =?us-ascii?Q?c42SV++cnBfNjuZjT4AdTJ95LLkSkxhf6iIGekW3tk5Fg8vsMoZLu50UnRuL?=
 =?us-ascii?Q?ziBHF8+drAUQUsZBXwEZlc8UbGF/HjrMBBZoHyJhmxbAXz5jn/YkjYcG5q1x?=
 =?us-ascii?Q?Pvij72g7wegS/5+nkP4VN0azjR6cYlf6MazPc86RZ/snNFaNVb6g3uKuXSe8?=
 =?us-ascii?Q?JoHGbQuyFev0vGwdXLXWK6uu1vHFQcP/uGMoS6EG6qIKn3WJj/G8g/NcJn3K?=
 =?us-ascii?Q?/qafEwJninY6h0Wk9lTjxsm5go1N7HpevFAVnSEgbAJPYwZMnQgvokvvKo7N?=
 =?us-ascii?Q?rX37gbI+5t7Yt+HqglAXul3I3HrlSz9WooGcA3kEAMw7nj0BDEun81/GYRn6?=
 =?us-ascii?Q?8RrhU1jekXn22BTmH6ecxI3Qp9G1staX/6J88A9tcTDlaWw8g3hxKU0bDeOA?=
 =?us-ascii?Q?WuxAzLixeL6oB011UCkzWE8UAGCVrxSYg+tzzn3ZT63682aKvPNDHx9YIWuA?=
 =?us-ascii?Q?cODjXDSvG0OCehW508X/gzDqUZs495fyI2cM12478fr91xp/ZCzX47WXU5Ba?=
 =?us-ascii?Q?vEoZ6sR5sT8Sd88RKPbuG95vaJ3+PgerXnf17LnrYpTSGmqrUUSxtIn04ICG?=
 =?us-ascii?Q?FYJYIT1AIvxhFcQsL6Ex/gYkEHFCqWzcgGYZkZrdqhA8V/ajxYaxQAKD2bJI?=
 =?us-ascii?Q?kGl3/5G0Uyxq5xWm1ClmbUyl5q/Nz28+FYfgRLhiqztnejEi+6SRy82u+WJp?=
 =?us-ascii?Q?UB8rlwiEDQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: CHHAkONyVUQRcd5D+/ux0v57DnVsAXAutWgjMPu3kgq2Nvrn7zcW006OsYeHi7jw9Sm5ra9nT2o8BhoOYR4GcOu97QgU/swRIg85WG2POA/12sKEa3+homkd/lFkgZIyBB2V77J4Lpw2tWVVhJcCReOlYqBnUsRTRZVYSvSYk6UC9M/S9U3XUEI/aFfx+9ePHC1js17df5K5dPGxW/HrMiipj5o+oq5fjoLIsaNzCZ9NdXklrkJ9rqy3TZDS+oGShc4sFWTL8BrnVGxO12PND5wGo9Y53+cKpx2Vn2uEgaYW8vxP0/k9MXjoeXZIrwhUOYJAmzqqazhW1KtK5fm54Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 247347b5-faf4-4237-7e33-08df33997ec4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 19:44:06.2190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OsWQR13kad/8SVEK/oqnSAVt7rL3wPmP9mrpFL1MD8DGDlJnxMSJ9diZMU3AeRhqEdeSH+ZSMK0w+GolJdUKlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5155
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Kamil Konieczny <kamil.konieczny@linux.intel.com> writes:

> Add printing of command line used for executing a test, when
> the log level is normal or above.
>
> v2: move constructing exec command string to separate function
>     (Gustavo)
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  runner/executor.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
>
> diff --git a/runner/executor.c b/runner/executor.c
> index 5bd95b929..91ad05d58 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -1626,6 +1626,49 @@ static void free_test_command(struct igt_vec *arg_vec)
>  	igt_vec_fini(arg_vec);
>  }
>  
> +static char *entry_exec_cmd(struct igt_vec *arg_vec)
> +{
> +	char *m, *n;
> +	int mlen, s_len, vec_len;
> +
> +	mlen = 4096;
> +	m = malloc(mlen);
> +	if (!m)
> +		return NULL;
> +
> +	vec_len = igt_vec_length(arg_vec);
> +	s_len = 0;
> +	for (size_t i = 0; i < vec_len; i++) {
> +		int nlen;
> +
> +		n = *((char **)igt_vec_elem(arg_vec, i));
> +		if (!n)
> +			break;
> +
> +		nlen = strlen(n);
> +		if (s_len + nlen + 2 > mlen) {
> +			char *p;
> +
> +			mlen *= 2;
> +			p = realloc(m, mlen);
> +			if (!p)
> +				break;
> +
> +			m = p;
> +		}
> +
> +		if (i)
> +			m[s_len++] = ' ';
> +
> +		memcpy(m + s_len, n, nlen);
> +		s_len += nlen;
> +	}
> +
> +	m[s_len++] = 0;
> +
> +	return m;
> +}
> +
>  static void build_test_command(struct settings *settings,
>  			       struct job_list_entry *entry,
>  			       struct igt_vec *arg_vec)
> @@ -1849,7 +1892,7 @@ static int execute_next_entry(struct execute_state *state,
>  
>  	if (settings->log_level >= LOG_LEVEL_NORMAL) {
>  		char buf[100];
> -		char *displayname;
> +		char *displayname, *cmd;
>  		int width = digits(total);
>  		int len;
>  
> @@ -1864,6 +1907,11 @@ static int execute_next_entry(struct execute_state *state,
>  		free(displayname);
>  
>  		outf("%s\n", buf);
> +		cmd = entry_exec_cmd(&arg_vec);
> +		if (cmd) {
> +			outf("cmd: %s\n", cmd);
> +			free(cmd);
> +		}

The function entry_exec_cmd() and its usage look correct to me, but I
wonder if we could avoid the memory allocation with something like
below:

    outf("cmd:");

    for (size_t i = 0;
         i < igt_vec_length(&arg_vec) && *(char **)igt_vec_elem(&arg_vec, i);
         i++)
    	outf(" %s", *(char **)igt_vec_elem(&arg_vec, i));

    outf("\n");

--
Gustavo Sousa

>  	}
>  
>  	/*
> -- 
> 2.55.0
