Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F47DC9830B
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 17:14:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBADC10ED47;
	Wed, 23 Sep 2026 17:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZMaG9Pi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF1910ED47
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 17:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790183628; x=1821719628;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2zOp3flHfWhMjI1fWahbt9Ij4pr9YJrEF8akaDTGDBg=;
 b=fZMaG9Pig2iAH2ytA9Kwa81QIy+xZ3WgohqR+nSpBq185BiKkf1D0XTG
 KsitblPE2BCbM2IlopyPOhNIv6WtEDQfLxx1i0KXmdjwOmyEq91PbndJR
 R8MU7AgYf3ZlFsbrjF54dj4iw5U3bSf24jtMyIxMzgawcxHBRsmHCInee
 YYQMCAwgL4OlEg5MGhO8ADQthxyY1yr5yOK710fJICyASGaXNs3pLcbi2
 7WkAcxOL8z1uwIv6zTJe79BqjM9VDmon8reyHoMGRqKF1HnYnF5oK40/N
 NFgmSYzmrWs1KRgTzzrejo7Z0XKgksdJq3TFW4ThL1zOvnocJhVA97clm Q==;
X-CSE-ConnectionGUID: kR0E7mLZRiuvRpARjfUbbg==
X-CSE-MsgGUID: Hbzv0xqQRPepxAQk0EOS0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91017490"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="91017490"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 10:13:48 -0700
X-CSE-ConnectionGUID: ZXU81MSdTY2/s4z3yxuQKQ==
X-CSE-MsgGUID: u5s6WKiCRXGDNs0z9hju/A==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 10:13:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 10:13:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 10:13:47 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 10:13:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=teLf3wn19KphIJ/3yjgbQ6QExJQJFdDSY5r9CjvwC2s5zn9V9oAjUJwEuq3g3DKXpEx/1f/IeTTR7uNKD5WWDL3bB/bD5l01f11tqXle8zU3LKkSmofQgKxvJbSJVsk30naNSyoBJu9jqMjvk7DNWMvqaO3HkUJUr9ynE6zixO8NPBRRpFsr7MdK+p934S17jXNFjTIM2b6VUAEawiqV4MUVQBgG9p55zYulzOIqDdbpbsW9ELlAdQhsH0OhlT8R+q8oo4czOX7CInN61BVd/0diIifAP95BQcsqDIfyyIFeuQ/Z7md96ZDELsPB37Ts62QvBFlQFDZ72Aa1u3nGFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4TKqg5YwKi5E/2NAQ1oQvG/a9DmTFNP4+ea1KnsBHg=;
 b=H1S1ISDLEIpfCNAzgX4yS3B7ZFYI/7bsbYF0d3+oeiDkT5TuRXgFhEC4KYRWcvNQ9ZAxYEBkEtXquqVHZNomxb8RiKuNzfA88AkOV93BD/zawblI5BD6PFC7O8pk0tyICTQHT+JB6j31pZubvW7PXIJuXAwZY88x1sae8LKsW6XdlQycqZt8yaaoT/oGXLWboN+9LtMfdURQh7aFWPXV5ZDO+VNV9avR1MPRpMCk2KlBFVZTgcx418a40KR4F55iVXgLvGu1Ukcfwe6ru13yYtNWzhzh8cpvj2H9icPxtuI6Z2/EcTGJIjc2t0pFEiSfb2h7xq5ACX9wUKzBHPhYqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH0PR11MB7712.namprd11.prod.outlook.com (2603:10b6:510:290::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 17:12:01 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%4]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 17:12:00 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t 05/10] lib/xe: Return boolean from xe_wa()
In-Reply-To: <871pbtbxhr.fsf@intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-5-0c147eeefefa@intel.com>
 <20260729221424.GE7790@mdroper-desk1.amr.corp.intel.com>
 <87tsorb8t9.fsf@intel.com>
 <20260819205000.GQ8279@mdroper-desk1.amr.corp.intel.com>
 <871pbtbxhr.fsf@intel.com>
