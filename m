Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51811C2BD09
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 15:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11D710E04A;
	Mon, 24 Jun 2024 15:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bk/nju8y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FC810E04A
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 15:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719242966; x=1750778966;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7cPHwiADGJNeFLA+TLOQO9Oigd9Eyb6iKP9f0IqgKj4=;
 b=bk/nju8yqyuI+5SWgpfAIAZnSLOu12XfEbIR9N27/qOyoedAimJ0nmU/
 f6hlVW1WmxE91Kg35pN3S3i8OqXgjRNrPyB/OGB3A78eCP0aNPVoDowTF
 phRi0hzFQAkD98NyKqLoKkriIXuSYVTPk/qX++h4TTt3nDxhTeVLYTc6H
 toCYuMUFLB2wAmb8NRuva0tV0hV7B/maXX835BQms5FHXkwAR9Nm1Jlnv
 vQyJEAPxsYH4RIXUgeNojwxnhnd9gBXX8fTzISgAaMyuGfeaedFFYd/9j
 M3dPcDjEkU7QRfcQ++19/pyOSXkS5NSowgS2feanoTCO3iWe3bLuD1EOp Q==;
X-CSE-ConnectionGUID: +Lm3HUAjQIS+vjP3UXs2WQ==
X-CSE-MsgGUID: agmyz0e/Qo6Im8J7Z6+eoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16452955"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="16452955"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 08:29:26 -0700
X-CSE-ConnectionGUID: SmT0qNusRJenaKE0/qfoDQ==
X-CSE-MsgGUID: bwGmlUvtQIudBygpXKeOtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="43450580"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 08:29:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 08:29:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 08:29:25 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 08:29:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FfC7zJ8K/FTefoLTI0fWpZDtkcJ757qkpJYQgwbv+eSby6EGVAZmBQFuBHHV6yhGTXVfKgiwFjq43v6xXoD9ffUpmVCFq3gOe6rn3Wpx093EJqESNwXTAjI5k92hJp2+a4XA3ZwaJTm7Q98mXuJw1CFQiOi77ZQkv12n0owkRCsSOFWWYyv5kUpU66iYVEVGETSmh3xeBFbgalEx1GYtW6W2G4PIiCJOr1CKCQC5OeEWymgH2Q61s0KVaFKuxhreHYJzfBp668618GcVLtdZ3S0W7T2X5t1jCEzSmkDCIXWANtaXU6QBkz4vODmN/S48PQAUxpCaMO21sEG96+ftOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLB0sTMwWnLFQ4IL8ldfQ6i0pN5T7Bl1KLkt1PQ7Y2w=;
 b=D6wlcSdlmh8gzk+LY+MDb6+2BwW5EOhTdop9mR+JHsSpNyhlwPZ3OAOFFtymbWiOwXt6GwW4u1jMLfDHk8ooX8pyuq4Bp9KSUW62pl3w5GP3udFnfKHAUOBwEojo/CKcqP1bRRUmZvx6T37+iI8/h+uveI9Lg2kjaSd1ZNsSLEbpi/4I9MTrPe4HDfWXVw4xrqaqfrPiLnyx+ehDyL21FTehpD3yv2NIfucSBJKJ1FgcFfV1Zp+9B3zyUMyFCYEVgwJoRVM+uNX5JeD0ptn6Y6Lf+IcVX0x3Nng3yzz5OQWVyO+swsGnbkJYR/8GGyER8xkkkNTaH+5MlrCWD0hSjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by MN0PR11MB6181.namprd11.prod.outlook.com (2603:10b6:208:3c7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.25; Mon, 24 Jun
 2024 15:29:23 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%7]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 15:29:23 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_hdr: Add more logs to skips
Thread-Topic: [PATCH i-g-t] tests/kms_hdr: Add more logs to skips
Thread-Index: AQHarcdHMqkvcbgrJE27o8EuZ/yLzbHXOqlg
Date: Mon, 24 Jun 2024 15:29:22 +0000
Message-ID: <PH0PR11MB4806A7BE35F107145DD2E014E4D42@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20240524103627.2737535-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240524103627.2737535-1-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|MN0PR11MB6181:EE_
x-ms-office365-filtering-correlation-id: b708b816-d5d9-487b-191b-08dc94626c9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|1800799021|366013|376011|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?TAwdjr8LfN5MydwGhV/PUrXZi7vAirfxU97r72dlj8lFXUfG3FWAU3YVbKrB?=
 =?us-ascii?Q?mCJND2WHVmlOnfd90F8elphr181yy+yvh3dmgmo9AA3mHOyibwSyY6u0BbAV?=
 =?us-ascii?Q?xu115h5opuRr6+nfiQiwh3ObnQb5vnr6+X4ScoEewcIPGJROvp4cFlwfduWm?=
 =?us-ascii?Q?ida+UJGGjY2CkIzHYA7ukYv+vWsHkbz4FEOwa674UKHrnzmjQA8KdMnmvJGG?=
 =?us-ascii?Q?9AScb3U/3aD3/D//RyQuXv6AcbsiypM7xXQxVarbRDx9HtutP5FZtJMtFruc?=
 =?us-ascii?Q?1Wv4rHZ8KlqRdi/39NjfdrhzvqwgFmWV5rwW9h2gqToYCFTParK1YW1ZpLx3?=
 =?us-ascii?Q?2lk3PB1OcDG/2WS6aq5JPlFZXzAiQMj3ReQ6/CaswYak2ZOrQweG7FTS1Le7?=
 =?us-ascii?Q?1dv+uzDA0yK8sy+2UOiQAw3UrbzdjUHdVVVlSDaLq1xmus3KnzulRKx0PjST?=
 =?us-ascii?Q?su1scBEOU4CsAsx7bY3EWPckB0CW28Mm1GTxc1tnrFC4h21BLpGKRJiw+V6K?=
 =?us-ascii?Q?ZuAoCotYvvUcqh2cYEqHYTJCVBsIRaox0yeSCjWGESvUnglaJ8a4ZK1gEZXI?=
 =?us-ascii?Q?ImZIOpmhVkjz0qeyaT3+K0wiYRsa4iHsim/rJ6wcidQCUI/bONCb1keUUP8v?=
 =?us-ascii?Q?qCjZGoZomLNziu5NDpYy5OLJcZDMX9iTCBanbIT0yIRkOKMIU0pROn3e+ZxX?=
 =?us-ascii?Q?Ml3GTGkh3sC0eZshJgvrx8jwBGwRyNQhYGaHf/DLN7jjUkQ2SY2cVwWEdpIZ?=
 =?us-ascii?Q?WIGoESC4H/lboLfTIVDyQGvzVnTkl+3STgHWLIbP/2B8mpSn2i9HEmF24cfr?=
 =?us-ascii?Q?gP0LF1rafyDzXLQa4C+6zzTVvLrDebDzwDiaFtRcV8TYkF2SZynsgeASjHtw?=
 =?us-ascii?Q?1qydYH77FabIc5vK8VMcthmerOTEw5555h9oa58xEeeneL+koNrOtnvzYkVN?=
 =?us-ascii?Q?FuSCndEnM2EI24m4Sdp8ymFoQoCfKJzW+9LKzbFGri4HOyOexcdvEhL57+eG?=
 =?us-ascii?Q?9opT7Pto78RFhdRWQZV8a3PRJVk1mwvtQfpt9hp4d59zojWR1EO17AsdI8ln?=
 =?us-ascii?Q?DTZ+p1lwQIu9gn286IWyy+A+LRHtkRcYyXxTdXGQQoVXNM3vLEdJ9yBHpT6a?=
 =?us-ascii?Q?WVRiJuC5DB/RtdylMB1p1GiRhdkgCMAOC+5d1BJskAlVAv3D/32Fx815nxXd?=
 =?us-ascii?Q?NBJntPpLUYzvZY+SOajQYjdWgUGHvG18vgI/5E+vR2KCtr+EHkOGhzpDLb0g?=
 =?us-ascii?Q?0TTKuHoFS+5MYyMSWG4kSm4f4JhFbA7yFLGxbKWP4TrDHtj3LK1YNlf221ro?=
 =?us-ascii?Q?+Y75VFG4eKgL3k22O/7AmTvpNrckZ5ntLXLCkGH9Yz2Z99vjWayCmL0wHuSx?=
 =?us-ascii?Q?EX5EOaQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6QGO3SX0iHP7Mjozt7ulbRhmigCuVPsFjUNxBirl0u171ij569QJgCIksB4y?=
 =?us-ascii?Q?mp1/d5JJJvdIbsk+TXc+AG634mr7g8ZSd+guY5jZN1RmeD3Hi3SZg7hNma+a?=
 =?us-ascii?Q?MTuIe7BewkcIshEWtEcYvDwdT1kTwjFeQbQ52fR95OWjjyGQFTBW3MbiVEZn?=
 =?us-ascii?Q?lfjN/yZMfgns7kvnw2UMdXvMoJw2jK5swKa+H0L16uAqpBQmLorEqGOOWnJo?=
 =?us-ascii?Q?NyoBtIotYd2+mPrxU8Qy6R1LOfddg2E8++aR4UdOxrttNCC0TJWfRBJBV1e/?=
 =?us-ascii?Q?IdZwKj1z0/E1ySDOCyeFiD/NRAma0P/OThXiQZJ3dtt+bwvYBhfEtz7k1sdz?=
 =?us-ascii?Q?1qM9xOGkMlHPVokfPQxSbRjqifeL3m4PBa/tNreO+hwICwsibfvAXCnHSqOq?=
 =?us-ascii?Q?HlP8cxyT1sNpnERbvtzkGrArwPBI9IxA90mgOi1Y2C++LqYOUXFFH+5DcLiJ?=
 =?us-ascii?Q?N0w6495TPkLgUsCYpYAeaEd927Vh+QI+itOyEg5ZfND5pMnX+Xr6jmq+JmRT?=
 =?us-ascii?Q?YW23Hkwn32hkQZJwtON1cMh84aDtGhQqcXrXtEuO9Qwgyyo4leoLSqjcx+g6?=
 =?us-ascii?Q?GABdf//N6anUkr7olPL7ndiEnbG/EywmdrYUpzbt2rF7eGhKSfJHpY+3RdeG?=
 =?us-ascii?Q?tGZf0fI3JGnWczKvI2m4NVb2XLNlGF/d6K7Nf7B6DXXcJ2u5IUqRkM47eE9I?=
 =?us-ascii?Q?k/EASE9Da0VoiskhsoXdruGyAWGY9UKqGiIn75hR+r/+OEZc6hq7TbWjR2oG?=
 =?us-ascii?Q?IjmR5EafPoDMeWXlxbJh/RlsFZ/3rYZFKS+6iPYHjA9MYn6VXFMrTdZ1lQeb?=
 =?us-ascii?Q?O82lFZ1Ads3ZkwmSriYJ0Vk7HF6pwx4Wvl6thG6UW9N8IqVFQ8mQglz2CFbd?=
 =?us-ascii?Q?DdnLIP9ooJiOHMj6KHxZBGRTNu1lkiXXhsbD/p8kw3+pbdMExTRTjgd3mGfm?=
 =?us-ascii?Q?v6v5tXCWymj8E22kldGByPZeoOw2t55WBVkiBoT8H9YyfRTqsmYM1/xznyTW?=
 =?us-ascii?Q?Da0DXqZlrKybxzoXFBN/sCxiGOLmu0+NCMlDlteJE38bjbM5l2Z1p8ox6frk?=
 =?us-ascii?Q?5cAwvbSu4Kcul4SQeIopASHJYHknK1fpkFtc2RtStGeFt+fbyzGib1I6KbYX?=
 =?us-ascii?Q?0PgN76cn061uwKHxBsV9tiwPalb+1P1QdBvSTjUYf/mvSW2EC5BKEqO0k3Ix?=
 =?us-ascii?Q?fCviwjkRjdENaRg93JKSa0A6cZMak7dB10vUTblj3dH0XNSvCox7p3NtvMdf?=
 =?us-ascii?Q?NGE8BRW9w4wtHn8mPEa7aacCW3sdGW/aeQQ7gWaD9CkAqewljkc14xNP65OV?=
 =?us-ascii?Q?GqZEMvwyJPMxdeVaP3TnH33+DNl6KlEQcf11LGGFp+57UmERagFuFZ2jwWGG?=
 =?us-ascii?Q?RyRuldpELInkOWvVSkejqqZhVyEXqRsyG5eAO4HaDxzIviifRr89oJRiuEZq?=
 =?us-ascii?Q?okZ9P2WpftDP046rf8S0TG2GyU+we9sRHkiiF8xn59roWCVsXYVaTV9YQsgA?=
 =?us-ascii?Q?sdP6rmtCOBgrFLpKeS3JIynovw9xhHzZk/Au3+PWgeyG+V/qvPqwooWVAIiT?=
 =?us-ascii?Q?1WqK085ITpgWb634ZlSdpFdx9iKpXggF/jEpPD3SS8XvBwgikoBdTg+JuMO0?=
 =?us-ascii?Q?yA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b708b816-d5d9-487b-191b-08dc94626c9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2024 15:29:22.9355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 37bec0Jlbhx7jcRcL3W1y24+MIyc05LrmGSxoDOMjoA5DVMuGrNEzB+k0GDPm/3bDZoM3TawmUZE3TpdRhldMYrhmOhAXhoOdFrHPQmylQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6181
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

