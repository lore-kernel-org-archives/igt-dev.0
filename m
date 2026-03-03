Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B37E67A69
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 06:18:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C730410E0B6;
	Tue,  3 Mar 2026 06:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G13DBJrp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A3310E0B6
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 06:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772518707; x=1804054707;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=niu14tFJCusSEdMTtW/clhDP9RZ1c9FVLQ+cMoSt9MA=;
 b=G13DBJrp8/W5KrGDYiYgzJ4TEkvQWtiQMkQ8OaZaF8NJrNSjrxy1ZPIM
 b0NDcOUzpBOhSKfpu6TmEHP7gWZRdxNx04GixGSQpv/9uLzHI4tfPvyN7
 snAgj+l011vachqTgK5zlwg3jkda1pql+EJMB7vRLI2Z1Y0V8ZV5OuaK9
 B09j1MwRBYI7SwFrGGXcIaKMSovbyik01R/WsDjBBCfQI0LbGOpwBDoJ4
 3jnInJwPyFssYaX2XWj2O7L9J02Ur1M8aTpbvIIppiuOrjL8RmVrmjoes
 T1vriv6v03mkvk7RVXt8pNEMX9JCoRSrYLoCYrhUZ5deyzxdEcaN/aceK A==;
X-CSE-ConnectionGUID: qEeyt73hSiGfty8kGl7gXA==
X-CSE-MsgGUID: vDpHQlmxSae9+V7xu6Xl3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73449957"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="73449957"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 22:18:25 -0800
X-CSE-ConnectionGUID: 1ClAZgSdQ024LGJEdkLzJA==
X-CSE-MsgGUID: 8orHpKojQ6a1YKyikcbp+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="217885048"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 22:18:25 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 22:18:24 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 22:18:24 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 22:18:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8cMI4Z+GM48rlfguPJHj7+/QfgxifpzCpwLo+5vfRi4RmYkdwtn8CG4LIje5KzDfa15e0hpxvmUEiWRbb3NP7ytH1O2vTDqR4nw/7H1A8LE6SCh7lHCyFjnRfHKHrdpnv1VybA1uORHVmovzThg3a9TYiTbzWoZx+lVjXoPTSb1OX+pQv4Rz9ZpqZPSvicQBR1Z5Ji7VBsWVNaf6f0ZuIS3g2smBv6wmNC9uRcGj93iD7lh+YPwIO+3hBT6qWqfPzi+KYrT6QZCfluqj1c2eAbxqryzNNZ0By3WwKyI7kxqIIHQAjLjOoVvX4Z0PQC+7pm+svFiOWTOwm6VwCa/Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7X4nU8QUz7lyxxK7QW6foeid3hCiKPfepjQ6Rv2MzjA=;
 b=RzPdkCp+FtjYo8peFkPfU4fcBxhccCDJz7GVq1Gd7WVyqdgANnTPjKxUonvZQOr4frcI4Gi8f3YtaIS5K8dvMHeErC3SlWuxc6wgqhgrrDdvUawPkvypJiyT58084KNep1hoT6z8Y4f/eO9x3dB9085GEwnTyBrDg2tbHnDktmqfXaEUp1jFfCUKrIqlvmOWLatRRwzlvuH4VSP9QnQRI0/GIKdVgI/wXgmwQ3lxsjKmNbw/feEl7y4FPrASMx8GE2c3UCOzK0K5rwq96Fx0YP/9mjnkXz6Xb3e+dOCc6/z3cW4kmQBek30+6eKD3nUlD9Wt0srTNoB82Zqn8TMZKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8937.namprd11.prod.outlook.com (2603:10b6:208:57c::14)
 by PH7PR11MB7027.namprd11.prod.outlook.com (2603:10b6:510:20a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 06:18:17 +0000
Received: from IA3PR11MB8937.namprd11.prod.outlook.com
 ([fe80::fdb2:e2ba:9504:5adc]) by IA3PR11MB8937.namprd11.prod.outlook.com
 ([fe80::fdb2:e2ba:9504:5adc%7]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 06:18:16 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 3/3] tests/kms_pipe_crc_basic: Add MST
 suspend-resume test
Thread-Topic: [PATCH i-g-t 3/3] tests/kms_pipe_crc_basic: Add MST
 suspend-resume test
Thread-Index: AQHconnkKTaEbfrRekqgkA8Xp0IxIrWcZDGg
Date: Tue, 3 Mar 2026 06:18:16 +0000
Message-ID: <IA3PR11MB89376E3F2DABB48968A51817E37FA@IA3PR11MB8937.namprd11.prod.outlook.com>
References: <20260220152239.276034-1-kunal1.joshi@intel.com>
 <20260220152239.276034-4-kunal1.joshi@intel.com>
In-Reply-To: <20260220152239.276034-4-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8937:EE_|PH7PR11MB7027:EE_
x-ms-office365-filtering-correlation-id: 73783a29-1e0f-4285-90c8-08de78eca880
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: jztVKOhNN5g2qUtpkveUFrNbU1R8IuU5rbKpzLYYFO9XNWGXIm9FFzbYxCtAtpN4/e0wP29LqXnd3/qGNujL5XNIz7E/zSkF3NHgNpqjL6Takp1n7P5WZ0Kb2Zj4Cw+3DvTpMjWoBtOt0FDwjCpkRfONj8arfTxwSAwqz0Mt+5AndGZhuh6G7kvFvh5q15gKxUs5pyzkDiXrV2gcr3syzwjdZ0Lut/xmD/xTk62lFQ1Gg3dj208A3/f83kXOkm6pjtpDMEJu5HxQVzyaIgp4WumtffFBQYy3b62Q+k+L+sKdtjo3gI7Qwwfsn21l+a2/2L2/rZer/vxQVrtEfgI80s/EiYxeL5bYsiFtjGg/2SlHroHwywvcNSaIV46W3g5dyrNR8EVtxLaExlnNgoFpknScWTGcMh6ZVbK9fzmuA7H6vUBrr5nbrfFIRQSCGs+GPMUWWntMEyfSdJHNukk/ohOcpNd4TzrV+6Vig4iVMqzx41NCw64d/c6VltauWj95E+RP2plmx3D2vtrGV27rP1fI+HymwejNL/nuhsOY9BTXQ68qPjjevh8FaZW4Ci2ff9CLJH+dcGwTYiXXGXq4rTCqGXBAER7gpScaY2qWzz/9TAJuo+WnbSbcLkY1Plt8w+HvHvM/NTzthO2/xZaAiF7VuwHJoTSHh2noKrJHgJNmzbQ1qIGCk/xDyr3jdXQ60G+gVZV7e3CQCGvVR6vTB7xB1adF71QLPBAqT6P2tUALFUaaa4IQquGcaSrrcDHvBHiFQ29qhw36ECJoZhfanuz6at2MxliX0Wee4X3kpvk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8937.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YOor7LmkmBnBKB4DnCZSHI6pPX8le8apbn0urKGxYiu55R3/cVxZs8oWIf9R?=
 =?us-ascii?Q?pcr+CslMVR4kuHU7nulIYH2W1wRJfVYHk3zAF9Sm2LboEJlbWRe7zx0hmM+V?=
 =?us-ascii?Q?Ll9um7dCnu6FTQJRUjO3aeEB+ZCrAsRAv28N8JYDz4vU+8Y7C6eP30UHhfpE?=
 =?us-ascii?Q?8B3o0D1NlG6P0Yfkt6faqqpqtjlRjDRVXK2nnFsYAsgWihhUG6124eVSR1Pt?=
 =?us-ascii?Q?79kbBxPTDgEt7iHmshH1/gYi1L9qgqiIWBNBoPjMUPDJJfnQT0gemeabrT7q?=
 =?us-ascii?Q?xmSo6jGWzpn/heA7qvQ2nsDHnuacGMYATccvMDeTUkV4xI+037bvmvSZ+N59?=
 =?us-ascii?Q?JJpaXKB3+sfEGR/4YqAZQVFzBOmUHnnUcPvcvfRb96MqU3UIfmxu5bKad68T?=
 =?us-ascii?Q?Dp0y9NIRiegsBXsiydOCNDpEu/o1e3cQ97Tn1RQ7IBgUmupftWSSp5SB0B1S?=
 =?us-ascii?Q?chQ3IDOzJ+WpVHl7RDb7GGS4zhmgtKThFqWwwyFsJ0iDLCTWrxnOCGQ5RSEA?=
 =?us-ascii?Q?lU57zCB4t6nYtIkEl+hS84av/VRrXFzqS9go631d9IrczTCoqEKJwlC87ga1?=
 =?us-ascii?Q?0qDv5hHddxaYlE2ON+XLdCquAU9h0Na69XPFWuful24YpYEsHzgxyZ6LoIdd?=
 =?us-ascii?Q?qix3tx792SqwmmeW830ZLSSfjOMlHbS4jMVlDAYsDWO4D3TnZfboPDGMZFhu?=
 =?us-ascii?Q?lt8lTjUld5glEvO6r8sonzZGTrz0Tyxn8FoPjT9KpjYfyHYRjxTfpcwf7iWQ?=
 =?us-ascii?Q?5zWGPnHU/h5gMHdKri1hOIs9Pcvq3zii1g72MJ4SsaqZ71i5YxC+KCDRkEWO?=
 =?us-ascii?Q?xxv4PNh38NON4hDyV8Of5yZtKT0puff8sYsGGPsbTgxIRHKJXCz2tBsSg3x3?=
 =?us-ascii?Q?yu1XArWtD8JNtqo9g3vTzAaPbpgQbYl8TZqCBIHhV+/EXrFcI9okJTs61qu5?=
 =?us-ascii?Q?Dvj7nrDAlMDdMWSmeT21/yf7wHcWOODu/GKTpDorD21FPpA4enw4+lgJsxqY?=
 =?us-ascii?Q?h5Pm+cTuNLoOCUufqrb4HoV9+FxFgu5QaubcrBo/cBZLvi3+G6Cr0eKBxl5X?=
 =?us-ascii?Q?yZjKkbaYMxUx9LtQSl8VWvUw9Q1ID1Cfh5j3wcLFJmVOQCQz/47UfKJ5k5CU?=
 =?us-ascii?Q?rLb9XgDbByM0jEceMf3PAwtQ1dQG+PBn4h/e4luCN/2gm9KTI+0hLxMKcWmc?=
 =?us-ascii?Q?wQ8M2O/00ETx6r2G7wSdEE2tsmoGRz2wIhZi7FOfAa71dxsvJJbByOwAWy50?=
 =?us-ascii?Q?2e2mvUUaM5/imbGZjY8d7fUUgQxTW/OtSFori0hXkeRA2O1sYgt6OyqI10L0?=
 =?us-ascii?Q?zqxMp6MMzXZq5jLiOh+dJPsXJ+7qhdQ39L4zDNTjFF5DM5fsyun3AF7vcg24?=
 =?us-ascii?Q?u41yhVw44XRSyZiQ5+YVJh1nIMh1lCBK1VKC7XfSw0qk91R01xRV2FaIJGL7?=
 =?us-ascii?Q?6zmQ5SXA14VvwdvQ7qIVWQvaOiy/BrL2Eb0LizNlqjHevff5wbcpCFyKLanr?=
 =?us-ascii?Q?7pxw9dN9G00paufmaCEgEkON37JGICqUbMB1MWi6F2oV1boB89P1ei9xNYeV?=
 =?us-ascii?Q?KQ9rNsfVTPtWXlHN09ff+wvkvsK9GaJujllD0aLMFQpqtXDlE1xQhvYKYIzj?=
 =?us-ascii?Q?VjIkdZoF/hvLDsBBXfm/9yuRRypUanypEDyUqQWd9Yk0Uvs6h8Y7VEVniwbL?=
 =?us-ascii?Q?2QrdtVZte3BVezBXYzhcZ3CPJHRyrYc6b2utYevKRUXmyvjQ0bhQL4QcAYHt?=
 =?us-ascii?Q?K1TVYbQ1Ig=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8937.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73783a29-1e0f-4285-90c8-08de78eca880
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 06:18:16.7589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bxQxNdvSxtzmarvZNWasp0WMvheJhSEy8wBKkX3Cl220iT9MqbR1Q4XX5XUKBufYzFDEFxht9B3JHAFrF7byDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7027
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

> Subject: [PATCH i-g-t 3/3] tests/kms_pipe_crc_basic: Add MST suspend-
> resume test
>=20
> Add a new subtest mst-suspend-read-crc that verifies MST outputs preserve
> display content (via CRC comparison) across S3 suspend/resume.
>=20
> The test enumerates all connected DP MST topologies, and for each root
> connector exercises all non-empty subsets of the discovered MST outputs.
> For each subset it:
>  - Assigns pipes and selects non-joiner modes
>  - Fits modes within bandwidth constraints
>  - Creates green FBs, commits, and collects pre-suspend CRCs
>  - Suspends to memory and resumes
>  - Collects post-suspend CRCs and asserts they match
>=20
> v2:
> - Add error handling for igt_pipe_crc_new (Thasleem)
> - Improve log format with index for clarity (Thasleem)
> - Order declarations in decreasing line length (Thasleem)
> - Add print message when no MST found (Thasleem)
> - Add bounds check for idx in subset loop (Thasleem)
> - Use igt_crtc_crc_new() instead of igt_pipe_crc_new() (Ville)
>=20
> v3:
> - framebuffers missing in commit (Bilal)
>=20
> v4:
> - Drop cleanup framework
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/kms_pipe_crc_basic.c | 314
> +++++++++++++++++++++++++++++++++++++
>  tests/meson.build          |   3 +
>  2 files changed, 317 insertions(+)
>=20
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c inde=
x
> f7b6ec293..59a44e92e 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -32,7 +32,10 @@
>=20
>  #include "igt.h"
>  #include "igt_sysfs.h"
> +#include "intel/kms_mst_helper.h"
> +#include "intel/kms_joiner_helper.h"

Usually you would want this declared under the below standard libraries

>  #include <errno.h>
> +#include <limits.h>
>  #include <stdbool.h>
>  #include <stdio.h>
>  #include <string.h>
> @@ -77,6 +80,11 @@
>   *              CRTC does not cause issues.
>   */
>=20
> +/**
> + * SUBTEST: mst-suspend-read-crc
> + * Description: MST suspend test for pipe CRC reads.
> + */
> +
>  static bool extended;
>  static enum pipe active_pipes[IGT_MAX_PIPES];  static uint32_t last_pipe=
;
> @@ -96,6 +104,306 @@ static struct {
>  	{ .r =3D 0.0, .g =3D 1.0, .b =3D 1.0 },
>  };
>=20
> +#define MAX_MST_OUTPUT 3
> +
> +static void collect_single_crc(igt_crtc_t *crtc, igt_crc_t *crc) {
> +	igt_pipe_crc_t *pipe_crc;
> +
> +	pipe_crc =3D igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
> +	igt_assert(pipe_crc);
> +	igt_pipe_crc_collect_crc(pipe_crc, crc);
> +	igt_pipe_crc_free(pipe_crc);
> +}
> +
> +static void collect_crc_for_active_outputs(igt_output_t **outputs,
> +					   int num_outputs,
> +					   igt_crc_t *crcs,
> +					   bool post_suspend)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < num_outputs; i++) {
> +		igt_output_t *output =3D outputs[i];
> +		igt_crtc_t *crtc =3D igt_output_get_driving_crtc(output);
> +
> +		if (post_suspend)
> +			igt_require_f(crtc,
> +				      "POST-SUSPEND: no driving CRTC for %s
> (topology changed?)\n",
> +				      output->name);
> +		else
> +			igt_assert_f(crtc,
> +				     "PRE-SUSPEND: no driving CRTC for %s
> (bad pipe assignment?)\n",
> +				     output->name);
> +
> +		collect_single_crc(crtc, &crcs[i]);
> +	}
> +}
> +
> +static void wait_for_vblanks(igt_output_t **outputs, int num_outputs,
> +			     bool post_suspend)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < num_outputs; i++) {
> +		igt_crtc_t *crtc =3D igt_output_get_driving_crtc(outputs[i]);
> +
> +		if (post_suspend)
> +			igt_require_f(crtc,
> +				      "POST-SUSPEND: no driving CRTC for %s
> during vblank wait (topology changed?)\n",
> +				      outputs[i]->name);
> +		else
> +			igt_assert_f(crtc,
> +				     "PRE-SUSPEND: no driving CRTC for %s
> during vblank wait (bad pipe assignment?)\n",
> +				     outputs[i]->name);
> +
> +		igt_wait_for_vblank(crtc);
> +	}
> +}
> +
> +static void log_crc_for_outputs(igt_output_t **outputs, int num_outputs,
> +				igt_crc_t *crcs, const char *stage) {
> +	int i;
> +
> +	for (i =3D 0; i < num_outputs; i++) {
> +		igt_output_t *o =3D outputs[i];
> +		drmModeModeInfo *m =3D igt_output_get_mode(o);
> +		char *s =3D igt_crc_to_string(&crcs[i]);
> +		igt_crtc_t *crtc =3D igt_output_get_driving_crtc(o);
> +
> +		igt_info("[%d] %s: output %s -> crtc %s, CRC %s, mode
> %dx%d@%d\n",
> +			 i, stage, o->name,
> +			 igt_crtc_name(crtc),
> +			 s,
> +			 m ? m->hdisplay : -1,
> +			 m ? m->vdisplay : -1,
> +			 m ? m->vrefresh : 0);
> +		free(s);
> +	}
> +}
> +
> +/*
> + * Select non-joiner modes for all outputs to ensure CRC collection work=
s.
> + * Joiner configurations consume multiple pipes and are not yet validate=
d
> here.
> + * Must be called before igt_fit_modes_in_bw() so that bandwidth
> +fitting uses
> + * the correct (non-joiner) modes.
> + */

