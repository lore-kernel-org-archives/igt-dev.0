Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06B7C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 13:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A727D1123D0;
	Fri, 26 Apr 2024 13:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJEa+bq3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3170910F00B
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 13:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714138135; x=1745674135;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tAQAgwG+kgkyQkWRD+4GmlrWF6qT94d2yqXutQRXT1I=;
 b=XJEa+bq3zrEkjTF4Cf5hFYf8iLq6GVf6gFD1+Qm3eICM9T3xG9K7QTnd
 5t6RDbYFDygnUElRD4asDrd5tdbZ9Qzd/81iHPkA85mxFnLm1xsxDxlXC
 Nqo0bFXYPH/0F0xJfoh+P03OyqTSZ9jaPR1ebYRKWn/ReCmXO7o5mXJIp
 eT4XAzDH0oVmOQOBDeD1WaPc52DeYVzBAwm9LQYrfjBTpTNPB7AyR4DuR
 JDOiCpmPeZuwzwauqL78s8wbgh+WDF6Tl9V0RacE++cbLpMHNsIlQGRQm
 ui0KcRx9hdVvONjC2O7E5tZCZ4udX3NJVZnhLG5sAUbpaWcTZOIc8qvV2 w==;
X-CSE-ConnectionGUID: RqY6M0OTQ6qVS0yC/3WBtg==
X-CSE-MsgGUID: CJbCThPcRK+Mb9vg7LBwIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21019321"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="21019321"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 06:28:53 -0700
X-CSE-ConnectionGUID: eCRdoeNyRliSjn9GID+NKA==
X-CSE-MsgGUID: 1RDwE180TOGm/iZG3pK7+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25409877"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 06:28:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 06:28:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 06:28:52 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 06:28:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5lfFLRndM6K1NqKXsOQ23kKgDtQJg56sSfDIsB24cX8+0u6EenlLQYQfAiaQreK6R8u8Rae/tl/sDnBjzvJBNPVmkWiLaB48JoQpAsJsKlGrTqmXY/rRkWLSN0LBjU4hyRL6bb0skRVnEn12OgUr8tnS3CZgs+aEJNdPCPZ3MkkxpGlwUglu4v62Xhy6HUvLiyyHhjEmXyP1SpWcA/NcmAVHAemyq+n77AprilSv4zlX4OltFE4h2gnVIgJ68ZDuJrkSTOHm4XTw0rsN/BecONL37mT9WJU5jvoLRBY5mbUwrBnmOX/QVNdQAikeEcIXuI/TdYruPcHOBf2IMr8YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bA+Wu+PMBsQG9T0Sqdy2R6CkjWdoX44QQK6wb0YPn8=;
 b=Tw5SNiA9aS8YkuHuW2JS+oxZlxpILl6/uKd9UnPKgK84cSRhp1ate0SLvyE1T1njIzbJj358K7EwehMOX2pPolmTvYjxVNgRSN79q67HvdSVih5IZEGUe6uUaWprTx+Ay2my9ajDJAM90pZtQUXxqAycMCV4fg9xVDNbgUsC4YHRvf/10n3s0nxKI9Fnb8S8Ca2UsI8r+monxSWboozvnVen8PGFev/roOuT+Rw01cm/msQYXnG45umBid6sZEaFycb1jafrcMfIH2gjC3uuL3vaWnxyMjFaLXIGBcL3yOTuKozvfo8So47U6fTa2gknO5o6a5FE/zTIl090sVwphg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB7030.namprd11.prod.outlook.com (2603:10b6:303:22f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.31; Fri, 26 Apr
 2024 13:28:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.030; Fri, 26 Apr 2024
 13:28:43 +0000
Date: Fri, 26 Apr 2024 08:28:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <igt-dev@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t v2 15/21] lib/igt_drm_clients: Record total cycles
Message-ID: <jyp5ku4nxg4jdrdhacug37igywabpxetnbg3hawqyty2ymh7qa@mwvwmzry6o66>
References: <20240423234431.1959354-1-lucas.demarchi@intel.com>
 <20240423234431.1959354-16-lucas.demarchi@intel.com>
 <15803a05-9979-4481-b8c6-13c6fd58d10b@ursulin.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <15803a05-9979-4481-b8c6-13c6fd58d10b@ursulin.net>