Date: Wed, 23 Sep 2026 14:11:55 -0300
Message-ID: <878q4rj3j8.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::15) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH0PR11MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: 34794a80-9f9b-4a0e-6c01-08df1995c79c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: qxJbMINLnZbn1PyPPiQrKeaZdFEi0easMxEasDVz4NSZ7rQUYxvz0SEaFkld2svXw0WE6oKFyaW7LQbvvmL2QNug4+8qrK4ztU6MbIgXqRjBrITr3lkax4JP8dpwfknRluhbWcywHz46IiRRzTLSGxW9n4P31p98lkMlaIpJfxpbJdhYh9cLOgEHWDrelivznnYoQlqPnpoWfnKPjk2qhSk41gee/bbcVNC4KuLAAqKQ9WP1Pb3WvOV0wNUC3bU5P1dqaYYI2e69K6f6uJg19P+gwGLIpXdQhgZ6GW6b4RhQXQNbZcD4ZPGu9SwVyXACnYERW0kO8NjtY1e2Smnf29fDdupuqaPEWno288jx7BPaK1b60KJ+hOy+eC0zvlxuSjPpsSqAPW++nhLQnR9yqH1F0uRLtbi24ML7ghqB6qL4lpL/4YaPHcYDCXrbhi6H+/uXR2KXl0+o967tXJeMh4LsBoaSPiblNKqdswP/v4bccFe2MP1NyFP/4vdxz8kJpMC1e9cTqanq7jV4f71qo8eVv3f8OfFAK9UBxOIux1kxvsivR4FRnCRQx78Fle/DbyisE8eBZl+6jKUfw4GACmmFEYco2r1eMSDFIljDXi/4pBr/dwkQFbFy6mZEn/GOOipCAexDmO9EqdgrEynU0ot1qahZ1HSZ5XyRbAcuInM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lDANH4eZGv0Mn1ratMOlWIc4Nlm+LczMCcIL6+pkxfZDqLkv7QtG+4oPDKgB?=
 =?us-ascii?Q?jFUXHrX+5PiA+n6gUHUZHHB1xXwZ5QFtJ6gKyN/ZTfmKVeVoXqimWaAqdeyJ?=
 =?us-ascii?Q?lYRLnK2J26tYtIJmSkMthUcKbPcfQR92xcWRl73llAgXsboquVNZsnv1S1S5?=
 =?us-ascii?Q?jyY/oqXx6nVMxYwVgj1EUnd9hCANSpL6GORBNeR08azrDFDV7MzV41DnuB+c?=
 =?us-ascii?Q?MbnU8oel8ov81nmxGDphxQjMF43vjG860Dx8mfqe4lxCCb2siiDtPiGRIjI2?=
 =?us-ascii?Q?D/1YJDhpFSC8ab8V6OyyT3o+37dHB+zPRQUh1OXACblu6Do5H8IKe6AOuNgs?=
 =?us-ascii?Q?yq0XWUgOfB3PgEE8e9+jyW+bdrrG0kiXFd1Z544/YX7SHhzEBweN+ZXlNE8H?=
 =?us-ascii?Q?HJ9Ic946xEH82uDJotDqRcNrRit03/nPKbxGmTuJRNXKZegU7zkx0y3kgSd6?=
 =?us-ascii?Q?q/NvXMZoMSeAmi04WK8sB0a3YhAvN4z17tyoOZ5F6C3kMlP5n4Ro+yAjJW95?=
 =?us-ascii?Q?MjthNFU+F733QtVdP7v3nU6gDMt92ljOhaf5kCqUomAjJVPi8nprIXwKKjoo?=
 =?us-ascii?Q?FOI6dnct3iGWEd86JsklPmSRUvjeEgHc8CTjLKbKKw2NKFeggIzqasJ8i01r?=
 =?us-ascii?Q?6jujBGgI34jCddF1DrMmrc+5skn1A+/nDTgjJNZsgU1TyCpe228+frpksNHY?=
 =?us-ascii?Q?3BJsXdylbOiKSZlBFdpUNGR06c1J3soJZqS0Dnc2XgtHsKrR1DpmijaNo/FC?=
 =?us-ascii?Q?Tlzpv23K/pjOGGnH9IN18kwErWkWr3WO9P05Awv4+IfpAAACtPJuBHhzrmXG?=
 =?us-ascii?Q?GK+kdrH7I2If2X2VJP8Os/PKGbjfxYR4b3yCIjN3O6Vp2+7r0tW/eVbE46q2?=
 =?us-ascii?Q?yOPQoCl28IrYIeIDaRjU6Q/YiYtARrivXi4rU3+7NPeo7Zk0/5+Jny3XvZC8?=
 =?us-ascii?Q?uFsezGYUK45Qlo/3DXEzHA27utbTEqDFVzsrz2pBOrts236PBGHcLhi4+Hgw?=
 =?us-ascii?Q?vYruPXargOA8GAKW4DltIapR0+yvsiRePbLDdEWGDAH9VXEqUEsxnnR4bTMZ?=
 =?us-ascii?Q?XM2kQy4nL5MpJr4/DPJGJUnasBWuu8X1Mpxm15OgEy3xnUN93CrKkMf15Nef?=
 =?us-ascii?Q?wZFbHpRjuMv0EuSBxXoFjevpZ2b7uXEgJWCdceOmLCWJdFW+kHZLjMePXeDX?=
 =?us-ascii?Q?MJ8h6q0II1vACThdnQ+kOr638dGEhEYGJZkNS1aIVXOwEo0g/aJz4W7dW9vd?=
 =?us-ascii?Q?Q36GOG6RO5SmCnUP8GRvCvl81ZjNdehd462EuYfAM+jEdnj/tpsl6BzwpcbO?=
 =?us-ascii?Q?3bhikxnKnIyiL2PplFwOeCNGz2rVqOKpJTyU+HO370QBi7f4ETJV0j2ZIJyj?=
 =?us-ascii?Q?6+b9u+d/IQho29BqJ7aMo6oBMbSs1ykp8vukUoNfHgNcP0nb4BcCSFNcSZZw?=
 =?us-ascii?Q?ySo+cgNCxyaNOt7j3vuqTabVV1ASrlCMQk1rwRUGb8fGPcOfJjIwv5ZdKvL9?=
 =?us-ascii?Q?R/kKXSVfpODnZ5N+h5Wy55qwiZDXJrm9oO33WDGjPXsSI3HUh46PI5l23ZR2?=
 =?us-ascii?Q?zMOX1GfTf836dKgobO7ovki74rRP61XxGT9VlNDVOii2pZxJI0TPz70n8Uot?=
 =?us-ascii?Q?l3Vsxny/ckyUITQPhy7x4pYWSvrOLlfIorY2AGGFK0d39Dtd9pn/AGarxOeh?=
 =?us-ascii?Q?tUnhCf/+cu/n7hYVZqHhe6khj8gNhnBD04b5phgFuHpOuGYbsy4oj4tmEisH?=
 =?us-ascii?Q?1PUVwhBRSw=3D=3D?=
