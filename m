Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3C8606A31D
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 12:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dEbuucLd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC83C10E2E0;
	Wed, 28 Oct 2026 12:41:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8666310E2E0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 12:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793191241; x=1824727241;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=76plyECEhW7uUuEjyY7NwOk1DeTO3Ssu1YKr+hwTXOU=;
 b=dEbuucLdzcAHOeUcYmZRhxq9H+t5fgKrqx0qeNyvjYfTuZtaHX84iyZE
 dfR+6z/yim6+EJMuJ/pLTc7cqXAqD5Hn1gf6/ldBIBpnqdFifcR/cOPf1
 O2hPoK5u7ojst6PxcOqH/76o1wkjRB/5oixexxBKa3kOhJfGEzHsPnbQf
 xUbBgzQidlt0YJ0LbU54xYSuWHQwYXttHIBXMwghV+w8zrArse6HgopeS
 u0AiAITDI1WTI7TgcAVYV9mW+TyA0dFYt85OYPpsmyJ7zCx8pfVWHK6HU
 LKFo69qvPoCPn+zHS5WsV3pt9P5oMWgOBWtybeo63aPgCRKPql2Y6Ht2j A==;
X-CSE-ConnectionGUID: wOR5jFSaSoyTUTmTIr7jLQ==
X-CSE-MsgGUID: LxYUCg+PT/Gmbxlk7VxjUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="2015465"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="2015465"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 05:40:41 -0700
X-CSE-ConnectionGUID: kG0T2OX5RmS7kuE8cFEtJQ==
X-CSE-MsgGUID: n1YKC8rvS2KqYidOKJqbgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4871293"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 05:40:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 05:40:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 05:40:40 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 05:40:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUTeuMaUKKxZHwlCEfnMW4n1JUM3+2lEiswxBkNJSyYYL21ZlM4sDm80XvxEbkFSMply6DcRb9rsQ0Abp9w75tJXqNT6WuG+Zh2GMVeyp1a8OdPXrsxluhiu4ytI5+ZII2wWfjjvvMdIYJ1eprFqfUEqXkxJWROfhqYLaUPmxn8cEFjyA051xGTN2defHkZlQk0uU9jhmPzcRxCBPO+Lhc6fWPMAcFIXPP1dxgJdTXN4RzUyxVwpcCzupOOWTm2p8TFdW/0en2M/hoEUl1Gje8+tF9glMhXJXj6VtkM8mumY6i1ySJckTmpiXwiOSvmVpDPcekxDGCQm40o/vFESXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFOHO17Tw4MT6OvOpO+w/KaS1F3J7VStfzbXzfOchtE=;
 b=lwMdleZz7zZCdpOcC8ddIjV7/jwNq38FhXhREehX4T/s9QYxw8rO5v4yVWRHSm2uCLJR937qe2U39shdppBR5QCiaXzGAkog3cWHSJppFCerSyFwMkFJDiBKlnlHfn+2u05aCqVjEY8p6enWo8ws0KnP/It89S126k8IlQFbvIZPewBgAf27kjrBNbx3TZkCEQN3gEtkXIuEXImSya0jck+UXuI0YziDFwq7nqin/VmG6U4SQ1J/kFNRHkz6MBR4N+KxgLCOfSIC1mvh2XUzBf4YyVPEimClpriZzRjhwsHpzsGcTaHrCBLAr1rN148g380OzcVt4dj8fhPSZ260pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by IA4PR11MB632906.namprd11.prod.outlook.com (2603:10b6:207:10d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 12:40:38 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 12:40:38 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <nishit.sharma@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <arvind.yadav@intel.com>,
 <kamil.konieczny@intel.com>, Jia Yao <jia.yao@intel.com>
Subject: Re: [PATCH] tests/intel/xe_exec_system_allocator: Skip unsupported
 PAT madvise indices
In-Reply-To: <20261028122535.the7nobqbeotvnei@kamilkon-DESK.igk.intel.com>
References: <20261026052051.1472943-1-nishit.sharma@intel.com>
 <20261028122535.the7nobqbeotvnei@kamilkon-DESK.igk.intel.com>
Date: Wed, 28 Oct 2026 09:40:34 -0300
Message-ID: <87jyn2m20t.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ2P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::12) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|IA4PR11MB632906:EE_
X-MS-Office365-Filtering-Correlation-Id: 03639174-d72b-4fb4-ccbf-08df34f0ab44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|5023799004|11063799006|56012099006|4143699003|261026140227099003|10067099003|261021121427099003|261009223327099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|261022105027099003|260925021311599003|260925022911599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: TrMe0WhUY8f0Rc6qSauh1i9A+Nr+0iRfPadmt1Jp9wDsvtlvp3nhPx4Km3KDZ1RhrGlfltS1YXHl11kgm2Sem96Kb1cRMjfgbKDcBJEmSsZRrBdXXZju2mB043nBRxxBPAySzcs2JBQgG4skjzb+jZmUDpkhrPpspLpbETDqlUPML8Q35boN9op5cLeDjWC2oI3x1Cnofuo+z4mkcPoZtLMoBBBzLDocm0X0SlysB5agNCdVtjjnNaR2AUTf0C194oClUEIn1elWunAQgOd2wsmailDHNYsjPy3VXKQJxcHT5by1Zc5qGDRn4OGKY/5N18dueSgPIlOHhLlRgCqbTBqDkHKi4nJlt8Cg5Zf3YKs8oPqOSCu+aMWcImtG4GAzE9FnK9alys9j7z9oV0vsRDXG1cgkxvIVHp9JLJsnmayUe8aGY3XG84Wn2eP4NFYu8UdBJURPmEiim4iRjQ9l84XGqr5Lzl3IKOfE6v1bETT39kJUjVTV9trwkCa80Eh5xs9Xj7w1lNYQRrGKlvEwxlL2gxsj+8LXQcArxC53AYvsIbtEL8VxASdrdK6+8lsCYbgW64ze9v2a1vEhQcmAtcmp8mD0DNGrBP3ynzbseeu1fBJLV5fsYmj+ZzPc+8jvmmbZNvlwOd/85byU+39L0WNZxmxNznG1jaCiKLeKQ98=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006)(4143699003)(261026140227099003)(10067099003)(261021121427099003)(261009223327099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(261022105027099003)(260925021311599003)(260925022911599003)(260925021911599003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h65nOCV1TOdDACtT/C2AHMi70TxOX52ITGdBAsZqFRc+iJyN0IbvxPSXT6dK?=
 =?us-ascii?Q?3AQMTESWfJC6onn6biQxVytzkAA5wo5n+3JawM2J+ltgwQEF9kSdFZnkAk9u?=
 =?us-ascii?Q?Z2MqrAt78lhqms7Z6RiPzncWFKOMVXdm8cYArdajxY9vCEon8J/qC2UnSUo5?=
 =?us-ascii?Q?23Nk0AWdJxvPb06r6mMKMwlbwHSkkxoKjWewWsZSxmpVVHTCPQps30Xdf/9P?=
 =?us-ascii?Q?vPZ7zQIxgbt/EOsMi0otcVbe9OWoGhxgCLs/n9o/CUXD4m6Zth/vjOLqyjZb?=
 =?us-ascii?Q?4c0ydEXiTJl9bw82dBcviQMB5qwiPrYlxpgn09wpW+8c6OxjeO8aJ3HASkRj?=
 =?us-ascii?Q?B87ZwhldY/zI4BXa1Osurpq0JpLN7xk00CtbIiLwKpj2+2X+Il8qBv3REh10?=
 =?us-ascii?Q?gOY15Q8UJBp0V7lJeZV69oEG1cgtwlVG+E9ALNf9WTCMHkglAndooHnVl0RX?=
 =?us-ascii?Q?hdtu1sMWY+iEl9T1K4hozpqHExOTdYJFvels8utDUVR9Xnz0WWEZOFhsH12u?=
 =?us-ascii?Q?XhuQNDDWRWQ8AklrvLKoOS99dc/NJkHf5bbOEc8ARV5EQ+6Y+Jj/UJfskNSY?=
 =?us-ascii?Q?8wn2RZCihQzxDoJwiA8PCxvIaIFKsKsAye+h2BnVGVNwGkiMZHtLx8+I00Yq?=
 =?us-ascii?Q?soJuES3lve4fUwaMpx3s7f9KVqqLOF5tjZFQOK80JEBuA3RZb8BkPtwOngHw?=
 =?us-ascii?Q?qjKWWKahshXuzFFWpprzhTH9IdUdwEG4Fiq9ZPWeQt5Ywlvb6dfqiR25TORW?=
 =?us-ascii?Q?we4XpoucaOXLmoP3jfSn0duDCl7ifHQiCZdDtx2wQ3Iio022NQg/FHO+kb7E?=
 =?us-ascii?Q?3qNEOI9YZBoaGBs62lD1a0/M+McbWJdNCPD4eB0PNZvhYCGKAOmE3+xMP8hH?=
 =?us-ascii?Q?pfBENF6dSeaWeQquV9AnsxwjaGzApOEQISmiPXpEfTAlNscUR5JwRCZ8lQSe?=
 =?us-ascii?Q?6+QWDsC0JK8O/F3KP1Wqx5su0leKLqx6tS6sIgMFzPekbSwnCBOI+iNqX5Fh?=
 =?us-ascii?Q?5VuR1qnPFssRRQQDFxLKm7NrRaYHKKHzvQaQnI/ZmLgb4nESFH45o3Ij0w9n?=
 =?us-ascii?Q?IelKAPHchEgqxfiHx+ZGx0mzlyJblSHRMt2UH56Uqfmjg5OkjdRGuH2gGNQJ?=
 =?us-ascii?Q?AkTgnELUg+Tfvqs2ZSgVd7+CvB+Q7PnXGOcUc4Y4BTF97+OIJBS155Jz7S4O?=
 =?us-ascii?Q?AU6LFG6M8xbY5JTdtu2SFrUkz/FizltqLNNj+AGqxQlZDtbdwVu6W5SVPPH+?=
 =?us-ascii?Q?ORNAd4YrOKYgw3NIPK/GgVF/kzhkrGZEwBjdHE8XSHTb/y8GnbF7HNoFI5t6?=
 =?us-ascii?Q?jjubWe/2WOZXeyE+KdFAtNwjxKkipaxaIc8JUdNQoLzCu+vBqmlB+Es3d3y6?=
 =?us-ascii?Q?vyrXr4bhfYO7ck/I8Z85xhxtAJwD+fe6SpW+lSYF4IksNTap9zhcEp0qrRVB?=
 =?us-ascii?Q?U2/ci/6tDv1EZLmXgd24KSp6SGQLs2E6uCvsR6+z3iMRXiLCP41JWC6kVjMD?=
 =?us-ascii?Q?yVGPTpUZq1L8ZwGAgP49epixTm+A+mD64qFAF31wVKm/4kK64w9Om5c3lhlK?=
 =?us-ascii?Q?zoUv4AzUog1fy6KCABNYmpBMeRjVtfqgyxmdrzGJbzhp9ioiRUk58tK9gmbO?=
 =?us-ascii?Q?3+eYLPvG1z2p5mrfp/p1PMaXwhtoU5VI3eT/IY290ZMfVkW01MX8G0TsuqcM?=
 =?us-ascii?Q?yOL4/EE986Kozkix7QwERnXKOhL5U9cPNE88YiFBocaTbeZIdWUiFyZR9yv+?=
 =?us-ascii?Q?dQvV6BtzjA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 4LvWGPrF5AQIiouEReK+jOBnBRbhN4eHuf72TyUHOddu8VgOuv1O24M2WyDiPPRdXwcG3bHYiU+MWpMuJzeJh9wM+sHrJf62fqYcl4m7IIhXIDSjcNdSoYnRAyNDL+1zBVIrL/EwQHgAHBkoEmH87sv5NNJhQaYzqbqwmZ93SnkzeXAVfF/AiROtDieip9BqrfSbJoiVRt2mswUmZOHPufjHmWFrK3Xj0rDcCixgO0JSlLGlPqAj4Q49gUkhDOghc5ztJN/8bRSocwvomcyDyaQoIvL9Ygwp7TRToPk3nu+KWdYKVpwF3lahwlYzsSrCUFqNdyGtxNAop7RakZYWHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 03639174-d72b-4fb4-ccbf-08df34f0ab44
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 12:40:38.7552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OzGENIN3hXDctNYmX6FgbLAN9VUzkMCyuZ7BV1VebhRPDHOKvwEGL2lvUwEGBZcUW6FbqZ+FTbRVKv5lHGnw1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB632906
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Kamil Konieczny <kamil.konieczny@linux.intel.com> writes:

> Hi nishit.sharma,
> On 2026-10-26 at 05:20:51 +0000, nishit.sharma@intel.com wrote:
>> From: Nishit Sharma <nishit.sharma@intel.com>
>> 
>> Skip PAT-index madvise subtests when the selected 2-way coherent index is
>> rejected by the workaround, avoiding an assertion failure on
>> affected platforms.
>> 
>
> +cc
> Jia Yao <jia.yao@intel.com>
> Gustavo Sousa <gustavo.sousa@intel.com>

Thanks for the notice Kamil!

Nishit, is this change related to Wa_14026539277? If so, with the recent
merge of the workaround code in the KMD, 2-way-coherent PAT entries will
be marked as reserved and you could check that instead.

We did a similar check in the recently merged commit b3b6bb81f007
("intel: Implement Wa_14026539277"), by avoiding using PAT entries with
the rsvd field set to true in the xe_pat test.

--
Gustavo

>
>> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
>> ---
>>  tests/intel/xe_exec_system_allocator.c | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>> 
>> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
>> index 45ec62813..2519b9e62 100644
>> --- a/tests/intel/xe_exec_system_allocator.c
>> +++ b/tests/intel/xe_exec_system_allocator.c
>> @@ -1216,6 +1216,22 @@ xe_vm_madvixe_pat_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
>>  		      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0, 0);
>>  }
>>  
>> +static bool pat_idx_unsupported_by_wa(int fd, uint8_t pat_idx)
>> +{
>> +	struct intel_pat_cache pat = {};
>> +	int32_t n;
>> +
>> +	if (intel_graphics_ver(intel_get_drm_devid(fd)) < IP_VER(35, 0) ||
>> +	    xe_has_vram(fd))
>> +		return false;
>> +
>> +	n = xe_get_pat_sw_config(fd, &pat, 0);
>> +	if (n <= pat_idx)
>> +		return false;
>> +
>> +	return (pat.entries[pat_idx].pat & 0x3) == 3;
>> +}
>> +
>>  static void
>>  xe_vm_madvise_atomic_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
>>  			  int mem_attr)
>> @@ -2887,6 +2903,9 @@ int igt_main()
>>  			if (IS_PONTEVECCHIO(dev_id) &&
>>  			    strstr(s->name, "madvise-pat-idx-uc-comp-"))
>>  				igt_skip("Skipping compression-related PAT index on PVC\n");
>> +
>> +			igt_skip_on_f(pat_idx_unsupported_by_wa(fd, s->fn(fd)),
>> +				      "2-way coherent PAT index not allowed\n");
>>  			xe_for_each_engine(fd, hwe)
>>  				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
>>  		}
>> -- 
>> 2.43.0
>> 