X-ClientProxiedBy: BYAPR06CA0043.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB7030:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f1bcebd-8817-476a-9149-08dc65f4caef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Of2l+mw5eOjrVHRY9gXx6QPn20Bl781Bio3qvAe3kV5YiIad0UHJKiiqkP2L?=
 =?us-ascii?Q?cVLfqN7yOCnPEzGM0VKD2Cy56x7lkOMrxNoSCFEU391RGKw9BLC7zh+q+c7E?=
 =?us-ascii?Q?piMn4WSBf3G9OW7ZBwF0goy8QUeOOhQocZhoKiMy3hXYpAxz/TX4Hk7h2we9?=
 =?us-ascii?Q?d4kGs6gnCKskbYeJXNgZxLmTbqjJ/SLpYZAxJKhxlI6VFU3rMHJ6t0Nil2qZ?=
 =?us-ascii?Q?Dh7H0LULYiZ8UKrDM9vymkBC8TMEb+CnykcZru2m3+w+QXQQIhk4WGPGGewh?=
 =?us-ascii?Q?5Ctkt+RTH71CRNV/vRK9eCSfJ8W7/KBwGsXgC7HIiV7EmEd8dFvhv7yGBbg+?=
 =?us-ascii?Q?0EWXCW1yGAT8X+8mC4tfVLtB0+l2zbn1eeX/FsD07qKpqk71jJWqO3Uoz4/+?=
 =?us-ascii?Q?saGmnWSOOSccRvEZ7pezUDhD6TDLk05ybPgzhpugh6DGWUYT6STmynFkVR3I?=
 =?us-ascii?Q?IhToBKpQL1UgrFw4GB2u4OqBIWtMmnFZYh+uSyufNxE8fJopXc0dJgcs7+51?=
 =?us-ascii?Q?ADlonIgQttkJ5RDoco+B706FtcrFaKMcBowHu82aTcrJYteOfH/B4gCE3R0a?=
 =?us-ascii?Q?HLR/0KygzoLTY3th9ZPt16IwucP8tA+gOcoLGNPhEpV8m4EQqQgKGVRteSpI?=
 =?us-ascii?Q?4jEeQZ5YE8QAs0FmkbrPZIa4ODupsFDIXvYo9BFGtX8bFJqIGYpnDVfvwOGE?=
 =?us-ascii?Q?93EjYn5D6AhFVU+sz5a6MHG8qGpuEc3/pbgEC85ksMBSQZsHwNGsD/XoQEpt?=
 =?us-ascii?Q?ysFlXGDdwG7Wt4EH4e4kalfSQergfu2XVMEjgG8vdIu5qe97KIqY77Ubfgt7?=
 =?us-ascii?Q?OextqkjuVnzM1Ua74i/oloJK0zrfAAxE7HXrF3HRVfu9pruXVrbYig59iaga?=
 =?us-ascii?Q?UJUhl4u/ScRZkt13L9vhe8ARVzEnypsdA8oqgKBAxQD4xxTAfaYAKtI6QA8H?=
 =?us-ascii?Q?VELquAk6oGecJqNmKMWIrxqhptrtSikwxa9q1CP3pGClGJS/6b7PStICDCbf?=
 =?us-ascii?Q?/bAb3wDybN4P/OhUYiZfJncxalJAqyxCt/111Z5d/xRd/wADCeykw0VP4NbJ?=
 =?us-ascii?Q?ONBmFwkQTIt+15r7t9oVNlmPaicT9TK8lFGdNC+WufAJ+GzamKx5ROu2tLEi?=
 =?us-ascii?Q?P6Zmnp0bkDn6rOQ6A4+JZdvUJqh9PtKocZ9+ef2sEQx1suGZzBNI/Mz1cxxO?=
 =?us-ascii?Q?o4T6jeznjV6rsqT4fDzBJHMcM4Z477/P5pWKggD4cwPHM46lY4cSWn/SsYl6?=
 =?us-ascii?Q?TQTKdSEGv5OuDNrbfkHrde+FDDIbnmIj0wIshuhTKw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?37oXU/vn5EsW4FmZgJM/HrpBcXUNlqYK/t7sgedaIxKtdN5AZ3QVLTRDksxz?=
 =?us-ascii?Q?5up5URZJlGutRZRFEClba5NE6i4f8Rot5LgUxQEyHPLU9bF5tAAq+QbmTzpQ?=
 =?us-ascii?Q?zuQmymQtbQRFctvq2iQSwIKz6CwGt1txqpxl8cEve75aBbWifYx7EDphv6YI?=
 =?us-ascii?Q?IWhXEgpykFmic8lPfL5EKRwxulh//aAx3YBCSlNzJI+p6LP/T82PrU9iUer1?=
 =?us-ascii?Q?LnLQK/XUoKkkqQ+I6IxtJksjLdRkhRmtM7oq8+G8pFPkhDAtCCCjN746C3q9?=
 =?us-ascii?Q?oH/psmsGKpzZ98x5L0jXFSu2YMFg6A34kUULGOvZh1d1G+pjaa+oM4qosIWl?=
 =?us-ascii?Q?BzIcu5PJ8KIf7poRbPhN8KLlPFz+5wV3+Ch4i2UuuL0mPqHCcJPy4tXQ3T9u?=
 =?us-ascii?Q?Ih/rq1ZTr4ZMVRwoczYrLpVBwQro3zopmpyUP4CTVpSYn3lomTwqSumZekNO?=
 =?us-ascii?Q?+hZJek319Lj8dylO8q6QyzPE45czDcvDlh20H6P6CG0W7Ild8n8WQgOvrVoq?=
 =?us-ascii?Q?zPXHnOvdSeB+wPbCv0PnQsPTZvatqjmF4KfQQk2c7ooNMBTqb4UZfUyZMrqd?=
 =?us-ascii?Q?cQYHS0HpCx0MIXVWWLK3Ru+cYvvJoFFudfaVEzxJEY8T2zqPxYPFN4D7soQh?=
 =?us-ascii?Q?NLPnBP3YxEfUL2bGMuXd/GjWOLQQvj6i+N+m5ULh6wRxXXjGlo6Si3Ncsw9w?=
 =?us-ascii?Q?+oFyp9rbxwmu0D4RVZz6n9hPsdVvBFF3C02S1OLWjwL9uZHxF4/I5cN1VlAN?=
 =?us-ascii?Q?cdPVngGc5TqA9mRNr+5VotOZQk0jO93L/DVuqAQmPo9uYDOuozAtk2ZS7SSw?=
 =?us-ascii?Q?ap47iI0OufErPpmAoGgna1JvUI8XJLQS6KSlKT9+g5cmBSTEO3ka1h87vjpE?=
 =?us-ascii?Q?0EVT+FfzPuNvUTIzCEFjvlW7iS5ZE4PwWv+bdPmYCQQochWMx/v5Qp2J+RRi?=
 =?us-ascii?Q?JAiipHq9jtoTjM5JrApYWdCWfBdAwk6HrN/n84pb8vT63mVTfiFQ3/ALmqaR?=
 =?us-ascii?Q?9MtUVosb/4ShjeH5aTEAsoUZ0b8WC9f/gCTYuIMwqLGGPBA54GMSIzeXpANz?=
 =?us-ascii?Q?rJd23yVfv3aAf65TUtCh1KUaSLDvfy6bPuEdh8ZzC1xgh21zZ5UcD6uokevA?=
 =?us-ascii?Q?tuTX9N1ShME3+dd6L75yYoecM4cnKyiW4nHCBtZQ+3nh/6gfdUk/pMn8Wbuo?=
 =?us-ascii?Q?zeXSvaWJw0Jqt3V/vxeRoajWSW+ODSZii0cSXXZuNJmfvCeZR0+nf19yTGoe?=
 =?us-ascii?Q?zovezEWmQEVCg2EZtFzutmbDHdXKOROWISdNWczY53BBTKogW4L/R7bqXZYt?=
 =?us-ascii?Q?9TqotHhCLNXZxWJLjE1qqyqbyIBsi0YpsuB9nlgVnCD2T5ph2ywrK9bNE/Tw?=
 =?us-ascii?Q?kWVEtUOr2YSoMKv3SDJb77+HfXRzKU4KEDxFPR1dFuL+bOU62J4apdclEXNw?=
 =?us-ascii?Q?w5vzQF0sPSSVHGB+ZlE2RSNaJeaUNXS0MJ1AUTW2gB5hDoV7z+C+QWdtt13P?=
 =?us-ascii?Q?lsMoyZJUGM4B3dWxVWYkulWcZgTI0fhdMyWUIbdlmHf01Swo7s5IJbY6tsO1?=
 =?us-ascii?Q?Wl1G4xivf1LHpMxR0ADNnsRXUsWNVIiabi97moO9bkSs4rU1wVzmZehcIjds?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1bcebd-8817-476a-9149-08dc65f4caef
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 13:28:43.2927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYLo/o3yTy24w8/RehGcrLKJBRbPw+R9IINpgTEy5G8vhnRmQCc4DLsIdBHgytQvRhgcqikFQ0JI4qjVNFG0MslCac5tcFxaNEmg9OBcKS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7030
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

On Fri, Apr 26, 2024 at 12:11:33PM GMT, Tvrtko Ursulin wrote:
>
>On 24/04/2024 00:44, Lucas De Marchi wrote:
>>If the fdinfo data indicates there's drm-total-cycles, use it to
>>propagate the engine utilization. Also add an assert in intel_gpu_top
>>since it only knows how to deal with with engine time busyness.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  lib/igt_drm_clients.c | 47 +++++++++++++++++++++++++++++++++++--------
>>  lib/igt_drm_clients.h |  7 +++++--
>>  lib/igt_drm_fdinfo.c  |  2 ++
>>  tools/intel_gpu_top.c |  1 +
>>  4 files changed, 47 insertions(+), 10 deletions(-)
>>
>>diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
>>index 71a938b18..8b1959ae1 100644
>>--- a/lib/igt_drm_clients.c
>>+++ b/lib/igt_drm_clients.c
>>@@ -106,16 +106,41 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
>>  	c->last_runtime = 0;
>>  	c->total_runtime = 0;
>>+	/*
>>+	 * Make sure utilization type doesn't change between any 2 samples,
>>+	 * otherwise the units don't match
>>+	 */
>>+	assert(c->dcut | info->dcut);
>>+
>>  	for (i = 0; i <= c->engines->max_engine_id; i++) {
>>  		assert(i < ARRAY_SIZE(info->busy));
>>-
>>-		if (info->busy[i] < c->u[i].last_busy)
>>-			continue; /* It will catch up soon. */
>>-
>>-		c->total_runtime += info->busy[i];
>>-		c->u[i].delta_busy = info->busy[i] - c->u[i].last_busy;
>>-		c->last_runtime += c->u[i].delta_busy;
>>-		c->u[i].last_busy = info->busy[i];
>>+		assert(i < ARRAY_SIZE(info->cycles));
>>+		assert(i < ARRAY_SIZE(info->total_cycles));
>>+
>>+		switch (c->dcut) {
>>+		case DCUT_ENGINE_TIME:
>>+			if (info->busy[i] < c->u[i].last_busy)
>>+				continue; /* It will catch up soon. */
>>+
>>+			c->total_runtime += info->busy[i];
>>+			c->u[i].delta_busy = info->busy[i] - c->u[i].last_busy;
>>+			c->last_runtime += c->u[i].delta_busy;
>>+			c->u[i].last_busy = info->busy[i];
>>+			break;
>>+		case DCUT_GPU_TOTAL_CYCLES:
>>+			if (info->cycles[i] < c->u[i].last_busy)
>>+				continue; /* It will catch up soon. */
>>+
>>+			c->total_runtime += info->cycles[i];
>>+			c->u[i].delta_busy = info->cycles[i] - c->u[i].last_busy;
>>+			c->last_runtime += c->u[i].delta_busy;
>>+			c->u[i].last_busy = info->cycles[i];
>>+
>>+			c->u[i].delta_total_cycles = info->total_cycles[i]
>>+							- c->u[i].last_total_cycles;
>>+			c->u[i].last_total_cycles = info->total_cycles[i];
>>+			break;
>>+		}
>>  	}
>>  	/* Memory regions */
>>@@ -207,6 +232,12 @@ igt_drm_client_add(struct igt_drm_clients *clients,
>>  	c->memory = calloc(c->regions->max_region_id + 1, sizeof(*c->memory));
>>  	assert(c->memory);
>>+	/* Prefer using GPU_TOTAL_CYCLES if available */
>>+	if (info->dcut & DCUT_GPU_TOTAL_CYCLES)
>>+		c->dcut = DCUT_GPU_TOTAL_CYCLES;
>>+	else
>>+		c->dcut = DCUT_ENGINE_TIME;
>
>Hmm I have a feeling igt_drm_client shouldn't be making this decision 
>but just tracking all available keys.
>
>As such I would suggest making these flags instead of types.
>
>(And with "dcut" naming spreading now I really think it is too obscure 
>to stay.)
>
>Something like:
>
>if (info->utilisation_type & DRM_FDINFO_UTILISATION_TOTAL_CYCLES)

I guess this will start a war on british/american spelling :)