X-Exchange-RoutingPolicyChecked: aCKTy4B5AGiNJZICriM/JBpKeaQ1o/HsLr/CQMU0DMMnRAEwIqoNaVkGF8ykOUL7F+CGkgDIfhmDSZDjUxRlbiZMLKy9iWxj9cgKQTLETGVknd1+rgzP8AdaQcUoo5dTr8D/cJvh3Ncgn4/ChS4OJi3qyHZk2mW1gmlEAQFWH2WMFvCej6Q6BcwbmT+CFwKX41ZNwrnGfGXa+eCt8NNBDU4ykq/fwHqDMZKxBHJbYSHbBm0gMiKkadAOTXb70it+5Wi7FInXX0DWIORiREwxcGjMDLiDLeYecN9pO7kFJBbRaoQD6sry14SwRggtfgwwrk/4XZQedxqwnLqbbuzHjQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 34794a80-9f9b-4a0e-6c01-08df1995c79c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 17:12:00.0911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2F5+o+SlKFfsjEvTbn5gWv6jBmBkjv3ffbFEIh3TVjiCAmjMfRDR0honC6Ys3btItk1lFluFwK8qStnCKesveg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7712
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

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> Matt Roper <matthew.d.roper@intel.com> writes:
>
>> On Tue, Aug 18, 2026 at 03:08:34PM -0300, Gustavo Sousa wrote:
>>> Matt Roper <matthew.d.roper@intel.com> writes:
>>> 
>>> > On Tue, Jul 21, 2026 at 03:59:58PM -0300, Gustavo Sousa wrote:
>>> >> The function xe_wa() will cause a warning to be printed when an error
>>> >> condition is found.  Since the current users of xe_wa() do not check
>>> >> for errors, let's just convert the function to return a boolean.
>>> >> 
>>> >> Checking for xe_wa(...) instead of xe_wa(...) > 0 feels more natural.
>>> >> 
>>> >> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>> >> ---
>>> >>  lib/xe/xe_wa.c      | 11 ++++++-----
>>> >>  lib/xe/xe_wa.h      |  4 +++-
>>> >>  tests/intel/xe_oa.c |  2 +-
>>> >>  3 files changed, 10 insertions(+), 7 deletions(-)
>>> >> 
>>> >> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
>>> >> index 0f4d2edc0795..8c8f7156c21f 100644
>>> >> --- a/lib/xe/xe_wa.c
>>> >> +++ b/lib/xe/xe_wa.c
>>> >> @@ -108,20 +108,21 @@ static bool debugfs_dump_has_wa(char *dump, const char *wa)
>>> >>   * @fd: A drm file descriptor.
>>> >>   * @wa: Name of the workaround to be checked.
>>> >>   *
>>> >> - * Returns 1 if enabled, 0 if disabled, -1 on error.
>>> >> + * Return a boolean indicating whether the workaround is enabled.
>>> >> + * On error, returns false and a warning is printed.
>>> >>   */
>>> >> -int xe_wa(int fd, const char *wa)
>>> >> +bool xe_wa(int fd, const char *wa)
>>> >>  {
>>> >>  	char **dumps = xe_device_get(fd)->wa_cache;
>>> >>  
>>> >>  	if (igt_warn_on(!dumps))
>>> >> -		return -1;
>>> >> +		return false;
>>> >
>>> > Should we use an igt_assert() so that failures here get propagated up as
>>> > test failures?
>>> 
>>> I'm not sure.  In the past I advocated for stuff under lib/ to avoid
>>> causing asserts and leave that for real test code...
>>> 
>>> Cc'ing Ashutosh here, since he was involved in that discussion.
>>> 
>>> Do we have strong reasons to do an igt_assert() here?
>>> 
>>> A workaround like Wa_14026539277 will be checked in many tests and the
>>> assert failure will cause disruptions on many unrelated platforms.
>>
>> If we're not able to accurately determine the workaround list, then any
>> test which is calling xe_wa() to check workarounds has effectively
>> become unreliable and we can't trust that it's giving accurate results
>> anymore.  That would mean we have general IGT infrastructure breakage
>> that needs to be resolved before we can trust the results of those
>> tests.
>
> Fair.  I'll change this to use igt_assert() in the next
> iteration.

Since that's arguably a separate logical change, I did this as a new
patch that will be placed after this one in v2,

--
Gustavo Sousa

>
>>
>> It would be nice if there was a cleaner way to differentiate IGT's
>> library-internal assertions from regular test result failures, but from
>> grep'ing the current codebase, the use of igt_assert in lib/ seems to be
>> the common way to handle this.
>
> What differentiation did you have in mind? Making library-internal
> assertions non-fatal? Or just how we report them?
>
> --
> Gustavo Sousa
>
>>
>>
>> Matt
>>
>>> 
>>> --
>>> Gustavo Sousa
>>> 
>>> >
>>> >
>>> > Matt
>>> >
>>> >>  
>>> >>  	for (char **dump = dumps; *dump; dump++)
>>> >>  		if (debugfs_dump_has_wa(*dump, wa))
>>> >> -			return 1;
>>> >> +			return true;
>>> >>  
>>> >> -	return 0;
>>> >> +	return false;
>>> >>  }
>>> >>  
>>> >>  /**
>>> >> diff --git a/lib/xe/xe_wa.h b/lib/xe/xe_wa.h
>>> >> index f0a826553df8..aa1c50c0f9c9 100644
>>> >> --- a/lib/xe/xe_wa.h
>>> >> +++ b/lib/xe/xe_wa.h
>>> >> @@ -6,9 +6,11 @@
>>> >>  #ifndef XE_WA_H
>>> >>  #define XE_WA_H
>>> >>  
>>> >> +#include <stdbool.h>
>>> >> +
>>> >>  struct xe_device;
>>> >>  
>>> >> -int xe_wa(int fd, const char *wa);
>>> >> +bool xe_wa(int fd, const char *wa);
>>> >>  
>>> >>  void xe_wa_build_cache(struct xe_device *xe_dev);
>>> >>  void xe_wa_free_cache(struct xe_device *xe_dev);
>>> >> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>>> >> index fcf1d71a167f..bdaa7141004b 100644
>>> >> --- a/tests/intel/xe_oa.c
>>> >> +++ b/tests/intel/xe_oa.c
>>> >> @@ -2678,7 +2678,7 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
>>> >>  	 * can result in buffer overflows.
>>> >>  	 */
>>> >>  	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT &&
>>> >> -	    xe_wa(drm_fd, "14026633728") > 0) {
>>> >> +	    xe_wa(drm_fd, "14026633728")) {
>>> >>  		oa_exponent = max(oa_exponent, 8);
>>> >>  		properties[9] = oa_exponent;
>>> >>  	}
>>> >> 
>>> >> -- 
>>> >> 2.55.0
>>> >> 
>>> >
>>> > -- 
>>> > Matt Roper
>>> > Graphics Software Engineer
>>> > Linux GPU Platform Enablement
>>> > Intel Corporation
>>
>> -- 
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation
