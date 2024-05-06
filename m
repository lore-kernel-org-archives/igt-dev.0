Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB399C25B4F
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 16:48:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD2D10E665;
	Mon,  6 May 2024 16:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cuJgkh+r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A4C10E665
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 16:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715014097; x=1746550097;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CFODOsKKnIUsFZNw5ofzB0u2nB2e9KuBjboRVtgvL0E=;
 b=cuJgkh+rFMWboxY6B/4VaMn+JUQJJVUBr+mK8pBGutyp7THV3WOV9qpD
 z2uWDU82ANxmfBaK34SOwqSFpo2A+og6T/A2Y3sderxNtosYfWVGG2dBX
 6mfxdbR/vaXM4Iwm7bLY6w7havtblflAzHRmNUk1hvFOysD3xi/Betf+B
 7rfJ53JKaHko5eL4TDQQ4iVaoT8JONKQloLPqVrrD9CysYuvMny9/ujA0
 x78fu7ONWmjaWaCh9t73cybRVgnglmT/CUTJmhW/iJ9C8uhTp2pxBTs3e
 4oeezsS+IGTk8rreBULTVugJrEiMyRYnbxahb14ldhHx5aPKCqcz7XCY1 Q==;
X-CSE-ConnectionGUID: XFXUrlOzRdaOCxIpK6azvA==
X-CSE-MsgGUID: aAv94RgXRrae8lOjh3A48w==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="13720246"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="13720246"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 09:48:17 -0700
X-CSE-ConnectionGUID: ZVvJWNEkT1yp6IPZ/Wm8GA==
X-CSE-MsgGUID: nQ/6dksESd+v3LedIzZhVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="32887226"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 09:48:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 09:48:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 09:48:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 09:48:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDZr8EcZuM0s4lRQVYmeedjj64IBReEymV/9YV0UjpRsZZpa5qp3aHUKjzPpiRpGgMBTIDASCrBLBswsgc411EIuAx7cbTclm+mXJqmsfltQ+ainDvPJgCwvqZKgGhzd2t5cAmVEcOyEv8eeugFscb4TMO3xBkkaoMN2QI0sMKHNWXg005tR4pOP01x2mgUGEeJHO132I9l0WMoNvSpesqknmOm22JY2zA6FDgOy/bhZS7nBPdI9A7BWkuat/DQuco93PPeNhK2vCzvXKU1liQrT9WLfbjAKxHwq0RzHaPczabmJ3FAnPuxwLlOmX+wHoB5w3YJosH4TG8OYtfkfcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3R2jkJvf4lSt1vLClhgn1sU9j54h1nLApUhIm8iw9U=;
 b=JvkU1kHVWhAEr8hQbnFEIxF4XngilME7WyS2v+GY+4seeLL4ItZz6bEVR6xtBJwMEfGaYpvObAXMgG4m89j8vN5GFJCBcJCKIlR9x6DN4EIWPQM0rcsjg96IhjiWbet8i1Lbc3ztGNCeb4cKNvQTIq/YiXswUCAPN0BxwK9EHbVZ60dF2mtnpJgIPJ0ZC2+Ur6vSFo1mHWGHfnTMwskcJleV++ANB/cZ+eVjyeGMjCPtog02f7U76lTHgHERDKyIQ3GYqoW/xbc6m2oPWwSDzpKmINrcKJveVhjbdErKPACRoBWYj4jbI2CR3v3VZJDPml2pOmSEcnm4ufXUs3o1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 16:48:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 16:48:08 +0000
Date: Mon, 6 May 2024 11:48:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_pm: S4 to go up to devices only
Message-ID: <djmvfdz5wofwusozqmvrbayttiarvt2le7jjy7lm762gdn5rf2@75uw3f2763ws>
References: <20240503224745.14890-1-lucas.demarchi@intel.com>
 <20240503224745.14890-3-lucas.demarchi@intel.com>
 <ZjjlykhAz7LIFpLX@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZjjlykhAz7LIFpLX@intel.com>
