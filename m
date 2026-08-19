Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB065C5B572
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 20:50:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B54310E183;
	Wed, 19 Aug 2026 20:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jecNJvxD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EA710E183
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 20:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787172613; x=1818708613;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h1vT7/qH4j42EeGCaz3DokpG0wpqyHu4h3oCvI61sVk=;
 b=jecNJvxDleQXqxaZ/MqeoKcuhiDHIqM3JZ1Pu2m2kCW3aS2UdwqunIgH
 dUhufxXP+QKE19yHTzNcRTJO4fGJ9wm2rVtseNZ7rSnKKUzydsedxyQSB
 AvpmhegFH8s9ng2Vpkz2iJsEu+yxVzFgnlraLLeKTMWyI4I8DobCok8P8
 7UnygzhqBa1dNXN859ozoF8UEziAbGOj4tpEmRsERMhOpZp3gXPH5NZRn
 aiUYI+jI+3Gw2z5hGmbcRzELNLmFR8Is/z8bZJKqM591SEfQGmLNcuzz6
 ByrgU4qFEztsnWlS2xt8Uar9/3FoCRQZCYV0DFlwBAaf62vHStdGXZaSX w==;
X-CSE-ConnectionGUID: 20Bwh8XlQJ6NmCq/UbAUTA==
X-CSE-MsgGUID: kNwfnsWoRbK2SSTxKHArqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87619848"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="87619848"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 13:50:13 -0700
X-CSE-ConnectionGUID: ci6weRDKRwSuRPB5HhTIiw==
X-CSE-MsgGUID: hqcuz21ySNiT6Qo7/ERgrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="262402220"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 13:50:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 13:50:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 13:50:07 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.19) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 13:50:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHDH6XmoBjA15sXBZSWi8fPKqiyCQ3FM3XqIWCnvdt03bSBOEWC9MtGoKwKporKp85oTTwc+gWcd4F9P26UL3/BK7UWraf0q8H/77E9w/blNsKHzzQPZm2fsksLYB7MffZ1Az7YOCCLKj/15HMzNhaUTc3lj4fRx7svYnU7yNRHxSM2UxXh3gtgzQ5x41aqhYGwbxhj67klIQRrjbX2TgdapPbJNKxDV2eraUS1tHuhcfPdjtdOounuVaMUFIUvwilBxjvVUpDQQlA6ROAAO9mA9kTL8Oy5IG6QxoR+jZnbISIn0GWeiQyr0Gx0wiida6/XfThvPoiwPIsI52w52xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSk3Q8OLv9fqCzllt4MO/2zdDU1c04nYDUIv/dFSiUA=;
 b=a363SArGphahXm08mvPm9CVt1yAlOzWpPndaFzZ3luztHb1UgOc3w3fhcoKKm9HvmpjS3RiajgvOMmJCIJrp6qvr9JJ9nlboPnh39taDt1nYdQRqEVcYlph6UhHgGEE9vtB9HsEGIALJWXM1RXq0x4GMJK6LNq7T/v/TlLf5b2olhRT1HIzvjZMMITOF4sx0Jq6+jOmvZKCvFslmZHWyw6Nir06LMeUh6EGNFtpcJlzfPS4r27wKIR0russ5TIF7oFQsE0nGTFgDAU/k2mznxoIagVo1UG25HRS/ktwiWUK1JKk/TM/v+xWypvDrYuX7vwhSTFRR9NkVK7e3cpzvkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6857.namprd11.prod.outlook.com (2603:10b6:510:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Wed, 19 Aug
 2026 20:50:02 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 20:50:02 +0000
Date: Wed, 19 Aug 2026 13:50:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t 05/10] lib/xe: Return boolean from xe_wa()
Message-ID: <20260819205000.GQ8279@mdroper-desk1.amr.corp.intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-5-0c147eeefefa@intel.com>
 <20260729221424.GE7790@mdroper-desk1.amr.corp.intel.com>
 <87tsorb8t9.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87tsorb8t9.fsf@intel.com>
