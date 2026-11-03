Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7995C606A31B
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 19:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a4iQtLkC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2940710E14D;
	Tue,  3 Nov 2026 19:26:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435C010E14D
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 19:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793733916; x=1825269916;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9Iq+Y9iW3ow4a25Yw6wdDtdoSdLV/JctpyFnTR5TiG0=;
 b=a4iQtLkCE9QFF9o6NM58AF4AojJkKeBlajxvPiuaLhabg7cWdYSFLJch
 cYGeO3eWGEYL8xwF2z7i5Tj7BU/C5fWIbHEQLii5tt9HbVVIqQRek6aiI
 D2Mr1HPUg7s7SOS/eC0Ii/exH2duRkoIjVVPgolDjvPQ8UIOJjmQ2OCGp
 Z13bQlZC3AWMuBCkikLKmjQlIWjFW/tJRkJ0szjn2P3dlXEOWplsY+P7c
 nq6RT9g+m/Yzx8b6yvk/VXy/FLgKdKVpLKoRguv6LvlyA5bhDO4s/bcbh
 68a+c/ZZNNmY3he6gfslGCVRkswmgHiYrJxavfIFoILAv0TFrNdBTr4dI A==;
X-CSE-ConnectionGUID: qgS9M0GrQYivNnzC4r9ojQ==
X-CSE-MsgGUID: dK73/0P4SfiDqAMk+hHlkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2470280"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2470280"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 11:25:15 -0800
X-CSE-ConnectionGUID: UOWl+MIETTSnFZS6hXj9xg==
X-CSE-MsgGUID: l2R0xSZcQKSLuy054AWX8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6842711"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 11:25:15 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 11:25:14 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 11:25:14 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 11:25:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Igxvk7VdaoNmArQa85muOBzs/kpuJ18aKXB+dW/B/vdGIgyEN6fRyBvdvOj1/bRDvkpyLgBa4uoOFGDbjm38VneQj0sKxBJIDPqChXOwUPii+5cqivwPfdEzPCr4i6rehXp7T9Sx+QAcJCdOw5cfMWnIPhLwx55Ln4+hpHqAaswhqYIBMcE7YTA2Q+YkGHVxqJnAXUZl7xoDsX/BIcLqawk7NhqHkufjHJWI++ASgqozHYrK6UB7RDlP4ezsFv+uBkPnddBW192EJyVb5a2ijbHi3MnqbGQRQ0JYMj+sIgjgvHtLW1SyknLTgnEzbKJ8f/1zd8BQ/r/OPwZYpsqc5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5U58hKR7UmCGOss3EEkpFcb4k2GoFE6br6gUyqOb9BY=;
 b=bDG14u+PKk4UNTbiphvZKxazsUPhewP8xD8wwo9NeRWit65yCC7jXZwtfj7knZlnFmXvzIyuLOZLPBMG7tRXeP6JLyID22zfzY6gYXJV/DAyOtQIFLGUEutNLZt6eSSerLRFOPRGTku6iU3gYQz5ojhWqn+sSbakzVE3hhBZZTwAEQop5Ez96cykwG98busSmmtq3+HRzsIhGTRmOWnRoNpDhcjqj2vSpLpVU4S6fJRyPo2wU4f4nqr3HMokCXf4YnOZFpshGjcof3tQcbVa10z8WThVzFVBE6EaM8XAC3IqZHJnSmmBFexlG9jRcvg2eeHQSSq5RJNGMoynAT2p5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CH3PR11MB514151.namprd11.prod.outlook.com (2603:10b6:610:360::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 19:25:12 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 19:25:11 +0000
Date: Tue, 3 Nov 2026 14:25:07 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Maslak, Jan" <jan.maslak@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Dong, Zhanjun" <zhanjun.dong@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH 1/1] tests/intel/xe_exec_capture: Add coredump decode
 validation subtests
Message-ID: <auo1E2cbHNspRyAM@intel.com>
References: <20260816180906.884247-1-jan.maslak@intel.com>
 <20260816180906.884247-2-jan.maslak@intel.com>
 <CH0PR11MB53955FFEBDF6F99506698165E59D2@CH0PR11MB5395.namprd11.prod.outlook.com>
 <atoOZ3fo4PiHvXgD@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <atoOZ3fo4PiHvXgD@intel.com>
X-ClientProxiedBy: BY1P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::12) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CH3PR11MB514151:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e60c11-93d7-456b-892d-08df39e02d84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|261102123227099003|261026135527099003|11063799006|4143699003|261021135927099003|261028144727099003|261009223027099003|261021121427099003|261022115727099003|261021133027099003|261026140227099003|261022105027099003|261021123027099003|261021130227099003|261022075727099003|261026121527099003|56012099006|261022113327099003|261026130827099003|22082099003|18002099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: QVpSEPZuK1UAxEv4aPKcRc2Z04U2b9s1y6HfnaMFsbg4eQEA/g9RaZMs3F5b2UOqM879HGvXmFvAHxdzJkL+MfWESz3AubA/wmxsyV3JOZ9tRTrT+9a/XO70kBZ0G1KZOYTbBDOWaIqzzYDecajATtzJPkxCg8q//15Uu0jjvG947CKzO+IjfY+Qkx1/LnSUhNi1eqSveJn9N9LRYIrn9BBUX43ZQRhnnQmdbbTPsLRh2E21gsT5qkdsj9qAjBUTOgUTk376fbev0LDphHatQejXRYpK6Pj9Sv55kUq/zDV6KyiqSiyM+oYf1BXOkGuMb7+XQxlLqKTBQnJmxk+cO3VSnbNdX5wxP/QF3Oeyw4FND1DcmTDP0oN19mMeHa0xjPgUZkiUL88NhXX97OISBQrVbCa4q+FnDn9IdFXuS/GR1y8Rlm1CUWSTi0lZbHaZ0LHiLvlEP6leDuHz+2yHa+OqlmzUumSqmYY1IvaS0/dk8K8BsxKQuZgeT7VtXaMiifJw6IV2Nc0M2UJpv2bLx7q5hxRl4kJjDhuR9fPiW8bGArSK8DhBO7BtZ01l3y316sAiWlvvR+Q8wyepVz9GXgnnFJ9YMFeO9EmkNEPc5OVB5Yr0xvrF8l6VJwjfOctyDtMHy6hzIQ9dsWvD0UA2A0VBZaVaTG6ppdrcEvK54EA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261102123227099003)(261026135527099003)(11063799006)(4143699003)(261021135927099003)(261028144727099003)(261009223027099003)(261021121427099003)(261022115727099003)(261021133027099003)(261026140227099003)(261022105027099003)(261021123027099003)(261021130227099003)(261022075727099003)(261026121527099003)(56012099006)(261022113327099003)(261026130827099003)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NYF6IBTA2RQSTFO+NpLMEW8LHUuDIEJL4LxOkG3d26ppPfr30OHgwd4gpM8D?=
 =?us-ascii?Q?lSTov/N17j+PxVxoY7KG1yCs+J8vkzQD1QTemYSCOswoGS2mull6+gftFmHe?=
 =?us-ascii?Q?kXDFxTRRbmoPijsG+EK5zsSM7aLwTRDWZycl0ccSy3Rsyolnx2j6NoUlF7cn?=
 =?us-ascii?Q?hBHF/ttg/JRy+XcTzdAg8qDMwfsoy0xmNzhAhj/jxTtTsovwedAe0y7iyJEV?=
 =?us-ascii?Q?7KsWweNyuE2MTiTp8cRDGoZbTQWToGTKPZz36ozXIu0Ap5ir/AJBvLEfI7aa?=
 =?us-ascii?Q?PzA3a74hGCAvCC8u2fMVlLn0CXPoE903uxTmIIawT+TRGdA8Guo1+gusntDe?=
 =?us-ascii?Q?1+52XoQHJA6jE77Bi2tEkbchTwCw74rzfiqmzkDvfs3zssZNQu1z57/d1HWs?=
 =?us-ascii?Q?wF/QWbH4Va18U6vLzDJ0Tj+f7p2V+jEsw0tk6tcFk4lk/8bidIGz3O7+TcP0?=
 =?us-ascii?Q?BRi/sCbXmxmkHi2/Cz8kKYUtj9rZ9DjhWx+h2pJnEqN3oi9Z02bA/7cISxsZ?=
 =?us-ascii?Q?FpSVcdu7dXC9QlW6RiMqqRhOXBm19IZGv5s64JzGWUzpLmbDIl3l/7vEn3ic?=
 =?us-ascii?Q?Z5qGcCiFUUCJNbFGhqKjmJ0afoegit4Tht6vSP19rC+qShVRAAgJrQ1vffe3?=
 =?us-ascii?Q?w4v22RzcBb/26ewQs+PNvCuZBm6F8heCggTkxClno+3ww0FUo6q+woHfNCcG?=
 =?us-ascii?Q?3M6Qzw1HRydlCpvLWpnwxU4m9XZwGqxj3LrW5+fi3++eO6KCUOvnefPgqZoW?=
 =?us-ascii?Q?++S/jT0WSkNIamjI8aj1fpIhgh9I2cEPtU1r+uSNicqG5nud1oTWDQnSqeJL?=
 =?us-ascii?Q?PUTAB1aSPB1AWp9JTDAB9eVya6TqscjtRLDzo4b/C1JXuRxByk4addQBht0n?=
 =?us-ascii?Q?J6VHk9EMmp9DrzPmLPv2F0sZxiL8Ha3LdrRHPaoqThA7q6BC5KYxOaMSqrUd?=
 =?us-ascii?Q?Zo7IztmmRIg5+GdwX0O9Ida4GZzHXnaf+HJ9QAsn0yHrvX40Fwl+5c0VNu64?=
 =?us-ascii?Q?1KKFy/u9Wb9OD35avVrb9KM90QTJ6d5XOXn7v+bkP2SzV5RJYoz8caM8PA4g?=
 =?us-ascii?Q?6ikiiVhlGv8tz9zecPBV4n5MpcQP1p6GyJrJFAm3S3yEbSh609SYS8/e4LEW?=
 =?us-ascii?Q?EhDx13vbqag5KFpMwaw+mcHjVQEO4LhykyQie1Fc6ENuIpDdUvBW0AKTEAga?=
 =?us-ascii?Q?ZwkWW9ZM88da5JT2+qITvag48G/VMxQGNeTYsli0X5+aDIWVkZuBzakCJdKZ?=
 =?us-ascii?Q?ukzlDn6VWulvhYGTOGvSFyYgcllMDqwitt+ozSe0kOgRgQMT4+Vzo++0+Ksl?=
 =?us-ascii?Q?G4Lj7Iv4Gpkp2rPg2NEw9W6SGT+Axg9uv5ll7JWv+sFZsJ0OmW1q+26HGKhT?=
 =?us-ascii?Q?ewRqK/p1pNHQ677DD4wIHTw5XN8aXL4498a/IOPSdGbksPwRpkS1A4jfnz0g?=
 =?us-ascii?Q?P9GMpq7kFCmdq/nwiNzlc90m3KMri3Py1j29mxbb6GjCl5R4wgrCu4hFl02W?=
 =?us-ascii?Q?/5eAzYUi3PPPtKKGGoBqKHetM9RCpclsl4NGhnrhkTARwesEzOizhmuS/T0F?=
 =?us-ascii?Q?HXgRNog3Z6N7v0CZDAPMpGvO+7gqHVuy1CzKeCYrDl7nfCHYjRFNLEX6BJPA?=
 =?us-ascii?Q?rCTrZv9/6TloeEacVG+tMJmypU/7KQfTvE0e5hTnswgg+Wpg4SOApokM83/J?=
 =?us-ascii?Q?G6Jk9t/1GxJCE2IkPryK5kjEXauHRNu2HFwQCf4HI4vRffpyYPskRSjxp7ps?=
 =?us-ascii?Q?KSODOckR+Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: jOwIslmei6LaQrEr8CFY7UCxVt9O9CShGRkYi8PivVIh16KtXLqf/NGx5Zl9gLvnWKGLtEtJ7+pYu/OnDVbb1hYSoGV/GIo7qazS+/akjUQcYwIcdywGUR9ciQ5THhX89B9s4c2w85W1a//Tdm5WdN5IBmVI1GYV33x0rRB0fOfd5D5402MGxdDYhPxvl27qEtHzjZy2DSx0cVeLLCbcweQjEt1sx1AfL2DUUpldNbHYBd0qlOJIYPVBm8sVNDft0OBOlbgYZkfH8u4U7gdV/Fwz9qOioGQsMtQryFi8dxKfRPxxYZWQwSvz3SNAdTQUUNUk9pxVpRjpvD1EzALWxg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e60c11-93d7-456b-892d-08df39e02d84
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 19:25:11.3124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMiVp2fMsC+IcPA/Jy+LNVL4i4BKo7Kxs0gpOg2BHdj+Js95M8aMvBKELNeF4fnJK7a2v5rfVrHm9cwfmpiGCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB514151
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

On Thu, Oct 22, 2026 at 09:23:51AM -0400, Rodrigo Vivi wrote:
> On Wed, Oct 14, 2026 at 03:09:18PM +0000, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jan Maslak
> > Sent: Sunday, August 16, 2026 11:09 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>; Maslak, Jan <jan.maslak@intel.com>
> > Subject: [PATCH 1/1] tests/intel/xe_exec_capture: Add coredump decode validation subtests
> > > 
> > > Add decode-data and decode-data-large subtests that create dumpable VM
> > > buffers with deterministic contents, hang an engine, and validate the
> > > resulting devcoredump.
> > > 
> > > Decode every ASCII85 blob and verify its decoded size matches the
> > > advertised length. For test-created VM blobs, also verify the decoded
> > > contents. The large variant crosses the kernel coredump chunking
> > > threshold and legacy rendering limit.
> > > 
> > > Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> > 
> > I don't see anything wrong with this patch that warrants immediate attention.
> > I mean, could some of the ASCII decoding and payload/blob parsing code
> > be separated out into a separate lib file?  Sure.  But I don't think that's strictly
> > necessary for this patch.
> > There's also the minor concern of what happens if the devcoredump file is empty,
> > but I'm going to work under the assumption that an empty devcoredump file is
> > impossible (I.E. the file would just not open), and as such adding extra handling
> > for that case is unnecessary.
> > And, of course, it's good that the new tests have already been validated locally.
> > 
> > Of course, I'm not exactly an expert on devcoredump protocol, so I'd recommend
> > getting a second/third opinion on this before merging.  I'm tagging Zhanjun to
> > handle that, but maybe Rodrigo could also help here.
> > I'll give this my RB if they don't have any revision notes.

I only asked to address the compression. Now addressed in the v2.
Please review that.
Feel free to put my acked-by on that version.

Thanks,
Rodrigo.

