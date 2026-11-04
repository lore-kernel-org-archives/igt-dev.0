Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BE9606C937
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 21:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=as1yJsqX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A7B10E00D;
	Wed,  4 Nov 2026 21:01:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF4110E208
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 21:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793826023; x=1825362023;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=RC6yM1ZfM/XzL6OL79p1ub2/bJsL5z7LBn/r2b0BSw4=;
 b=as1yJsqXhf6MPqnCMUcKS0rrpphk23WNIUSrs4EqVmQB9trMDFHXwHka
 qDhg3ccShYCaE0sFKVghqAj1osSoTUiiJhB6npUzu8cFon7SL1rNcCioa
 jas/94Po4A5w0U6gdko6qBNmZ41mGt5A//zi305fMEUr4Tc1i2UOb0AkB
 LIXakYvff8Ldw1/KNae3lNq9e1IijEVNz7DHGixtho4HcTzXld/gGrHmc
 e13WgrhI21Xly8xVMmMUDiRuoiqEMFQ9CREjvSyacPd4mDyer4SDZ8+eR
 35Xq87aLbD0MDI26l2dCgfzeTorzDwV3+pwom/gNg6RYNnjFWPt+bnPWl g==;
X-CSE-ConnectionGUID: G+yzscqMTsG/4GwJISFOUw==
X-CSE-MsgGUID: vdi4N1ZfRH6GHwtyrlC4zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2615459"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2615459"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 13:00:23 -0800
X-CSE-ConnectionGUID: vI9GlT+xTKiyXEBfD9E1TA==
X-CSE-MsgGUID: QpFObPMMTNqad1cjTjv9Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7360919"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 13:00:23 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 13:00:22 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 13:00:22 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 13:00:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6fglvXypreDryarNM3opNeHxMCtU4zn03t4CY/jdZkFwByS5xH9rQBHrImjfqwk9hYGyGcQGDHkwLRFIJezacmgJ4mm8o960kLds5Npp0F0HDfzoRAqSRgJ/Q3apN+JDH9tMEBDVhLof+gvdFemORDQRR7MeEo9ZgjxIYiDjiniTqAC2xstHkSLYC5jFwXFXU7LTGvVMlg1sh4JDtf/fNunBhMjsBCBc1+c+7e+g92sr66bL53btT23VVVcq4iznM4kI0lZlJEn7eZkD3LF+z6xGBcNqX4lB0gFLBeM9zpO27xy8pP7SlnBNp9KJ2e1XlXzElnmRZCDYvaYCc/y/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgHUtgsNOj1WHBG2Q0Syp8UwLWPbD5EHug/2qUoYrIU=;
 b=yJVdSde8VTJVY1PIzHwn7+qtk4jlyw6N/w4ROuX6rqZpLxDnCRsDc+U4jWDt9/XvEv/KYREf/IkkZQHFRnwDWUyO9Xw5/DdnsNhLkIlErx13GIue0q8uRkQ9SCSWLkszeebjbjjwzHycPaP7SXjhlxxsSFuTIyqgwlg/5kUuGhpVJTwv9M8uklCkU+qLXGww9cDyoiAWI1GO5s4uuuLLNyMTUbZ6GnMnIxUf3GfiLLaLO7uJkwXm+/PgfEVfy3wZrw+pL/QH/pDuVLonBRBGMHTSGnzRpau5/bdbGTA+q7W6optAfPVuxCQsk/GhQR1o8z5H1S2oPWlcFywVYGZEXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by IA6PR11MB557005.namprd11.prod.outlook.com (2603:10b6:208:601::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 21:00:18 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 21:00:18 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>,
 <arvind.yadav@intel.com>
CC: <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH] tests/intel/xe_exec_system_allocator: Skip reserved PAT
 madvise indices