X-ClientProxiedBy: SJ0PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e4e304c-25c8-4391-66b0-08defe3370a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|22082099003|56012099006|18002099003|6133799003|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: rSn0BE9YsM2J/v8866Vcp6uNYdF1tuwT2W/6jXZCH/EXuU/RNiMmCANn8t92R+hbSJC3zwNsSD6UZYtKMY4swROJlGXbqeeJ9aUajeZMW6DjRE+20mQKaEePFRcYothtXNJ9znh+feifu56GZi/ThLC68r6oOI6L1J8qKyeL757ajLGr+5n3tSRqMx49sB7hMzhzKSRNS1MLM6HSf22NVfDJi/Tha5mfU85DP5TTmB7O9WDayPs97t4taayWjFPFpJNYycehcgXke3KJVpg1jMD3MepjB6TyOWprhmEWe1v3SuZx+ILf9mpDqOkNEKzuE2ya8G3X6lT8cxZxNiKtCSGD6VePbiI5IUsUc6Y3nsdZBAQoYpFSGvV7l4/T7iYloPR9d6Jd3Q60j5OWMEBDNFL41+Kwbig51AzgI/p6GiJXtwQTuDYlJX4LNUKtIlSr4KNTFQcX93vhmHUHdESmyqHCXo0SXV5FtLOY7kAmn3qLmRFuLZ7hEcIzXh22+g4g4qoiv3XG2fOlja3jstvHPSA9uMtQl2Et8OcvYPbm9Nc+24G/Jisfk9KVlSMvdWYTdQttznHv6CoPCrJfcxTsNOVKvNNA+EEbW6E429Jx2CmuwhdkLdjUZevv1vve5Ios5a+PKf9s+754q9hxN+0KVIE0Px93gv2Z98bgGfxRaGw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(56012099006)(18002099003)(6133799003)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2q83BTL/cv6BkpiYMqsds2ISNEATx99Sog2IH433ehltPdehLSMCsG7F2c6W?=
 =?us-ascii?Q?LkBhvTnovI0u/EY+OVE5DosSMzliiNsieLSqvZNAV9gPhXbrfA1vC31Plsq/?=
 =?us-ascii?Q?t2CR27a1Qtt++qbn75USZawsWNFaUmrDgmqZ9UePhiET5cmNnam59LAWA9n6?=
 =?us-ascii?Q?jI+A5/j3023RBriP0JZylg1Fna3F182D/Mu7OsZi2yBrbv+VclhhicCL9S96?=
 =?us-ascii?Q?W7KIlooREbgDfl5aVhehkd0wEbhu14ElLwJ8JkSl4Lg0GOKA7rRaYJ3GNHj+?=
 =?us-ascii?Q?kh/CX156eqV+gCxzJIx10tzrQZscqy7RHp4CbQ3SHSTJxFnTmU2tIX6q6HmD?=
 =?us-ascii?Q?PBx04St8ExWkk1mKTybKEcrPiwiY48P+dzzkx++bgaK836jMylNGYADZ4mfV?=
 =?us-ascii?Q?1C+LsWxcZQPK8GuccW6Bdq4EFN9CANyh/SrwMcPF+FYgj2tts/ElAsR7sojT?=
 =?us-ascii?Q?W22J9ptIxpp9RA+F64rDe3N2V0bpDBip/fyW6JfiTN59zcP8NSX/UtUAAweI?=
 =?us-ascii?Q?xORN6H/uAGUu2tedqzclRQmptrKBgYDsFZZeZBFoj2Nh1e+KoQsKRE2u3AMu?=
 =?us-ascii?Q?gwxmQjEwU7ma918zE6IVb6b13xDgvzHfZH+yOjCE/qfQvBCAtqRruigo9rzf?=
 =?us-ascii?Q?IGdySYYGSVngfN8SJ0vDOZ2+1rylnq9IgLYKXbMZNzM/F/++PBlqMdekACxL?=
 =?us-ascii?Q?z2n9ApuRuMw/mKPoSUQHPzImtUlfgqp09E0wBgPVOnzNPTDDrjAQP+TsULBj?=
 =?us-ascii?Q?wYXWc46hYY5BvZ65JzRNHYfRGo8hJnsi/znNbpLB77eiWNj0iENpgQblPJz1?=
 =?us-ascii?Q?dNWt/AYlhnhepFTbWMtgzvQoJ2QELMNl67acVZfM9adzb8UVfPQVhekG6xTx?=
 =?us-ascii?Q?HdH2Ce39mnf2uAYx1yoeNISG4OexRlc1SPE1pc88N0YxhWFc2dmHobvNUinf?=
 =?us-ascii?Q?n6pXAyWjuswQZS7aZxUoQgEe4ssJGGudlgm8OuEfVqkpRSR1krF00qgVJPi3?=
 =?us-ascii?Q?LLMHTXqgAVYMBPgHZSefxXUQqx0dUYAejU8HZy/DqWG37+W9zehwhO5PJA+B?=
 =?us-ascii?Q?BdISo3xrxqYzJA9wlKUoeydn96qxnkJBEk01PcDSyf64q4+vPAOYIqQTEoY4?=
 =?us-ascii?Q?rqkEf/Kah7V3NDPJTg/A5IC1JM8IdzWNlAg4uYD9xkcuC84oXgauop52Kwvg?=
 =?us-ascii?Q?tKQCuOiuSTaTMbGCnZI5ZNRJeYEhy4tRgDeXCoYM+QS9tNaysLOlxRc6dSO9?=
 =?us-ascii?Q?Pua4Rj/Ut808Dv1Jpzy4tKzCOAygHcbigb7aAsfP5+ba45rIFEr8YZcdZcW9?=
 =?us-ascii?Q?YPzmKTaRRrm+/xTH0uneP+WZJKzIf0dGbsLwbLfrF3slV6r+tHEYDGOOttQq?=
 =?us-ascii?Q?rETxe7uwg7IxAufLEjBfmZi2TL9t73LyrqZF1wiiIeXLh8Li2puPpZQRR9EU?=
 =?us-ascii?Q?CMFbn0RWcONRu1BtNoijGDXXH3xmlxw03aoWCP8y73Dxff8MUlWlb0HR9t1O?=
 =?us-ascii?Q?dEJv8QrtqAoUHbyGKhF5pCojPKgUavV+vwaijteU9C5FXl8EO1pgst7dJKcn?=
 =?us-ascii?Q?ypf6b0Z1TjlwhJcgcLr41X3OtU3jIbLx51PgtsTyq9J1yheWZS1gD+lF9E8K?=
 =?us-ascii?Q?KVmAtGm4k+4CE7QJbdsV33xSFbSzrZ3GD/RLpEKie2Le0eLsQMrMNmYSVOws?=
 =?us-ascii?Q?5QUkgfBOFWJS23M7Vq4+vFYIYlxslIhBkDPWhwiXd3/h6Al22lKb+fhUS293?=
 =?us-ascii?Q?1vV7rORxYaEXW627LPFskn4di9xECdg=3D?=