Lets remove documentation here this is a static function
More over the code should be self explanatory.

> +static void select_non_joiner_modes(int drm_fd, igt_output_t **outputs,
> +				    int num_outputs)
> +{
> +	int max_dotclock =3D igt_get_max_dotclock(drm_fd);
> +	int i;
> +
> +	if (max_dotclock <=3D 0)
> +		max_dotclock =3D INT_MAX;
> +
> +	for (i =3D 0; i < num_outputs; i++) {
> +		igt_output_t *output =3D outputs[i];
> +		drmModeModeInfo non_joiner_mode;
> +
> +		igt_require_f(max_non_joiner_mode_found(drm_fd,
> +							output-
> >config.connector,
> +							max_dotclock,
> +							&non_joiner_mode),
> +			      "No non-joiner mode found for %s\n",
> +			      output->name);
> +		igt_output_override_mode(output, &non_joiner_mode);
> +	}
> +}
> +
> +static void create_fbs_for_outputs(int drm_fd, igt_output_t **outputs,
> +				   int num_outputs, struct igt_fb *fbs) {
> +	int i;
> +
> +	for (i =3D 0; i < num_outputs; i++) {
> +		igt_output_t *output =3D outputs[i];
> +		drmModeModeInfo *mode =3D igt_output_get_mode(output);
> +		igt_plane_t *primary;
> +
> +		igt_require_f(mode, "No mode available for output %s\n",
> +output->name);
> +
> +		primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> +
> +		igt_create_color_fb(drm_fd,
> +				    mode->hdisplay, mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_LINEAR,
> +				    0.0, 1.0, 0.0,  /* Green color */
> +				    &fbs[i]);
> +		igt_plane_set_fb(primary, &fbs[i]);
> +	}
> +}
> +
> +static void run_mst_subset_and_verify(igt_display_t *display,
> +				      igt_output_t **active_outputs,
> +				      int num_active,
> +				      int n_crtcs,
> +				      uint32_t master_pipes_mask,
> +				      uint32_t valid_pipes_mask)
> +{
> +	igt_crc_t pre_crcs[MAX_MST_OUTPUT];
> +	igt_crc_t post_crcs[MAX_MST_OUTPUT];
> +	struct igt_fb fbs[MAX_MST_OUTPUT];
> +	uint32_t used_pipes_mask =3D 0;
> +	enum igt_suspend_test stest =3D SUSPEND_TEST_NONE;
> +	int drm_fd =3D display->drm_fd;
> +	int a;
> +
> +	igt_require_f(num_active <=3D n_crtcs,
> +		      "Not enough crtcs for MST subset\n");
> +
> +	igt_require(igt_assign_pipes_for_outputs(drm_fd,
> +						 active_outputs,
> +						 num_active,
> +						 n_crtcs,
> +						 &used_pipes_mask,
> +						 master_pipes_mask,
> +						 valid_pipes_mask));
> +
> +	select_non_joiner_modes(drm_fd, active_outputs, num_active);
> +
> +	igt_require_f(igt_fit_modes_in_bw(display),
> +		      "Unable to fit modes in bw\n");
> +
> +	create_fbs_for_outputs(drm_fd, active_outputs, num_active, fbs);
> +
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	/* rtcwake cmd is not supported on MTK devices */
> +	if (is_mtk_device(drm_fd))
> +		stest =3D SUSPEND_TEST_DEVICES;
> +
> +	igt_info("MST subset: %d outputs, n_crtcs=3D%d\n",
> +		 num_active, n_crtcs);
> +
> +	wait_for_vblanks(active_outputs, num_active, false);
> +	wait_for_vblanks(active_outputs, num_active, false);
> +
> +	collect_crc_for_active_outputs(active_outputs,
> +				       num_active,
> +				       pre_crcs, false);
> +
> +	log_crc_for_outputs(active_outputs, num_active, pre_crcs,
> +"PRE-SUSPEND");
> +
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, stest);
> +
> +	wait_for_vblanks(active_outputs, num_active, true);
> +	wait_for_vblanks(active_outputs, num_active, true);
> +
> +	collect_crc_for_active_outputs(active_outputs,
> +				       num_active,
> +				       post_crcs, true);
> +
> +	log_crc_for_outputs(active_outputs, num_active, post_crcs,
> +"POST-SUSPEND");
> +
> +	for (a =3D 0; a < num_active; a++)
> +		igt_assert_crc_equal(&pre_crcs[a], &post_crcs[a]);
> +
> +	/* Detach FBs from planes and remove them to leave a clean state */
> +	for (a =3D 0; a < num_active; a++) {
> +		igt_plane_t *primary =3D
> +			igt_output_get_plane_type(active_outputs[a],
> +
> DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(primary, NULL);
> +		igt_remove_fb(drm_fd, &fbs[a]);
> +	}
> +}
> +
> +static void mst_suspend_read_crc(igt_display_t *display) {
> +	int n_crtcs =3D igt_display_n_crtcs(display);
> +	igt_output_t *active_outputs[MAX_MST_OUTPUT];
> +	/*
> +	 * igt_find_all_mst_output_in_topology() internally caps
> +	 * discovery at IGT_MAX_PIPES entries, so this is the
> +	 * correct upper bound for the buffer.
> +	 */

Never seen a comment over a variable declaration. Makes me wonder if this c=
omment
Belongs elsewhere ?
Also can we group all structs together then int then ... while declaring se=
ems more cleaner that way

This is just what I see at the first pass of this patch I  am still going t=
hrough the logic would appreciate it
If you could hold off on another revision till I get the time to verify the=
 logic

Regards,
Suraj Kandpal

> +	igt_output_t *mst_outputs[IGT_MAX_PIPES];
> +	/* Fixed upper bound for tracking traversed root connectors. */
> +	int traversed_roots[IGT_MAX_PIPES] =3D { 0 };
> +	int drm_fd =3D display->drm_fd;
> +	uint32_t valid_pipes_mask =3D 0;
> +	int num_mst, i, num_active;
> +	uint32_t master_pipes_mask;
> +	igt_output_t *output;
> +	igt_crtc_t *crtc;
> +	int num_roots =3D 0;
> +
> +	for_each_crtc(display, crtc)
> +		valid_pipes_mask |=3D BIT(crtc->pipe);
> +
> +	igt_set_all_master_pipes_for_platform(display,
> &master_pipes_mask);
> +
> +	for_each_connected_output(display, output) {
> +		int root_id;
> +		bool root_seen =3D false;
> +
> +		root_id =3D igt_get_dp_mst_connector_id(output);
> +		if (root_id < 0) {
> +			igt_info("Skipping non-mst output %s\n", output-
> >name);
> +			continue;
> +		}
> +
> +		for (i =3D 0; i < num_roots; i++)
> +			if (traversed_roots[i] =3D=3D root_id)
> +				root_seen =3D true;
> +
> +		if (root_seen)
> +			continue;
> +
> +		num_mst =3D 0;
> +		igt_require(igt_find_all_mst_output_in_topology(drm_fd,
> display,
> +							output, mst_outputs,
> +							&num_mst) =3D=3D 0);
> +		igt_assert_f(num_mst <=3D IGT_MAX_PIPES,
> +			     "MST topology discovery overflow: num_mst=3D%d >
> IGT_MAX_PIPES=3D%d\n",
> +			     num_mst, IGT_MAX_PIPES);
> +		if (num_mst =3D=3D 0) {
> +			igt_info("No MST outputs found in topology for output
> %s\n",
> +				 output->name);
> +			igt_skip("No MST outputs found in topology\n");
> +		}
> +
> +		if (num_roots < IGT_MAX_PIPES)
> +			traversed_roots[num_roots++] =3D root_id;
> +
> +		if (num_mst > MAX_MST_OUTPUT)
> +			num_mst =3D MAX_MST_OUTPUT;
> +
> +		igt_dynamic_f("mst-root-%d", root_id) {
> +			int mask;
> +
> +			for (mask =3D 1; mask < (1 << num_mst); mask++) {
> +				int bit, idx =3D 0;
> +
> +				/* build subset for this bitmask */
> +				for (bit =3D 0; bit < num_mst; bit++) {
> +					if (!(mask & (1 << bit)))
> +						continue;
> +
> +					if (idx >=3D MAX_MST_OUTPUT)
> +						break;
> +
> +					active_outputs[idx++] =3D
> mst_outputs[bit];
> +				}
> +
> +				num_active =3D idx;
> +				if (!num_active)
> +					continue;
> +
> +				igt_display_reset(display);
> +
> +				run_mst_subset_and_verify(display,
> active_outputs,
> +							  num_active,
> n_crtcs,
> +							  master_pipes_mask,
> +							  valid_pipes_mask);
> +			}
> +		}
> +	}
> +}
> +
>  static bool simulation_constraint(igt_crtc_t *crtc)  {
>  	if (igt_run_in_simulation() && !extended && @@ -525,6 +833,12 @@
> int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  		}
>  	}
>=20
> +	igt_describe("MST suspend test for pipe CRC reads.");
> +	igt_subtest_with_dynamic("mst-suspend-read-crc") {
> +		igt_require(igt_display_has_mst_output(&data.display));
> +		mst_suspend_read_crc(&data.display);
> +	}
> +
>  	igt_fixture() {
>  		igt_display_fini(&data.display);
>  		drm_close_driver(data.drm_fd);
> diff --git a/tests/meson.build b/tests/meson.build index
> 7f356de9b..06c0d8e98 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -399,6 +399,9 @@ extra_sources =3D {
>             join_paths ('intel', 'kms_joiner_helper.c') ],
>  	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
>  	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
> +	'kms_pipe_crc_basic': [
> +		join_paths ('intel', 'kms_mst_helper.c'),
> +		join_paths ('intel', 'kms_joiner_helper.c') ],
>  	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],  }
>=20
> --
> 2.43.0