In-Reply-To: <20261104075129.1615348-1-nishit.sharma@intel.com>
References: <20261104075129.1615348-1-nishit.sharma@intel.com>
Date: Wed, 4 Nov 2026 18:00:13 -0300
Message-ID: <8733tgcnxe.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::8) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|IA6PR11MB557005:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fb53263-ffd0-4823-04f1-08df3ab6a1c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|261102123227099003|260925021911599003|260925022911599003|260925021311599003|11063799006|261022075727099003|261021121427099003|261022105027099003|261009223027099003|261009221227099003|261009223327099003|261009220027099003|261028144727099003|261026121527099003|261009221727099003|261026140227099003|18002099003|22082099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: C2l612IOrOcZ/aq1Aj7KigorrK8HaZEBHTefDsP9rV/71yyq/B6aRkU6s76s0x98RvuInq+XghFSlYuYUaOwOG5U0zYvV8HB2q23wxKhka1ZMjDpHVGfXR2gy3CyPusCsqc/1eVwA05qDDQVWK2kdpJ02ikZamKP1rLTMKpnfZDdYqmNPs9wmNe13/456z46ZOzX7v1cgxzWOtCYP9quOAYD6+m9jRaoh7fN+Spa1YqUxlqkiiXr/xD4VBbfUojLQwtPcjH7Oo3aRluuPPgEXgWleASHRonwlNxS5pHRVcaAj5pHi46V4+wiaCDMYfHQfXwNT9it2clgFFZ0FMwdsM/qmKiErKJr1daPFrJ7mOu4dLY35PUx76veX7PIT2TehzyuGN6Ek1BF2C90ClsQ8LH+nSmcx6ch4TJmC6QIFniXQcWKiI1RIswYElxDKOvD0i4NK9RtUbhxCKVkWeDqpct1H9G4+xWQQTp8EvQf5sIGjlJ3WQ3GpPgp8rt1qDf7yuoc4h+punSGyEc0aioDwNInPrJN23TqomVlVkL8RlHPowJ7Y1qloF/URaGCKJu6+Ghrx14uscIPT6zLtx+qThhLkwsvglePbU9sNW/yzDurYSC7D1bKvg4Hqdm88CweOa7lkMGbYvcJ5os0z1wNKO2A9QNRg4bZmifFdnTtA6Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(261102123227099003)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(261022075727099003)(261021121427099003)(261022105027099003)(261009223027099003)(261009221227099003)(261009223327099003)(261009220027099003)(261028144727099003)(261026121527099003)(261009221727099003)(261026140227099003)(18002099003)(22082099003)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ivwwdB6WgiJUKlU5ymuYddIFwJA/VpxRjn4zF69N8jSnxDYHWQZ/ep6bqiw6?=
 =?us-ascii?Q?xkrah/imhiqpCMmUR7BfNicR30C7DvHvAXWsl3kUzLiM/BI7luqAZK3o5qMH?=
 =?us-ascii?Q?9/s3Owi0TVnk+aaUUgxtAQetuBj3NvqbnCMjI+pW8qmvKG7pSCU7ii0bqlfk?=
 =?us-ascii?Q?23H3qQ3eRT2rcRioM1uJruNe+UfgPCx9teJHd16WMdTSrsl4eeRFczyp2aX+?=
 =?us-ascii?Q?NfMeT3zF6HvtvF/Wz5FoJlOxcjCYWZ18F5GEzOPWe1n1JSXqgA+d3ayM5z2G?=
 =?us-ascii?Q?IObA0ibovg1ySqtvmqOmwGIVu9vvs1B0qe01XOvfKM50zPy1CoH2kvYfzeB0?=
 =?us-ascii?Q?uixYn9IvfSyGOHgFOn4ED2niTo4uO6HeQT4DOEkSKaynX7HFUI48LnlVwjKp?=
 =?us-ascii?Q?gOfkeRyrtvwcpbk4HuW3Yn8OYSxaUDi1FbhmP/MsBLvmqVFy2+0MCGhl+E81?=
 =?us-ascii?Q?LtCLWLuz+i4lNQcoL1nSgP+BGe1AQW0d/+vV5Q8mFIsVKdsFw7wWYSAEvFk+?=
 =?us-ascii?Q?0p39PK7FJxW4i0z/EkO9x79T9FE4+Rrm1b3R1wAUpEk3f+HLMjaggMALiFPD?=
 =?us-ascii?Q?36qtSVT5A+Ckd1AD+2q9rCP5DBtn++VnBARHCGR8jg3xKjJ7edkXchKmtor1?=
 =?us-ascii?Q?4xyz6c3swwjAzuMO/Or8enTlj4aG2QABm/PSNSuEgpMJf6G///HeVISxnZ6h?=
 =?us-ascii?Q?QyM9+tiLmVbihUoO0esJ3M53nTUhma/UG3fWK+XyJKuZHPbdsNz7Wz+U3fhN?=
 =?us-ascii?Q?wuAYdEoGsBzQch70OkB3qeD5c5+/e60k26/gsEaLL5QMyirA0bqL8PlzKkRx?=
 =?us-ascii?Q?nhT+iWcX9OA6GiAOvlIpRajJLTrheqjkoMtvRChusHl2bbQmsbY8FHDchf28?=
 =?us-ascii?Q?MRAKKUbYo8ImkdYZpwIjt6mryV4Lzym/XYwoMGUvBtxGZdZk8IQE8CQu2euQ?=
 =?us-ascii?Q?/U4A1bdamhREI0P39LD1fJDvb6ufWWxypljxFmyvrIobAhTV+fh3yO8zSLeL?=
 =?us-ascii?Q?p1SCF58tcTovqojaPiqYNAIAyylpgixt7/bmJh1bka6MzhOusPHs1lX6Vyul?=
 =?us-ascii?Q?nk3IMKTI/mg8VodfnPkTU/5mG1nQDAtQHQB+VjqxdY9QWx+ZSpgj6wayUDvS?=
 =?us-ascii?Q?MVPmSgFMlTlrgb2zUTlvtNKgOMVwARN67czecD+tboCGZUMyf7YBEFyiB7ku?=
 =?us-ascii?Q?TG12rdrGGf9p8COJIAg65WxvVliURkbusRUD5QvV+vGbcAV8n1RwjyeEPkYk?=
 =?us-ascii?Q?KWyyTnbFN0sNBBC7/Zr+xswLDrKYRDp6S96QYCkHkgnbK8F7JRtXSzFOAMeV?=
 =?us-ascii?Q?mHUxz7zfUrZlMEnK2OFZYKbRCAKnCMZTRepx6RbAgqUhvknjSbzA1cXMbtdR?=
 =?us-ascii?Q?emzUxAMMZS785kiAKXKICzzFEgmUEdA6BZbt/a9jYgVVnIPu0R8z/nyFmIC3?=
 =?us-ascii?Q?meEXiSe8bXmAgAz/B7k9Twi5n5hUPuIORQTFV3BT6lsMLi/b4mtzFB1yEGwr?=
 =?us-ascii?Q?Bfn7CU64Sz1GJ+kwc90FCXnHSGoATdxb5wBi9ttKnSjnR+YK/GOwmkjBRrzs?=
 =?us-ascii?Q?rxT34fmQ/QlH5BPY1s3yyEh6vjynnsNR459upT9SBpSyorOLPVf6s4Y1Mfgp?=
 =?us-ascii?Q?UNpz8N4CllT6fcVP9ZcT5df0brfLs5gVXZVBtocV7DsFiBtpw+wavPBeYth0?=
 =?us-ascii?Q?0ACiQXa0BhOpbwjc+nubvvAfg1AvZqSslKYxQCLiQNAtDM1y5TqbyqxHhhJG?=
 =?us-ascii?Q?0RIaBV/QBw=3D=3D?=
X-Exchange-RoutingPolicyChecked: Yx4MLGHCD6q/YKNGchJjzqv3t+esgE4Xo2fyalBffblA3DHs9pV8OAygSp+6MlEPETN1gGLVdLKjD4sYKfuJ2JQSCpMrVdqRxnO6H62GgZVvD+AUMHzvVXu32seqPKdVVpOiAJNbR8pkUlkCzESQ+d/0BXi30KgfXfAECP02/SzM87WBOab/p7I2iALvVuM6LcD/6XAwyiT8awmeH6MxDeicYlMfLdOULgcNrjwHOw2tTC1MYX7O1nuzTpPPjN4LKpbQwiRK0dtugUiv1JJ7G1cfJYomdwi6v7/PfJtOm61OSoXH36aYmvlYZg2mXVF7vT+DNOUEcmJwMQwXqBD6tA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb53263-ffd0-4823-04f1-08df3ab6a1c1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 21:00:18.4299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGlcLGnM1cgckswSd9pwVLBQTAGPvU+vASc7e6QxzGt1iBFOtLl3ywlcPZKbtHqe1/io027rj1cjrDrSU8iMBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR11MB557005
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

<nishit.sharma@intel.com> writes:

> From: Nishit Sharma <nishit.sharma@intel.com>
>
> KMD may mark some PAT entries as reserved in the debugfs pat_sw_config
> dump (e.g. Wa_14026539277 reserves the 2-way-coherent entries), and
> such entries must not be used. Skip the PAT-index madvise subtests when
> the selected PAT index is reserved instead of decoding the coherency
> bits of the PAT entry.
>
> Always read the PAT software configuration rather than only when a
> specific workaround is active, so that any future reservation is
> honoured as well. Kernels that don't expose pat_sw_config have no
> reserved entries to report, so every index is treated as usable there.
>
> v2:
> - Read pat_sw_config unconditionally (Gustavo)
> - Don't mention Wa_14026539277 in the skip message (Gustavo)
>
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
>  tests/intel/xe_exec_system_allocator.c | 32 ++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 45ec62813..c6a8872b4 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -1216,6 +1216,16 @@ xe_vm_madvixe_pat_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
>  		      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0, 0);
>  }
>  
> +static bool pat_idx_is_reserved(const struct intel_pat_cache *pat_sw_config,
> +				int32_t num_pat_entries,
> +				uint8_t pat_idx)
> +{
> +	if (pat_idx >= num_pat_entries)
> +		return false;
> +
> +	return pat_sw_config->entries[pat_idx].rsvd;
> +}
> +
>  static void
>  xe_vm_madvise_atomic_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
>  			  int mem_attr)
> @@ -2647,6 +2657,8 @@ int igt_main()
>  
>  	int fd, svm_compute_loops = getenv_int("IGT_SVM_COMPUTE_LOOPS", 1);
>  	uint16_t dev_id;
> +	struct intel_pat_cache pat_sw_config = {};
> +	int32_t num_pat_entries = 0;
>  
>  	igt_fixture() {
>  		struct xe_device *xe;
> @@ -2658,6 +2670,19 @@ int igt_main()
>  		va_bits = xe->va_bits;
>  		open_sync_file();
>  		dev_id = intel_get_drm_devid(fd);
> +
> +		/*
> +		 * KMD may mark PAT entries as reserved for various reasons
> +		 * (e.g. workarounds). Older kernels without the debugfs
> +		 * pat_sw_config entry don't expose that information, so
> +		 * treat every index as usable in that case.
> +		 */
> +		num_pat_entries = xe_get_pat_sw_config(fd, &pat_sw_config, 0);
> +		if (num_pat_entries <= 0) {
> +			igt_debug("Couldn't get Xe PAT software configuration (%d)\n",
> +				  num_pat_entries);
> +			num_pat_entries = 0;
> +		}
>  	}
>  
>  	for (const struct section *s = sections; s->name; s++) {
> @@ -2879,6 +2904,8 @@ int igt_main()
>  
>  	for (const struct section *s = intel_get_pat_idx_functions; s->name; s++) {
>  		igt_subtest_f("pat-index-%s", s->name) {
> +			uint8_t pat_idx;
> +
>  			if ((strstr(s->name, "madvise-pat-idx-wt-") ||
>  			     strstr(s->name, "madvise-pat-idx-uc-comp-")) &&
>  			     !xe_has_vram(fd)) {
> @@ -2887,6 +2914,11 @@ int igt_main()
>  			if (IS_PONTEVECCHIO(dev_id) &&
>  			    strstr(s->name, "madvise-pat-idx-uc-comp-"))
>  				igt_skip("Skipping compression-related PAT index on PVC\n");
> +
> +			pat_idx = s->fn(fd);
> +			igt_skip_on_f(pat_idx_is_reserved(&pat_sw_config, num_pat_entries,
> +							  pat_idx),
> +				      "PAT index %u is reserved\n", pat_idx);
>  			xe_for_each_engine(fd, hwe)
>  				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
>  		}
> -- 
> 2.43.0