X-Exchange-RoutingPolicyChecked: e185VGqb4BsDlkxOIYik++cfTELdC1fhRpCUxpy4kjb6zutks2JT7ejMSAPoc7Bca6YC6uGVBBct4qCOml3g+2h2Iz5kTAq6OoddxKjmsno9vmRUzOx/zk/OtjXIn050LmqM9YrZ1PZmQYZGnfETxPnW3RJ9YLN5RDPvleMWVipcSwtciS+q//3p2Q6G7d0EPPoZlRpx9EB/xrQPwEDljH4/HhsOZEntjFcEhVnv7lI7wtt3WWhVsKoWf+RXsJX88atIafRVDA1BQmtxAgblOl9+HEefhF8i6BB9CvLnxWbTR7AfkHmFWeDquZ/Jqx7aqKW3JiLghoFlhKhhhidIfw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4e304c-25c8-4391-66b0-08defe3370a1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 20:50:02.1470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NfOkEI7d9Cgjm/fNZhTXsQkLfYfV1Tm5RHOdH+5NRH6ea8B+PdcjhTgZWR+8eSJrDlTm0NBiN1yY4X4zdLG4zVA2YL5LJS9XRby5aXQGW5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6857
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

On Tue, Aug 18, 2026 at 03:08:34PM -0300, Gustavo Sousa wrote:
> Matt Roper <matthew.d.roper@intel.com> writes:
> 
> > On Tue, Jul 21, 2026 at 03:59:58PM -0300, Gustavo Sousa wrote:
> >> The function xe_wa() will cause a warning to be printed when an error
> >> condition is found.  Since the current users of xe_wa() do not check
> >> for errors, let's just convert the function to return a boolean.
> >> 
> >> Checking for xe_wa(...) instead of xe_wa(...) > 0 feels more natural.
> >> 
> >> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >> ---
> >>  lib/xe/xe_wa.c      | 11 ++++++-----
> >>  lib/xe/xe_wa.h      |  4 +++-
> >>  tests/intel/xe_oa.c |  2 +-
> >>  3 files changed, 10 insertions(+), 7 deletions(-)
> >> 
> >> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
> >> index 0f4d2edc0795..8c8f7156c21f 100644
> >> --- a/lib/xe/xe_wa.c
> >> +++ b/lib/xe/xe_wa.c
> >> @@ -108,20 +108,21 @@ static bool debugfs_dump_has_wa(char *dump, const char *wa)
> >>   * @fd: A drm file descriptor.
> >>   * @wa: Name of the workaround to be checked.
> >>   *
> >> - * Returns 1 if enabled, 0 if disabled, -1 on error.
> >> + * Return a boolean indicating whether the workaround is enabled.
> >> + * On error, returns false and a warning is printed.
> >>   */
> >> -int xe_wa(int fd, const char *wa)
> >> +bool xe_wa(int fd, const char *wa)
> >>  {
> >>  	char **dumps = xe_device_get(fd)->wa_cache;
> >>  
> >>  	if (igt_warn_on(!dumps))
> >> -		return -1;
> >> +		return false;
> >
> > Should we use an igt_assert() so that failures here get propagated up as
> > test failures?
> 
> I'm not sure.  In the past I advocated for stuff under lib/ to avoid
> causing asserts and leave that for real test code...
> 
> Cc'ing Ashutosh here, since he was involved in that discussion.
> 
> Do we have strong reasons to do an igt_assert() here?
> 
> A workaround like Wa_14026539277 will be checked in many tests and the
> assert failure will cause disruptions on many unrelated platforms.

If we're not able to accurately determine the workaround list, then any
test which is calling xe_wa() to check workarounds has effectively
become unreliable and we can't trust that it's giving accurate results
anymore.  That would mean we have general IGT infrastructure breakage
that needs to be resolved before we can trust the results of those
tests.

It would be nice if there was a cleaner way to differentiate IGT's
library-internal assertions from regular test result failures, but from
grep'ing the current codebase, the use of igt_assert in lib/ seems to be
the common way to handle this.


Matt

> 
> --
> Gustavo Sousa
> 
> >
> >
> > Matt
> >
> >>  
> >>  	for (char **dump = dumps; *dump; dump++)
> >>  		if (debugfs_dump_has_wa(*dump, wa))
> >> -			return 1;
> >> +			return true;
> >>  
> >> -	return 0;
> >> +	return false;
> >>  }
> >>  
> >>  /**
> >> diff --git a/lib/xe/xe_wa.h b/lib/xe/xe_wa.h
> >> index f0a826553df8..aa1c50c0f9c9 100644
> >> --- a/lib/xe/xe_wa.h
> >> +++ b/lib/xe/xe_wa.h
> >> @@ -6,9 +6,11 @@
> >>  #ifndef XE_WA_H
> >>  #define XE_WA_H
> >>  
> >> +#include <stdbool.h>
> >> +
> >>  struct xe_device;
> >>  
> >> -int xe_wa(int fd, const char *wa);
> >> +bool xe_wa(int fd, const char *wa);
> >>  
> >>  void xe_wa_build_cache(struct xe_device *xe_dev);
> >>  void xe_wa_free_cache(struct xe_device *xe_dev);
> >> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> >> index fcf1d71a167f..bdaa7141004b 100644
> >> --- a/tests/intel/xe_oa.c
> >> +++ b/tests/intel/xe_oa.c
> >> @@ -2678,7 +2678,7 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
> >>  	 * can result in buffer overflows.
> >>  	 */
> >>  	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT &&
> >> -	    xe_wa(drm_fd, "14026633728") > 0) {
> >> +	    xe_wa(drm_fd, "14026633728")) {
> >>  		oa_exponent = max(oa_exponent, 8);
> >>  		properties[9] = oa_exponent;
> >>  	}
> >> 
> >> -- 
> >> 2.55.0
> >> 
> >
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