LGTM:
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Bhanupra=
kash Modem
Sent: Friday, May 24, 2024 4:06 PM
To: igt-dev@lists.freedesktop.org
Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t] tests/kms_hdr: Add more logs to skips

It would be easy to debug if we have some logs in case of test failures/ski=
ps.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_hdr.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c index 99b78f7ef..98241c4ac 1=
00644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -264,11 +264,16 @@ static void test_bpc_switch(data_t *data, uint32_t fl=
ags)
 	for_each_connected_output(display, output) {
 		enum pipe pipe;
=20
-		if (!has_max_bpc(output))
+		if (!has_max_bpc(output)) {
+			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
+				 igt_output_name(output));
 			continue;
+		}
=20
-		if (igt_get_output_max_bpc(data->fd, output->name) < 10)
+		if (igt_get_output_max_bpc(data->fd, output->name) < 10) {
+			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
 			continue;
+		}
=20
 		for_each_pipe(display, pipe) {
 			if (igt_pipe_connector_valid(pipe, output)) { @@ -276,6 +281,9 @@ stati=
c void test_bpc_switch(data_t *data, uint32_t flags)
=20
 				if (is_intel_device(data->fd) &&
 				    !igt_max_bpc_constraint(display, pipe, output, 10)) {
+					igt_info("%s: No suitable mode found to use 10 bpc.\n",
+						 igt_output_name(output));
+
 					test_fini(data);
 					break;
 				}
@@ -621,18 +629,29 @@ static void test_hdr(data_t *data, uint32_t flags)
 		 * set MAX_BPC property to 10bpc prior to setting
 		 * HDR metadata property. Therefore, checking.
 		 */
-		if (!has_max_bpc(output) || !has_hdr(output))
+		if (!has_max_bpc(output) || !has_hdr(output)) {
+			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC or IGT_CONNECTOR_HD=
R_OUTPUT_METADATA.\n",
+				 igt_output_name(output));
 			continue;
+		}
=20
 		/* For negative test, panel should be non-hdr. */
-		if ((flags & TEST_INVALID_HDR) && is_panel_hdr(data, output))
+		if ((flags & TEST_INVALID_HDR) && is_panel_hdr(data, output)) {
+			igt_info("%s: Can't run negative test on HDR panel.\n",
+				 igt_output_name(output));
 			continue;
+		}
=20
-		if ((flags & ~TEST_INVALID_HDR) && !is_panel_hdr(data, output))
+		if ((flags & ~TEST_INVALID_HDR) && !is_panel_hdr(data, output)) {
+			igt_info("%s: Can't run HDR tests on non-HDR panel.\n",
+				 igt_output_name(output));
 			continue;
+		}
=20
-		if (igt_get_output_max_bpc(data->fd, output->name) < 10)
+		if (igt_get_output_max_bpc(data->fd, output->name) < 10) {
+			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
 			continue;
+		}
=20
 		for_each_pipe(display, pipe) {
 			if (igt_pipe_connector_valid(pipe, output)) { @@ -640,6 +659,9 @@ stati=
c void test_hdr(data_t *data, uint32_t flags)
=20
 				if (is_intel_device(data->fd) &&
 				    !igt_max_bpc_constraint(display, pipe, output, 10)) {
+					igt_info("%s: No suitable mode found to use 10 bpc.\n",
+						 igt_output_name(output));
+
 					test_fini(data);
 					break;
 				}
--
2.43.2

