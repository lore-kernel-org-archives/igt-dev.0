Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9073DCD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 20:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786B7112EC8;
	Wed,  3 Apr 2024 20:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OtrS5Wtc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4DC112ECC
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 20:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712176053; x=1743712053;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SlmaNWV/dgwRlZrqwo10V+uCyNOBKIWclQkFc+8c210=;
 b=OtrS5Wtcr7zx8GqxebnpPxDdWuZ1VFCjd9v2CK3Br+Fat7HeBhHxDUmS
 KClwVLcegcHF5OMhfXCRojTxIu4ObrQZg1/+sqJvGbw4doGCbTkKGWjXD
 ptCPQrockVHyKZ3rC9JOjlN6nwheHLqy4bL5pgjPN6FSwHnC3h4oOPcLN
 SH717Ep42iC+1teT017/FucEqENvLNFPpEXi1B5jrtzhc9XRcdu2beTzk
 qqQGWG3qJ7QKzLZZpEQWai5zAYMG8+Pb/ajNV8UCirpa9PrS88YQfCjtO
 fJE2d9nzLFarCHfJZAPLFYbKycH5/8GHZlXC1TOa1O7KckjIroRPwZOP4 Q==;
X-CSE-ConnectionGUID: 4VpJ1L2mSkyv9FqoiW3ioQ==
X-CSE-MsgGUID: Q27lhfKyQMmbrttusVYdRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18588986"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18588986"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 13:27:30 -0700
X-CSE-ConnectionGUID: Qzs+kSAJRwGQQ4/TsHpoNQ==
X-CSE-MsgGUID: gvJqovo/Tva4m2E0gFgApw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18643437"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 13:27:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 13:27:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 13:27:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 13:27:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUKeKdlCwPneX/N3trvb5iw1+oXtg1MKDYZOEgL3m5ya8gci1c4mu2xfi8oCVreVUCVIk+ifl7HYelPRAZB97cH2Uwm4rjw1NF7lBhORPsPHeCEJIArHs6E613HgC2zW2qdJv+VA34S/oH/W2/TAvpkIHLOlwKdWk4S+13LZwJOjVrAx1+LYfGy9dFgS0xrSRuwozdEMWEimB3Tf9oy7EEVV4QiSIQan2G6slWGARR3z9ArClRAdEnA6cUafklu4oxcrmPasXLGW4dQItOBRt7diKiyUP/d0dHPBElIYM/+TaDVZs7mUQF9yN19Q/aqunhDOnI8DRu3yiGMZpAmajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6y1yKCyE9461+PuG2JF9yOYxl08vL2hWTA6XEg5ecxI=;
 b=AcS0CN23RR0RvUUR3uITb70XiUHJZZ881wHDN+ymqrVt7/Ec+0VMiXBHtKfwDubZhSoZZfK28eE2EveaW+Z+VCi2kL+sGY7rIg8LBvTtEQV1jBfQTEbCrQAcIOQiqpIE1auQjx2rAI7RImVB7GRHkrWQ9YKdFO6OALXZaOZVZM7fJQX49OdVMEx4bRPuDgLMgerxtpZx2E6DR/TdzttxW2iedDpHyuGsMHpngU+m4RTwFdUOv34cmGGQiYLLWTEHGp4yQo1wC8X85T/noh4irsPx97Ht5Aq3GJMZ6kB/IJpPG5CiVqy1B4j1iq2P7NF+SbuE3ezSgWyEr51ij5Zh1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7481.namprd11.prod.outlook.com (2603:10b6:8:14b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 20:27:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 20:27:27 +0000
Date: Wed, 3 Apr 2024 15:27:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@igalia.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH i-g-t] tools/gputop: Fix engine columns with amdgpu
Message-ID: <zpnpvxz7bvryul7c5awkiqj3xdgm4ihat3u2obl4rdfszfmjq4@scbuwrratvhx>
References: <20240403150057.25765-1-tursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240403150057.25765-1-tursulin@igalia.com>
X-ClientProxiedBy: BY5PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:180::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7481:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Slx8PgHH0dJVhGQ86f31s7qMVsFZxFc1yRO9dpMWZn473QjXu0/xAxZ9Cv74oaO/a+qA4kdNMS7/ii5gL2xRUuNTxml3PFHmQbOGCJkJInxggap6765TBRxXJZ4Y9v05TTLIuRrKMvAswNC+9Yhnhv9tzBDEID8FGUCxYo48fv6DyrTSG9Qxe2/El3vgyDF2+wH7AkPrR+mT13Xu50PCRxh2MYZo/tWcyPhS7OFhBoLw/0fmgEQN7rupxRXfg//v/cgYn8TaX1JKYx/feD5INdoZDgoPG5Qeku6FUmrA/No/DzkhvXfmUsYyuwK1dH9VoEAnKqTzUfWTzjoF4gT3bJ6cL+ECLy7l7zxqLXax7LPpnS5eQR1VhRM7///m81EyhTD5l0nFNJ8EVdEr7AWDTUSB7v3lSIUz/Yef1qSdmh43oScuyrCCsU1m675USeY8l8HlKH9tQe0Ykft6QrxrNUOworXqn5XC/Pm1+od13bt3M+cji77hPfObmZ/ExtN6diMBrkIO1aK2zvnLhSmp0CJ49Mx8JccWlsDIBc+RRhGdwLis7k7JV5mkv8WnBbyZqbVAaJKyg/Fsf7NBkTWHk1Qtnq2sjRECWOV9ET9CqnDjAzsqkQdruXtcbYe1i+7hCU9/8pWeML9jn3VgwtEHFRMA0ogYIsTEWD6Y6mAtOBfj60Ecq4M0ueqin4THqW8/xZhpu/29KT3yDUh6Ox8DA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(27256008); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o7ru9bDqbIl9K1CnJzXfv4I5zEZ267NQ3gPQNql3tB3Q3uSXp/jtlGydNm+p?=
 =?us-ascii?Q?rAd8HK+g4OkpDCnRAZ/NogAfQXOO/+AvcGWAuwDNRzFr5BgyK7bSPI6ejz5R?=
 =?us-ascii?Q?SiFU/LneomwPUwlmnRuecBVbgg+He0je3XCvgNCWSddtczivCkUCwkWRAo9z?=
 =?us-ascii?Q?HwHaQxYR/iRHLjorbYzT4ZxcRYttUp0KIFFjahETtsmB+/T83DXlJgu2R7Nj?=
 =?us-ascii?Q?NQSNkapUf1nkuqkBE2jjhVnbx9qqgow9hQxZFxW0H2COZNBr3MmZLYuj7klN?=
 =?us-ascii?Q?pYyJpufA1XBAWlJp7BDbgf7/J0xZNiubxWcLkTZHHytpmEiTKsj66z2xfj/D?=
 =?us-ascii?Q?0kuRtNgC/9XiyZjl69yR1Osy0jrz5KIz80NFKwNI0N8o/frnwwrm3r2hDpTm?=
 =?us-ascii?Q?zhWz2LMKZhPXN9pWk/RkNSsKFyqPcJZShHDYiAzQ7Ku2vfYya96cwk48iF7U?=
 =?us-ascii?Q?uvHvh6wHunLkR93SqUIHHht0YlM7GWcF1tBiFvA7d6oDcWG0EL+8MHX4o9qD?=
 =?us-ascii?Q?TfED6695PYzduOt+S9NgDHeAFMY9lDcbX2Xqn4J3pucj6ooMaKu5+BajQPmV?=
 =?us-ascii?Q?mGaWJJ00HoFm7BKLKNEoKeEIduwCLz5nkClajoaztJXjPxAWVudjQekJjnXN?=
 =?us-ascii?Q?09DrLN+ufzQJr8weSsGfYdMuZDp9O68/WpdwjpNGte569PNIJRHNupyffrib?=
 =?us-ascii?Q?Lh+xe6AFCMK50XVHEOzXxr+BQLBFf6C6mrJo2frJH03qa0Bptgh1g61PzKhe?=
 =?us-ascii?Q?DbzbXHU9iwG5Unnaa+1VEMiWkGV798RKSsRUoIXTOaP6kI3KQgAQeAj2fGpb?=
 =?us-ascii?Q?EBrXtRXhoVnqbVNeAsVry8URxUTprgVqG3w8IMH9vzVDsiglfeCDXmi6gJWS?=
 =?us-ascii?Q?4MoMuuhrNXUFN/9VY5bIj6FHVdNJW6o9rF3iKJMkRPgXXxe+LKVC0o4D/uq3?=
 =?us-ascii?Q?EqfoGt9GqPuPiUQNoi3RNte1C0Y49tSIk4CWE/Q3z4CtPgGgGtDdjgPQ2Uoo?=
 =?us-ascii?Q?j/ai/dQqCcX8XWl8+ywYqbZiUx3+XDialpoe3lo5EIE1O0nJeAp4UKwuNuQO?=
 =?us-ascii?Q?O5iJKYPQki5LU3VqnZS71/qF/gqniSwQzxNDHAkPB/neXj270BDCTXTGRlLl?=
 =?us-ascii?Q?YsGgYSz46Nsv+GU6ILkyQoCzKhQxNYLDwy/iNy5gCFEsoz3QgV4e//DUgAGR?=
 =?us-ascii?Q?3jH/g+vl1imRULtyIi5X+7KLzbw4sFmDVAAVemVBWdvLdaF7JfTBORyNC3Fe?=
 =?us-ascii?Q?Cc9JBcW1P2dDpxzl/s05XFyS2/VEX3uNsKKHrnE0t3IOMVpMOaG0T+uTwCfh?=
 =?us-ascii?Q?DnivL3f2eIvL/7vqmzLKwt5St9QvaUJxnOmkahcX/Vh3yS0MCzOAMCBd1UvS?=
 =?us-ascii?Q?ErqFBE/AF7t8f+kVhJI0fcHDBzHc/QWVNsSaNyt2Ph3d8m8lz2xFegI8xBvu?=
 =?us-ascii?Q?RXY7MMnmpLjx6RENn/f+xkMMSgzn855UT3bcSkO3Um0bHGAsT+iwklttCmZs?=
 =?us-ascii?Q?P4CncqSyRSACuLrwT9xmxKdWyqAPE7kgY04TaSMyD3cZHFd8j62haNBRPvEb?=
 =?us-ascii?Q?Jh10OeocJETudHaqeDfOjk4bPg1y5Td68CXcEMrrcNH7fwCoWV0+CBCKMYxv?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f48edc6-7740-412c-8c96-08dc541c7a4e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 20:27:27.0509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3kCm9tK6JYedRJ7kCtCKcqk7BBdw55aVuhVSVPB67yOHHe+dGQHZZhQG3dA8YIVUOUaBIrF+cOCDjcWC5UflkQNWyLtT1k+cy9v4YagJBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7481
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

On Wed, Apr 03, 2024 at 04:00:57PM +0100, Tvrtko Ursulin wrote:
>From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
>Amdgpu kernel driver skips output of fdinfo keys for unused engines. That
>is completely legal but corrupts the column formatting in the current
>code.
>
>Fix it by simply treating change in detected engines used by a client
>as trigger to re-emit a new header. This ensures columns are always

That would be kind of ugly if each client uses a different engine.

Why not outputing all the engine classes regardless of what the
clients are using?

Lucas De Marchi

>correctly aligned, albeit with a cost of potentially duplicating the
>header for the same DRM minor.
>
>This is considered good enough for a reference implementation. The
>alternative would be to add some real per DRM minor state tracking which
>sounds like an overkill, at least until gputop gains a nicer (any) UI.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>---
> tools/gputop.c | 27 ++++++++++++++++++++++++++-
> 1 file changed, 26 insertions(+), 1 deletion(-)
>
>diff --git a/tools/gputop.c b/tools/gputop.c
>index 71e28f43ee4c..76075c5dde8b 100644
>--- a/tools/gputop.c
>+++ b/tools/gputop.c
>@@ -119,11 +119,36 @@ print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
> 	return lines;
> }
>
>+static bool
>+engines_identical(const struct igt_drm_client *c,
>+		  const struct igt_drm_client *pc)
>+{
>+	unsigned int i;
>+
>+	if (c->engines->num_engines != pc->engines->num_engines ||
>+	    c->engines->max_engine_id != pc->engines->max_engine_id)
>+		return false;
>+
>+	for (i = 0; i <= c->engines->max_engine_id; i++)
>+		if (c->engines->capacity[i] != pc->engines->capacity[i] ||
>+		    !!c->engines->names[i] != !!pc->engines->names[i] ||
>+		    strcmp(c->engines->names[i], pc->engines->names[i]))
>+			return false;
>+
>+	return true;
>+}
>
> static bool
> newheader(const struct igt_drm_client *c, const struct igt_drm_client *pc)
> {
>-	return !pc || c->drm_minor != pc->drm_minor;
>+	return !pc || c->drm_minor != pc->drm_minor ||
>+	       /*
>+		* Below is a a hack for drivers like amdgpu which omit listing
>+		* unused engines. Simply treat them as separate minors which
>+		* will ensure the per-engine columns are correctly sized in all
>+		* cases.
>+		*/
>+	       !engines_identical(c, pc);
> }
>
> static int
>-- 
>2.44.0
>