X-ClientProxiedBy: MW4PR03CA0152.namprd03.prod.outlook.com
 (2603:10b6:303:8d::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: 7285c4dd-4527-4637-2bb8-08dc6dec4ebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?slFALntxh5cVGBtbU+kGilzk7dCYq7jY3PPgiSsnfa3OPMyWwoi2NYSVi2MG?=
 =?us-ascii?Q?rqZpCMPDU8mWpi9A82O2pWzEUZMCKZDeSB8ENQvE4KkVPXpczDPWaKYXW13d?=
 =?us-ascii?Q?X4aJN4WAOoJZiF7a652U+Ik2EOW8wa/OuLdVgT0DZGbgFTT8EHwuFQfbHAz7?=
 =?us-ascii?Q?WIKT5L9t9ebiG2W6+Lj89uLNyguq9Wb7YsuRHeaEL/WP5hmPYbeJMtSDTubv?=
 =?us-ascii?Q?26MdbmjCizKGdV/HfGmoMwTEMFxR1p2cY2LV94S5BzMi6oREBrfq6c8JUi/A?=
 =?us-ascii?Q?5ZBbO+H6yRmz5xJRjGQadUkwWVs2PYLLmNJYWucsO5CKmfz5EpAM5Kzsmbfe?=
 =?us-ascii?Q?xYjiCXWmut+IgiO1jbpz8bL9yT8yOXhTX3Yv3SrbDj6Jf5R7jF/S/iynSJNM?=
 =?us-ascii?Q?K155a8Kiqg6rR0UCSgpQiq78zgvoQoDemUOwpeCk9osqPgZvXszNoEt0/UjU?=
 =?us-ascii?Q?KrqcIFlsme7lMkVzCEodf9pXTqHVsdOm4Hn2f/wq+ak/Oq/AF45Esridqj7t?=
 =?us-ascii?Q?lBgLHOxX1eQXhVCJ8Tu02apQL52S7Mq+qSRXWRge/GN64Vscb0kMQBX1weCy?=
 =?us-ascii?Q?KA2NSx5FKyd/bQY9xO6H3CaotGZ7eZyoO9j50GNuZoVjwPRAnF/DiUhLxEjZ?=
 =?us-ascii?Q?+5apFiZIteR8Wiyfn1AKZoZfY7ICVnJ8jkwr/yj5mgIG368RCccBtC2qdyJD?=
 =?us-ascii?Q?g/uylJ+SgBeuXajX3UOaSCDOcvD74M4yF1Vtu6SSbS8SImuVWZsT08jYJ/Ob?=
 =?us-ascii?Q?zZNRVSeNCl3M7R8kK0nR3rUmcJz0pMCyvh4+E3PT46XdxvQUqvmzYneJ1Ac1?=
 =?us-ascii?Q?MXeXfqcd3fB3aIKTvH11zIriRfkLRNBN9Oi1ib3eDB8mAjdTVo6SNo7T+/gV?=
 =?us-ascii?Q?ryC5qsqD14acvlw1CqcaZkVlJBa9uTRPcPf59ZpkK5SJWXRW5nQVqv8PD8Qt?=
 =?us-ascii?Q?wtD1LYCxTkM5+UOZzx5zDVnHu4SBMnIf7AiBUZ0bxuQYsdoiC362hl5eSj5y?=
 =?us-ascii?Q?JKvwdZH8nN2E0hG7PNP/A2opMdJZdIIZhJxh7h/zE41mJnJeaFA53Bmp0e01?=
 =?us-ascii?Q?G871aFaBVyOVpkitpqhUYa8TSiXeaSG6/QM9ia6Yt/bo9UIYxg8mZVY8whAH?=
 =?us-ascii?Q?aWHTlFGX9Ljeh9E6eW96zL8kGE/HkbOwOGCrrpjovrwz4dZEu6slI2oi31D/?=
 =?us-ascii?Q?e8N12WSB5N4inUkz9NPYacZWpOnncxGKFmiJLVuK8lAJUCbRM1ZfGD1u32w?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z8uzDVb5QBOHwZEaLgrJRxRoebwp/32PyJnVEA+SAbzaBXPQR41Zg3vGxird?=
 =?us-ascii?Q?rD9+Rjj7b0AnhdHN9GJDqw0+4Q3RMhrVt1aCb0PQue2n5YmVmqcW1LftfPyr?=
 =?us-ascii?Q?+0qYqHL5omrD0ccPmEfDQ5sqz/rzpMJ8n/0nzNjTr8m4W1UX9T4S3+/5jxHb?=
 =?us-ascii?Q?XN6c5xg5tS3ijxFUD6s5Qb8OLLXWQajkhsn/KItTQOjjHsAaVPHQct1S+vB1?=
 =?us-ascii?Q?HZ2MBzRbxhRG8g9hNcB468j2+K6lBbjpEfjEeW113MDWWG5GHc1MHeYW3T8C?=
 =?us-ascii?Q?GgXKQFC6Ee+209YqdpV8+Lwd5BgDFdrVOKfJMqsGb1DLOn+62xhksWF8h563?=
 =?us-ascii?Q?8dtZTO9TpG0wDyhHJFASrsYbSeImflZ84Gwvw9vF8XZ8of5ZbFAmQgrLdxv+?=
 =?us-ascii?Q?7j3sGw84+52XKzPW7LOzEyGxyonZzRLM6rF8cJnyC7itmSCl49AysB5h1uNO?=
 =?us-ascii?Q?tQqNqA1aPMkFi9XZs8V7Ds/kUbPkPyjvF9aRYO8i415uNBRkOX2Fbo6jCcze?=
 =?us-ascii?Q?FtUl01bhoMeAcjOqWzxZXFj4R/cmeg4rmCbijUnTh9ai+WhWCoiaK+vB/ebq?=
 =?us-ascii?Q?y1cL4IbX73sV7vTD8mM+nHN5vrcIf7qT32coZAvTzCevqQyYQ6+DLv9sZu2i?=
 =?us-ascii?Q?Ci9HKmQCrSB+1ot01WKX/Df8RjYBNziXNj+g0eoViaZow1O5Z6IIn2at4i3h?=
 =?us-ascii?Q?DShh428SxMVhEhdrb7lWQZvYm7L7gTxDURso69pAMgFzihaVMSeBLXxkdYoZ?=
 =?us-ascii?Q?+FxtdSaZ3fOMM5vb64rRd2jt9YXSoYx6YDg8X+yhEqzNKtEUKZw5vd2Mvln6?=
 =?us-ascii?Q?cWawDcWIOZnATqE1zxReL7FPGrEeImbEMO0atFGFDdikFPeEo1MeAorHsYye?=
 =?us-ascii?Q?pQG5dq3kFdk4dRcyMDlMT3xseIEMy6V+dvU09a12Im8BOqlwSH0vI/NLAQRh?=
 =?us-ascii?Q?a8KDhUAnwXmKaCbgqZVAqOGUu8oRW+36rTes5jrZe/p9eBq1dy6ErDEqYzLs?=
 =?us-ascii?Q?goG6ZJ4BkEvYRh3J5++dFaR1E2vbH1bnd96uAllu++tmnJt8bKUX5nww1fLe?=
 =?us-ascii?Q?hyJQBUiic7afK7x7jPbk6AF7oiZVILeOq/vEuIRTJw6zCuPl+/mDJS+cT7UV?=
 =?us-ascii?Q?BQrSTtkKLDYl2yTwOH2o1U3ZzlebHUZa4F4FZE0jetCM+1zRLxR3oGdi8oxA?=
 =?us-ascii?Q?KFr1TdYFVnglw4YABxnYtnxkhR/Q7pmQN+do0zbXCjEAyIlf7uHuFaxhWQqx?=
 =?us-ascii?Q?mUzWHSJOrZuyl09PYnJvkXXzj4n/SGEZiJ5gDOFf+NuaU3R4u9iJfp1YREjX?=
 =?us-ascii?Q?/FufZMp3lgTGbDRDwvuGNzMVITihc7Q6eFnMEL6VFBtbF7GKgprY3M+SUiGI?=
 =?us-ascii?Q?Wgb6EwyNfnzADB7md4uDOeWuM51Krm4ThdhWqaEdDXkRyQvu6m2ghDJiby77?=
 =?us-ascii?Q?bBr/28VJOwR7tKSX0IJllOM0ShSMJoyERYPHHTuQEbibALN3Rq8yGR4+rnbf?=
 =?us-ascii?Q?L9rc94TpUtAQakaMTKZJglUYYfsxuiCMTVaebMmU2UOa6DoIZCDSJjrW/9Cu?=
 =?us-ascii?Q?Pp5eDfIbczTTwjJy3lefjzSnGRmVG2j8WwtDKEjQNRpckLNosfZBDeCFubYv?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7285c4dd-4527-4637-2bb8-08dc6dec4ebc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 16:48:08.2040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZn2XYtxB+mLTk4r1Mo1YO+NQPxmhQS0k+og8QPcOUVC56gBwuU1AMKY5rfokLvVoQwrNg6TzvFMOZqgZaFynTe9unU0VwrYrH7f9bqt1G0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7183
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

On Mon, May 06, 2024 at 10:14:34AM GMT, Rodrigo Vivi wrote:
>On Fri, May 03, 2024 at 03:47:45PM -0700, Lucas De Marchi wrote:
>> Testing S4 (hibernation) is typically painful as there's mixed support
>> in OS versions and platforms in CI. Doing the entire dance of saving the
>> image to swap (which sometimes is a swapfile) and communicate that to
>> the kernel that is going to be booted (without initrd in the CI case) is
>> often a case of problems.
>>
>> Main goal of xe_pm is to test if the xe driver and the graphics card are
>> working correctly, not that all the farm of machines correctly handle
>> all the corner cases (which is even more problematic as we test early
>> rc kernels).
>>
>> Stop doing that and rather switch to going up to device shutdown +
>> platform low power state (the default in /sys/power/disk). If that is
>> acceptable and work out great, we may even do that unconditionally,
>> passing SUSPEND_TEST_DEVICES as it should work in other cases too.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1043
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  tests/intel/xe_pm.c | 21 ++++++++++++++-------
>>  1 file changed, 14 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>> index 5e79e80ec..9a0b362ab 100644
>> --- a/tests/intel/xe_pm.c
>> +++ b/tests/intel/xe_pm.c
>> @@ -414,9 +414,12 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>>  					INT64_MAX, 0, NULL));
>>  		igt_assert_eq(data[i].data, 0xc0ffee);
>>
>> -		if (i == n_execs / 2 && s_state != NO_SUSPEND)
>> -			igt_system_suspend_autoresume(s_state,
>> -						      SUSPEND_TEST_NONE);
>> +		if (i == n_execs / 2 && s_state != NO_SUSPEND) {
>> +			enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
>> +				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
>> +
>> +			igt_system_suspend_autoresume(s_state, test);
>> +		}
>>  	}
>>
>>  	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
>> @@ -662,8 +665,10 @@ igt_main
>>
>>  	for (const struct s_state *s = s_states; s->name; s++) {
>>  		igt_subtest_f("%s-basic", s->name) {
>> -			igt_system_suspend_autoresume(s->state,
>> -						      SUSPEND_TEST_NONE);
>> +			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
>> +				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
>> +
>> +			igt_system_suspend_autoresume(s->state, test);
>>  		}
>>
>>  		igt_subtest_f("%s-basic-exec", s->name) {
>> @@ -673,8 +678,10 @@ igt_main
>>  		}
>>
>>  		igt_subtest_f("%s-exec-after", s->name) {
>> -			igt_system_suspend_autoresume(s->state,
>> -						      SUSPEND_TEST_NONE);
>> +			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
>> +				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
>
>perhaps a helper function for this long repeated line?
>
>but up to you...

I didn't bother because I think we may actually go the other direction,
unconditionally passing SUSPEND_TEST_DEVICES regardless of S state.

>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

thanks
Lucas De Marchi

>
>> +
>> +			igt_system_suspend_autoresume(s->state, test);
>>  			xe_for_each_engine(device.fd_xe, hwe)
>>  				test_exec(device, hwe, 1, 2, NO_SUSPEND,
>>  					  NO_RPM, 0);
>> --
>> 2.43.0
>>