> 
> it is a good test and it already checks for ram space before running, the
> only blocker is that it is not handling the new zstd compression recently
> merged.
> 
> It needs some refactor and re-test on drm-tip.
> 
> > -Jonathan Cavitt
> > 
> > > ---
> > >  tests/intel/xe_exec_capture.c | 549 +++++++++++++++++++++++++++++++++-
> > >  1 file changed, 548 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
> > > index 6e454cfff3..2d726cabf9 100644
> > > --- a/tests/intel/xe_exec_capture.c
> > > +++ b/tests/intel/xe_exec_capture.c
> > > @@ -17,10 +17,13 @@
> > >  #include <inttypes.h>
> > >  #include <regex.h>
> > >  #include <stdio.h>
> > > +#include <stdlib.h>
> > >  #include <string.h>
> > > +#include <sys/mman.h>
> > >  
> > >  #include "igt.h"
> > >  #include "igt_device.h"
> > > +#include "igt_os.h"
> > >  #include "igt_sriov_device.h"
> > >  #include "igt_sysfs.h"
> > >  #include "lib/igt_syncobj.h"
> > > @@ -82,6 +85,43 @@
> > >  #define INDEX_VM_LENGTH			2
> > >  #define INDEX_VM_SIZE			3
> > >  
> > > +/*
> > > + * Binary sections of the dump are encoded with the kernel's
> > > + * include/linux/ascii85.h: a zero dword becomes a single 'z', every other
> > > + * dword becomes 5 characters in the '!'..'u' range.
> > > + */
> > > +#define ASCII85_ZERO			'z'
> > > +#define ASCII85_MIN			'!'
> > > +#define ASCII85_MAX			'u'
> > > +#define ASCII85_GROUP_LEN		5
> > > +
> > > +#define LENGTH_SUFFIX			"].length:"
> > > +#define DATA_SUFFIX			"].data:"
> > > +#define ERROR_SUFFIX			"].error:"
> > > +#define MAX_BLOB_NAME_LEN		64
> > > +
> > > +#define CAPTURE_SPIN_ADDRESS		0x1a0000ull
> > > +#define CAPTURE_PAYLOAD_ADDRESS		0x100000000ull
> > > +
> > > +/* Largest dump size the kernel could render before it learned to chunk (VLK-71080) */
> > > +#define DEVCOREDUMP_LEGACY_MAX_SIZE	((uint64_t)INT_MAX)
> > > +
> > > +/*
> > > + * The test payloads contain no zero dwords, so their ASCII85 size is exactly
> > > + * 5/4 of their binary size. The decoder still supports zero dwords.
> > > + */
> > > +#define ASCII85_ENCODED_SIZE(bytes)	((bytes) / 4 * 5)
> > > +
> > > +/* Small, but already far past any line-oriented parser */
> > > +#define DECODE_PAYLOAD_SIZE		SZ_2M
> > > +#define DECODE_PAYLOAD_COUNT		2
> > > +
> > > +#define LARGE_PAYLOAD_SIZE		SZ_64M
> > > +/* One extra buffer makes the encoded payload exceed the legacy cap */
> > > +#define LARGE_PAYLOAD_COUNT		\
> > > +	((int)(DEVCOREDUMP_LEGACY_MAX_SIZE / \
> > > +	       ASCII85_ENCODED_SIZE(LARGE_PAYLOAD_SIZE)) + 1)
> > > +
> > >  static u64
> > >  xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
> > >  {
> > > @@ -224,6 +264,323 @@ static bool rm_devcoredump(char *path)
> > >  	return false;
> > >  }
> > >  
> > > +static bool devcoredump_exists(char *path)
> > > +{
> > > +	return access_devcoredump(path, NULL, NULL) != 0;
> > > +}
> > > +
> > > +/**
> > > + * struct payload_bo - A buffer object the test fills with known dword values
> > > + * @handle: GEM handle
> > > + * @addr: GPU virtual address the buffer is bound at, which is also the name the
> > > + *	  dump gives it, i.e. "[<addr>].data:"
> > > + * @size: buffer size in bytes
> > > + * @payload_index: zero-based payload index, used to generate this buffer's
> > > + *		   dword values
> > > + * @seen: set once the dump has been found to carry this buffer intact
> > > + */
> > > +struct payload_bo {
> > > +	uint32_t handle;
> > > +	uint64_t addr;
> > > +	uint64_t size;
> > > +	uint32_t payload_index;
> > > +	bool seen;
> > > +};
> > > +
> > > +/* Keep each payload's dword values distinct and non-zero. */
> > > +#define PAYLOAD_INDEX_STRIDE		0x04000000u
> > > +
> > > +/**
> > > + * payload_dword - Return the expected dword at a payload offset
> > > + * @payload_index: zero-based payload index
> > > + * @dword_index: dword offset in the payload
> > > + *
> > > + * Returns: expected dword value
> > > + */
> > > +static uint32_t payload_dword(uint32_t payload_index, uint64_t dword_index)
> > > +{
> > > +	return (payload_index + 1) * PAYLOAD_INDEX_STRIDE + (uint32_t)dword_index;
> > > +}
> > > +
> > > +/**
> > > + * struct ascii85_decoder - Position within one encoded blob
> > > + * @pos: next character to consume
> > > + * @bad: set once a group is found that no encoder could have produced
> > > + * @truncated: set when the blob ends part way through a group
> > > + */
> > > +struct ascii85_decoder {
> > > +	const char *pos;
> > > +	bool bad;
> > > +	bool truncated;
> > > +};
> > > +
> > > +/**
> > > + * ascii85_next_dword - Decode the next dword of a blob
> > > + * @dec: decoder positioned at the start of a group
> > > + * @out: filled with the decoded value
> > > + *
> > > + * Returns: false at the end of the blob, on the first malformed group or on a
> > > + * group cut short, the last two reported through @dec->bad and @dec->truncated.
> > > + */
> > > +static bool ascii85_next_dword(struct ascii85_decoder *dec, uint32_t *out)
> > > +{
> > > +	uint64_t acc = 0;
> > > +	int i;
> > > +
> > > +	if (!*dec->pos || *dec->pos == '\n')
> > > +		return false;
> > > +
> > > +	/* A zero dword is abbreviated to one character */
> > > +	if (*dec->pos == ASCII85_ZERO) {
> > > +		dec->pos++;
> > > +		*out = 0;
> > > +		return true;
> > > +	}
> > > +
> > > +	/* Otherwise five base-85 digits, most significant first */
> > > +	for (i = 0; i < ASCII85_GROUP_LEN; i++) {
> > > +		if (!dec->pos[i] || dec->pos[i] == '\n') {
> > > +			dec->truncated = true;
> > > +			return false;
> > > +		}
> > > +		if (dec->pos[i] < ASCII85_MIN || dec->pos[i] > ASCII85_MAX) {
> > > +			dec->bad = true;
> > > +			return false;
> > > +		}
> > > +		acc = acc * 85 + (dec->pos[i] - ASCII85_MIN);
> > > +	}
> > > +
> > > +	/* 85^5 exceeds 2^32, so not every group is encodable */
> > > +	if (acc > UINT32_MAX) {
> > > +		dec->bad = true;
> > > +		return false;
> > > +	}
> > > +
> > > +	dec->pos += ASCII85_GROUP_LEN;
> > > +	*out = acc;
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +/**
> > > + * parse_blob_field - Split a "[<name>]<suffix> <value>" devcoredump line
> > > + * @line: line to match, e.g. "[4e4800000].length: 0x4000000"
> > > + * @suffix: LENGTH_SUFFIX, DATA_SUFFIX or ERROR_SUFFIX, matched literally so that
> > > + *	    "].replay_length:" does not look like "].length:"
> > > + * @name: filled with the bracketed name on success
> > > + * @name_size: size of @name
> > > + * @value: set to the first character of the value on success
> > > + *
> > > + * Returns: true when @line carries @suffix, false otherwise.
> > > + */
> > > +static bool
> > > +parse_blob_field(const char *line, const char *suffix, char *name, size_t name_size,
> > > +		 const char **value)
> > > +{
> > > +	const char *open = strchr(line, '[');
> > > +	const char *close;
> > > +	size_t len;
> > > +
> > > +	if (!open)
> > > +		return false;
> > > +
> > > +	open++;
> > > +	close = strchr(open, ']');
> > > +	if (!close || strncmp(close, suffix, strlen(suffix)))
> > > +		return false;
> > > +
> > > +	len = close - open;
> > > +	if (len >= name_size)
> > > +		return false;
> > > +
> > > +	memcpy(name, open, len);
> > > +	name[len] = '\0';
> > > +
> > > +	*value = close + strlen(suffix);
> > > +	while (**value == ' ' || **value == '\t')
> > > +		(*value)++;
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +/**
> > > + * payload_by_name - Find the payload a blob name refers to
> > > + * @name: bracketed blob name, e.g. "4e4800000" or "HWSP"
> > > + * @payloads: buffers the test bound before hanging, or NULL
> > > + * @n_payloads: number of entries in @payloads
> > > + *
> > > + * Returns: the matching payload, or NULL when @name is not one of them. The
> > > + * dump also uses labels such as "HWSP" and "CTB" for driver-owned sections;
> > > + * names that are not entirely hexadecimal never match, which keeps "CTB" from
> > > + * resolving as the address 0xc.
> > > + */
> > > +static struct payload_bo *
> > > +payload_by_name(const char *name, struct payload_bo *payloads, int n_payloads)
> > > +{
> > > +	uint64_t addr;
> > > +	char *end;
> > > +	int i;
> > > +
> > > +	if (!payloads)
> > > +		return NULL;
> > > +
> > > +	addr = strtoull(name, &end, 16);
> > > +	if (end == name || *end)
> > > +		return NULL;
> > > +
> > > +	for (i = 0; i < n_payloads; i++)
> > > +		if (payloads[i].addr == addr)
> > > +			return &payloads[i];
> > > +
> > > +	return NULL;
> > > +}
> > > +
> > > +/**
> > > + * check_blob - Validate one ".length"/".data" pair of a devcoredump
> > > + * @name: bracketed blob name, a hex VMA address for VM state sections
> > > + * @length: byte count advertised by the ".length" line
> > > + * @data: encoded payload of the ".data" line
> > > + * @payloads: buffers the test bound before hanging, or NULL
> > > + * @n_payloads: number of entries in @payloads
> > > + *
> > > + * Asserts that the blob is valid ASCII85 and decodes to exactly @length bytes.
> > > + * Test-created payloads are also checked against their expected contents.
> > > + */
> > > +static void
> > > +check_blob(const char *name, uint64_t length, const char *data,
> > > +	   struct payload_bo *payloads, int n_payloads)
> > > +{
> > > +	struct ascii85_decoder dec = { .pos = data };
> > > +	struct payload_bo *expected_payload;
> > > +	uint64_t expected_dwords = 0;
> > > +	uint64_t dwords = 0;
> > > +	uint32_t val;
> > > +
> > > +	expected_payload = payload_by_name(name, payloads, n_payloads);
> > > +	if (expected_payload) {
> > > +		igt_assert_f(length == expected_payload->size,
> > > +			     "[%s]: .length reports 0x%" PRIx64
> > > +			     " bytes, bound VMA is 0x%" PRIx64 " bytes\n",
> > > +			     name, length, expected_payload->size);
> > > +		expected_dwords = expected_payload->size / sizeof(uint32_t);
> > > +	}
> > > +
> > > +	/*
> > > +	 * Decode every blob for structural validation. Only test-created payloads
> > > +	 * need the additional content comparison.
> > > +	 */
> > > +	while (ascii85_next_dword(&dec, &val)) {
> > > +		if (expected_payload) {
> > > +			igt_assert_f(dwords < expected_dwords,
> > > +				     "[%s]: .data contains more dwords than the bound payload\n",
> > > +				     name);
> > > +			igt_assert_f(val == payload_dword(expected_payload->payload_index,
> > > +							  dwords),
> > > +				     "[%s]: decoded dword %" PRIu64
> > > +				     " differs from the content written to the buffer\n",
> > > +				     name, dwords);
> > > +		}
> > > +		dwords++;
> > > +	}
> > > +
> > > +	igt_assert_f(!dec.truncated,
> > > +		     "[%s]: .data ends mid-ASCII85 group after %" PRIu64 " of %" PRIu64
> > > +		     " dwords, the dump was cut short\n",
> > > +		     name, dwords, length / sizeof(uint32_t));
> > > +
> > > +	igt_assert_f(!dec.bad,
> > > +		     "[%s]: .data is not valid ASCII85 at dword %" PRIu64
> > > +		     " of %" PRIu64 " announced by .length\n",
> > > +		     name, dwords, length / sizeof(uint32_t));
> > > +
> > > +	igt_assert_f(dwords * sizeof(uint32_t) == length,
> > > +		     "[%s]: .length reports 0x%" PRIx64 " bytes but .data decodes to"
> > > +		     " 0x%" PRIx64 " bytes\n",
> > > +		     name, length, dwords * sizeof(uint32_t));
> > > +
> > > +	if (!expected_payload)
> > > +		return;
> > > +
> > > +	expected_payload->seen = true;
> > > +	igt_debug("Cross-validated 0x%" PRIx64 " bytes of VMA [%s]\n", length, name);
> > > +}
> > > +
> > > +/**
> > > + * validate_devcoredump - Check every ASCII85 blob of a devcoredump
> > > + * @path: path of the devcoredump data file
> > > + * @payloads: buffers the test bound before hanging, or NULL
> > > + * @n_payloads: number of entries in @payloads
> > > + *
> > > + * Walks the whole dump, checks each blob's decoded size, and verifies that all
> > > + * test-created payloads are present with the expected contents.
> > > + */
> > > +static void
> > > +validate_devcoredump(const char *path, struct payload_bo *payloads, int n_payloads)
> > > +{
> > > +	char pending_name[MAX_BLOB_NAME_LEN] = {0};
> > > +	char name[MAX_BLOB_NAME_LEN];
> > > +	uint64_t pending_length = 0;
> > > +	bool have_pending = false;
> > > +	bool read_error;
> > > +	size_t line_size = 0;
> > > +	char *line = NULL;
> > > +	const char *value;
> > > +	int n_blobs = 0, read_errno, i;
> > > +	FILE *f;
> > > +
> > > +	f = fopen(path, "r");
> > > +	igt_assert_f(f, "Failed to open %s, errno=%d\n", path, errno);
> > > +
> > > +	/* .data lines can be megabytes long, so let getline() grow the buffer. */
> > > +	while (getline(&line, &line_size, f) > 0) {
> > > +		if (parse_blob_field(line, LENGTH_SUFFIX, name, sizeof(name), &value)) {
> > > +			pending_length = strtoull(value, NULL, 0);
> > > +			memcpy(pending_name, name, strlen(name) + 1);
> > > +			have_pending = true;
> > > +			continue;
> > > +		}
> > > +
> > > +		if (parse_blob_field(line, ERROR_SUFFIX, name, sizeof(name), &value)) {
> > > +			if (have_pending && !strcmp(name, pending_name))
> > > +				have_pending = false;
> > > +
> > > +			igt_assert_f(!payload_by_name(name, payloads, n_payloads),
> > > +				     "[%s]: kernel could not snapshot the buffer: %s",
> > > +				     name, value);
> > > +			continue;
> > > +		}
> > > +
> > > +		if (!parse_blob_field(line, DATA_SUFFIX, name, sizeof(name), &value))
> > > +			continue;
> > > +
> > > +		igt_assert_f(have_pending && !strcmp(name, pending_name),
> > > +			     "[%s].data is not preceded by a matching .length line\n",
> > > +			     name);
> > > +
> > > +		have_pending = false;
> > > +		n_blobs++;
> > > +		check_blob(name, pending_length, value, payloads, n_payloads);
> > > +	}
> > > +
> > > +	read_error = ferror(f);
> > > +	read_errno = read_error ? errno : 0;
> > > +	free(line);
> > > +	fclose(f);
> > > +
> > > +	igt_assert_f(!read_error, "Failed to read %s, errno=%d\n", path, read_errno);
> > > +	igt_assert_f(!have_pending,
> > > +		     "[%s].length has no matching .data or .error line\n",
> > > +		     pending_name);
> > > +
> > > +	igt_assert_f(n_blobs, "No ASCII85 blob found in %s\n", path);
> > > +	igt_debug("Validated %d ASCII85 blobs\n", n_blobs);
> > > +
> > > +	for (i = 0; i < n_payloads; i++)
> > > +		igt_assert_f(payloads[i].seen,
> > > +			     "VMA 0x%" PRIx64 " missing from the devcoredump VM state\n",
> > > +			     payloads[i].addr);
> > > +}
> > > +
> > >  static char
> > >  *get_coredump_item(regex_t *regex, char **lines, const char *tag, int tag_index, int target_index)
> > >  {
> > > @@ -392,6 +749,8 @@ static void test_card(int fd)
> > >  		check_item_u64(&regex, lines, "length:", addr,
> > >  			       addr + BATCH_DW_COUNT * sizeof(u32), INDEX_VALUE, INDEX_KEY);
> > >  
> > > +		validate_devcoredump(path, NULL, 0);
> > > +
> > >  		/* clear devcoredump */
> > >  		rm_devcoredump(path);
> > >  		sleep(1);
> > > @@ -404,10 +763,183 @@ static void test_card(int fd)
> > >  	regfree(&regex);
> > >  }
> > >  
> > > +/**
> > > + * hang_with_payloads - Hang @eci with dumpable buffers of known content
> > > + * @fd: xe device file descriptor
> > > + * @eci: engine to hang
> > > + * @payloads: buffers to create, fill and bind; handles are returned to the
> > > + *	      caller, which owns them
> > > + * @n_payloads: number of entries in @payloads
> > > + *
> > > + * Submits a batch that spins forever, so the job timeout fires and the driver
> > > + * writes a devcoredump. The payloads share the address space of that batch and
> > > + * are bound DUMPABLE, which is what tells the driver to copy their contents
> > > + * into the dump, giving us blobs whose expected bytes are known exactly.
> > > + */
> > > +static void
> > > +hang_with_payloads(int fd, struct drm_xe_engine_class_instance *eci,
> > > +		   struct payload_bo *payloads, int n_payloads)
> > > +{
> > > +	struct drm_xe_sync sync = {
> > > +		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> > > +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > > +	};
> > > +	struct drm_xe_exec exec = {
> > > +		.num_batch_buffer = 1,
> > > +		.num_syncs = 1,
> > > +		.syncs = to_user_pointer(&sync),
> > > +	};
> > > +	struct xe_spin_opts spin_opts = { .addr = CAPTURE_SPIN_ADDRESS };
> > > +	uint64_t spin_size = xe_bb_size(fd, sizeof(struct xe_spin));
> > > +	uint32_t vm = xe_vm_create(fd, 0, 0);
> > > +	uint32_t spin_bo, exec_queue, bind_syncobj, exec_syncobj;
> > > +	struct xe_spin *spin;
> > > +	int i;
> > > +
> > > +	spin_bo = xe_bo_create(fd, vm, spin_size, vram_if_possible(fd, eci->gt_id),
> > > +			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > +	spin = xe_bo_map(fd, spin_bo, spin_size);
> > > +
> > > +	bind_syncobj = syncobj_create(fd, 0);
> > > +	sync.handle = bind_syncobj;
> > > +
> > > +	__xe_vm_bind_assert(fd, vm, 0, spin_bo, 0, CAPTURE_SPIN_ADDRESS, spin_size,
> > > +			    DRM_XE_VM_BIND_OP_MAP, DRM_XE_VM_BIND_FLAG_DUMPABLE,
> > > +			    &sync, 1, 0, 0);
> > > +	igt_assert(syncobj_wait(fd, &bind_syncobj, 1, INT64_MAX, 0, NULL));
> > > +
> > > +	for (i = 0; i < n_payloads; i++) {
> > > +		uint32_t *map;
> > > +		uint64_t j;
> > > +
> > > +		/* Use system memory so the large capture does not require large VRAM. */
> > > +		payloads[i].handle = xe_bo_create(fd, vm, payloads[i].size,
> > > +						  system_memory(fd), 0);
> > > +		map = xe_bo_map(fd, payloads[i].handle, payloads[i].size);
> > > +		for (j = 0; j < payloads[i].size / sizeof(*map); j++)
> > > +			map[j] = payload_dword(payloads[i].payload_index, j);
> > > +		munmap(map, payloads[i].size);
> > > +
> > > +		syncobj_reset(fd, &bind_syncobj, 1);
> > > +		__xe_vm_bind_assert(fd, vm, 0, payloads[i].handle, 0, payloads[i].addr,
> > > +				    payloads[i].size, DRM_XE_VM_BIND_OP_MAP,
> > > +				    DRM_XE_VM_BIND_FLAG_DUMPABLE, &sync, 1, 0, 0);
> > > +		igt_assert(syncobj_wait(fd, &bind_syncobj, 1, INT64_MAX, 0, NULL));
> > > +	}
> > > +
> > > +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> > > +	exec_syncobj = syncobj_create(fd, 0);
> > > +
> > > +	xe_spin_init(spin, &spin_opts);
> > > +
> > > +	sync.handle = exec_syncobj;
> > > +	exec.exec_queue_id = exec_queue;
> > > +	exec.address = CAPTURE_SPIN_ADDRESS;
> > > +	xe_exec(fd, &exec);
> > > +
> > > +	xe_spin_wait_started(spin);
> > > +
> > > +	/* The job timeout resets the queue, which is what creates the dump */
> > > +	igt_assert(syncobj_wait(fd, &exec_syncobj, 1, INT64_MAX, 0, NULL));
> > > +
> > > +	syncobj_destroy(fd, exec_syncobj);
> > > +	syncobj_destroy(fd, bind_syncobj);
> > > +	xe_exec_queue_destroy(fd, exec_queue);
> > > +	munmap(spin, spin_size);
> > > +	gem_close(fd, spin_bo);
> > > +	xe_vm_destroy(fd, vm);
> > > +}
> > > +
> > > +/**
> > > + * SUBTEST: decode-data
> > > + * Description: Create payloads with known contents, hang an engine, and
> > > + * 		verify the resulting coredump's blob lengths and payload
> > > + * 		contents before removing it
> > > + *
> > > + * SUBTEST: decode-data-large
> > > + * Description: Same as decode-data, but with enough data to exercise kernel's
> > > + * 		coredump chunking and the legacy size limit
> > > + */
> > > +static void
> > > +test_capture_payload(int fd, struct drm_xe_engine_class_instance *eci,
> > > +		     int n_payloads, uint64_t payload_size)
> > > +{
> > > +	char path[MAX_SYSFS_PATH_LEN];
> > > +	struct payload_bo *payloads;
> > > +	int i;
> > > +
> > > +	/* Every buffer needs its own slice of the 32-bit value space */
> > > +	igt_assert(payload_size / sizeof(uint32_t) <= PAYLOAD_INDEX_STRIDE &&
> > > +		   n_payloads <= UINT32_MAX / PAYLOAD_INDEX_STRIDE);
> > > +
> > > +	payloads = calloc(n_payloads, sizeof(*payloads));
> > > +	igt_assert(payloads);
> > > +
> > > +	for (i = 0; i < n_payloads; i++) {
> > > +		payloads[i].addr = CAPTURE_PAYLOAD_ADDRESS + i * payload_size;
> > > +		payloads[i].size = payload_size;
> > > +		payloads[i].payload_index = i;
> > > +	}
> > > +
> > > +	get_devcoredump_path(igt_device_get_card_index(fd), path);
> > > +	rm_devcoredump(path);
> > > +
> > > +	/* Wait for the previous coredump to disappear before creating another. */
> > > +	igt_assert_f(igt_wait(!devcoredump_exists(path), 5000, 100),
> > > +		     "Devcoredump not removed, errno=%d.\n", errno);
> > > +
> > > +	hang_with_payloads(fd, eci, payloads, n_payloads);
> > > +
> > > +	/*
> > > +	 * Close our BO handles; the snapshot holds BO references until it copies
> > > +	 * their contents into kernel-owned buffers for the coredump.
> > > +	 */
> > > +	for (i = 0; i < n_payloads; i++)
> > > +		gem_close(fd, payloads[i].handle);
> > > +
> > > +	igt_assert_f(igt_wait(devcoredump_exists(path), 5000, 100),
> > > +		     "Devcoredump not created, a previous dump may still be held\n");
> > > +
> > > +	validate_devcoredump(path, payloads, n_payloads);
> > > +
> > > +	free(payloads);
> > > +
> > > +	rm_devcoredump(path);
> > > +
> > > +	/* Wait for the dump to disappear so its large buffers can be released. */
> > > +	igt_assert_f(igt_wait(!devcoredump_exists(path), 5000, 100),
> > > +		     "Devcoredump not removed, errno=%d.\n", errno);
> > > +}
> > > +
> > > +/**
> > > + * require_capture_memory - Skip unless the machine can hold the whole capture
> > > + * @n_payloads: number of buffers the subtest binds
> > > + * @payload_size: size of each buffer
> > > + *
> > > + * Upper bound on the footprint: the payloads, the snapshot copy the kernel
> > > + * takes of them, the chunk the kernel renders and the longest line getline()
> > > + * has to buffer. Not all of them peak at the same instant. The rendering buffer
> > > + * is sized for the unfixed kernel, which is the one this has to survive.
> > > + */
> > > +static void require_capture_memory(int n_payloads, uint64_t payload_size)
> > > +{
> > > +	uint64_t payload = (uint64_t)n_payloads * payload_size;
> > > +	uint64_t encoded = ASCII85_ENCODED_SIZE(payload);
> > > +	uint64_t rendered = encoded < DEVCOREDUMP_LEGACY_MAX_SIZE ?
> > > +			    encoded : DEVCOREDUMP_LEGACY_MAX_SIZE;
> > > +
> > > +	igt_require_memory(1, 2 * payload + rendered +
> > > +			   ASCII85_ENCODED_SIZE(payload_size), CHECK_RAM);
> > > +}
> > > +
> > >  int igt_main()
> > >  {
> > >  	int xe;
> > > -	struct drm_xe_engine_class_instance *hwe;
> > > +	/*
> > > +	 * The payload tests exercise VM capture and need one engine to trigger it.
> > > +	 * The reset subtest separately iterates over every available engine.
> > > +	 */
> > > +	struct drm_xe_engine_class_instance *hwe, *hang_hwe = NULL;
> > >  	u64 timeouts[DRM_XE_ENGINE_CLASS_VM_BIND] = {0};
> > >  
> > >  	igt_fixture() {
> > > @@ -416,6 +948,8 @@ int igt_main()
> > >  			/* Skip kernel only classes */
> > >  			if (hwe->engine_class >= DRM_XE_ENGINE_CLASS_VM_BIND)
> > >  				continue;
> > > +			if (!hang_hwe)
> > > +				hang_hwe = hwe;
> > >  			/* Skip classes already set */
> > >  			if (timeouts[hwe->engine_class])
> > >  				continue;
> > > @@ -433,6 +967,19 @@ int igt_main()
> > >  	igt_subtest("reset")
> > >  		test_card(xe);
> > >  
> > > +	igt_subtest("decode-data") {
> > > +		igt_require(hang_hwe);
> > > +		test_capture_payload(xe, hang_hwe, DECODE_PAYLOAD_COUNT,
> > > +				     DECODE_PAYLOAD_SIZE);
> > > +	}
> > > +
> > > +	igt_subtest("decode-data-large") {
> > > +		igt_require(hang_hwe);
> > > +		require_capture_memory(LARGE_PAYLOAD_COUNT, LARGE_PAYLOAD_SIZE);
> > > +		test_capture_payload(xe, hang_hwe, LARGE_PAYLOAD_COUNT,
> > > +				     LARGE_PAYLOAD_SIZE);
> > > +	}
> > > +
> > >  	igt_fixture() {
> > >  		xe_for_each_engine(xe, hwe) {
> > >  			u64 store, timeout;
> > > -- 
> > > 2.43.0
> > > 
> > > 