more seriously, see below

>	c->utilisation_type |= DRM_CLIENT_TOTAL_CYCLES;
>if (info->utilisation_type & DRM_FDINFO_UTILISATION_TIME)
>	c->utilisation_type |= DRM_CLIENT_ENGINE_TIME;
>
>Intel_gpu_top and gputop then pick when they know to work with, with 
>the priority the application chooses.
>
>Regards,
>
>Tvrtko
>
>>+
>>  	igt_drm_client_update(c, pid, name, info);
>>  }
>>diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
>>index 5c6130ff1..5ab6f6e2e 100644
>>--- a/lib/igt_drm_clients.h
>>+++ b/lib/igt_drm_clients.h
>>@@ -65,9 +65,12 @@ struct igt_drm_client {
>>  	unsigned int samples; /* Count of times scanning updated this client. */
>>  	unsigned long total_runtime; /* Aggregate busyness on all engines since client start. */
>>  	unsigned long last_runtime; /* Aggregate busyness on all engines since previous scan. */
>>+	enum drm_client_utilization_type dcut; /* Select method to calculate engine utiliazation */
>>  	struct igt_drm_client_utilization {
>>-		unsigned long delta_busy; /* Engine busyness data, relative to previous scan. */
>>-		uint64_t last_busy; /* Engine busyness data as parsed from fdinfo. */
>>+		unsigned long delta_busy; /* Engine busyness (either drm-cycles or drm-engine data), relative to previous scan. */

I was trying to spare yet another counter here since application
has to use one or the other.... but I see your point. Maybe we have too
many layers of abstractions here for what it's doing?
drm_fdinfo/drm_clients could be just one layer rather than 2.

Anyway, agreed with your points. I will change on next version.

thanks
Lucas De Marchi
