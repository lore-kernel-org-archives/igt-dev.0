Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C2AFCC9B4
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 04:49:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A11B10E648;
	Tue, 10 Mar 2026 04:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OCh8mz/+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424B210E648
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 04:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773118181; x=1804654181;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=atEto2zI9/WBhx7OiNJnVi+5QobDUe5Spqnnuc46jQw=;
 b=OCh8mz/+rw6Mhj9JMXkIRt+T0isbyxrTDEvFXHki5v0SUw09ug9aDqI4
 Zm8byk4mHuKYcUqF4uOxGE4DLWKkKLGu5LD8QUPHMjMP7dXJ2pZKc8bB/
 nYSkAKdCjuufHKADvOtF5BEHwcwRjRyVANGGr24SuyO27Ti3clRQy+x1e
 rLbXp9Mj3unkfBFn5Ar5M1MntRJLwcotAT5dLdsXbci9QvMUiGjpS1hWK
 IIWCAQS+5MCobVOPNSmaYy1IRc2SQ8Fi4Bfa8hiJLISBiULF8hcpNcJqS
 UCaa64rFRmKOKZOL9jpQLP1FUgcSq6+eSB0KHovxUDI94fiaGd1Sy9bdv Q==;
X-CSE-ConnectionGUID: cJ/JGecWRK28QmuUWQpt9w==
X-CSE-MsgGUID: mmseSlTeTmexFskbkKjp/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73353905"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="73353905"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 21:49:41 -0700
X-CSE-ConnectionGUID: 1mNwNVtVQHWYe4YOpGrp/A==
X-CSE-MsgGUID: Ct/rtcUJTqGXS4XCNXe6ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="216403292"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 21:49:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 21:49:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 21:49:36 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 21:49:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhrsU/iJFNM7N3tVjvPZ1ppumaW5yprFvXlmuZKBfwVcaMkBsg6Yg+GyfWXVgNyfF7Zz5Y/ASBNfXiGDv6+kwUTQ/8SqMFSTw6KzkHOx44hEq1DoIH4XxQsQiVWVe8iYAU9tARxYxHttW0gJn6TGkzZSfNFgrDeZUjDpbp/svPUI5zx/rzQ6jFF3uW5suRB1Zoy/2OugWO9NEcZqVka7qpGfhyscz3eLXr6YLjz8dyTOo0V/ulfrDHueaTRs2aiJdqHACGeO5f/eU1/vH5BMaEPVn/cL8fjRmrG3LPEemxIN+xd64xDxnCqdbqYI3lEkd4l92mFiSOT3JhSmEEtUBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRk6Te5vmP9aHkDUY1Zq1QvhwIHqcmGWIX+gIACMzYk=;
 b=fhimFnjXgjYrw62L2oRV7eY7DKPkFwWyXI7QlVp7QqUE2Qla+va1TE64ZhIRRY41cnvZv0xBzvcY3DTwKVwu7uO1tqHX63232WH7M4alWetksFtrW6f6Taf6YkUcwFTASLnJawQRPbwjIFF8k8LYjXTP7wr5B2EOxob2dl78Ms70lenQvPfJkdMj85iz3zFYgVqERdx2GZzC8mZKiHBZQ6l3poLLbHE6cVk9xFNVa3p3KS3UT45NVmZly7KdHHa/cAz/x/T4Xseq/71zZA7QHhZP+Yg9BM4naEDvvGucMhfG32JLRWs4nPcaDXWGnoOKN3shedaAkQJuTLp+LcGLgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA1PR11MB8794.namprd11.prod.outlook.com
 (2603:10b6:806:46a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 04:49:29 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::21ae:7048:11eb:3faa]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::21ae:7048:11eb:3faa%6]) with mapi id 15.20.9678.017; Tue, 10 Mar 2026
 04:49:29 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 3/3] tests/kms_pipe_crc_basic: Add MST
 suspend-resume test
Thread-Topic: [PATCH i-g-t 3/3] tests/kms_pipe_crc_basic: Add MST
 suspend-resume test
Thread-Index: AQHconnkKTaEbfrRekqgkA8Xp0IxIrWcZDGggArntWA=
Date: Tue, 10 Mar 2026 04:49:29 +0000
Message-ID: <DM3PPF208195D8DEC913CD6D3D55AB6CA39E346A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260220152239.276034-1-kunal1.joshi@intel.com>
 <20260220152239.276034-4-kunal1.joshi@intel.com>
 <IA3PR11MB89376E3F2DABB48968A51817E37FA@IA3PR11MB8937.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB89376E3F2DABB48968A51817E37FA@IA3PR11MB8937.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA1PR11MB8794:EE_
x-ms-office365-filtering-correlation-id: c9e5f910-6f9d-4147-1c99-08de7e6069e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: iKHdJPJ6GEk8qEwHdR9Lth5yud1mjCAhrY9eSi8f+2vle7RgA1MbdRuwKYnVs32thgdYyjZDVQxajsK3z9bQNZbA3qr9+UODK3fVYX+cVrjt/mFa9PJC7U4tNs3sdOwccMX7jo2saR731M9QpsSOxStlIM2xi/oht1GdG6e0+8MzDPI8Zj0CLClGhZ3AEf3FWrkQbIuc7nqHdqRiC0lxWPQDVJBdoVeixq4b8JvwoHxs0LbMKLPJxJTZ+GV6YINe4V0auuqdgUBBq6awktprLbVYpvoASJ5O/Cx3cRpv7UjZ0hMr6kKY0L/W7W3PqQB+uWinZcxdA1+ydSWzZ6R4XD4Pv5d45FvqwvRdjwd64AiQRTHdotcuIcwCxNfAkT6kIhMiNd4Xr9jUYzJdrzV70CeopoNFpfoph/K+SXyzF4IJmKwnJcM3cnS31g0c76iUmXwKVK6r3I40WR834zEFEU220hN18Hebc6UHnz55wOFw1W+o/LNyxZn2YWWXTyjxXP6Gy4AUYUDh8dYZwmyIlfdAqVo1hTb3gUhfz0vrqkySxYQCL3h0oZ90Qwds1V8Hq+/qcrGgaAmiwklBq1PvKf3DNF+5JGO8uZKULy0C/9LOC61tH6sw+d24DU6Es/DaCLwMEY/wuAnWfGfowqVsAdQKHFlV0XEZBdjO8zDSfYiwe/6XKb+RdVm7DUh1U/asYQ0ZHRq9Pq+qsuV9grI1C2/n/eJ7Ffr5y+qinMOiBjRVDIFzUN+wjXol1D4TgWcHFBY1dJYuTHBlBxZzdCEfuLxdDTkWmcNOIn35eOqgdB0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lVAcI/AeM6oFuIiknhMvZTAs4fFfcqxgedWRpJJIFFDeEzQvOCsBe9J3Z3kS?=
 =?us-ascii?Q?7waPtkqfhv3bIrW3BAfYZ1WdsPSwx4w216gHbY6dg+ewceY6VPOqT7OmsMJR?=
 =?us-ascii?Q?VeOeJ2OQYhOdytJ04EhWrp4eE/qzcp5mNQgDwV7X9Yy94ym9f4j9kEABkU4v?=
 =?us-ascii?Q?jwxWDw1jaQSNbTXBPJsy9BqFbJUXkVDvnRLRt32fOlyYD6TDehIhmmsjtOyD?=
 =?us-ascii?Q?iUP7d/gx6rYx8GrH0DKZs2e91upXRA2vx9YdpIqx2xR1CgaOLezXrpMGzg1F?=
 =?us-ascii?Q?XvmKAHXZI3K6E7aFzBIsAB5UZmBatqYWOWM/myBeql7vVB9sHaBLKCuujYeP?=
 =?us-ascii?Q?1BR+eQfwugzZoHCVOweyampP/GiURisX5fxJ0cwKUVt9Bt7RrnsOvin4zGmp?=
 =?us-ascii?Q?x+9kbriUZNmRxNiVSYiLzPA8DUiBizYFuWYTO7qdVisR2mo1qqB1lkwG9tzw?=
 =?us-ascii?Q?TxVOSNcXkpzNz7Ub74rzc0ufGNujxD6iQWaxKG4uaJc7adEqHRGhlzbU/kFs?=
 =?us-ascii?Q?E9nODMwfod/Ypmmr483EZiUln0p70We8Zk6S7LRzbwq5cvJuP6UbkdEKrvKB?=
 =?us-ascii?Q?0AeDwoHA4ZnT9dP8Rmn5pNj9wINSdBMaaTBMQpx7REzrFy9UxcFRYRqLUWmS?=
 =?us-ascii?Q?IR0SIBorXTNpDJuwBrT6YeqWVW3locHqDgbW9res6nvs88W5a8ZpdxVufDBQ?=
 =?us-ascii?Q?xOlW7fUj4slK7S/Uwd+kKIgaM0sZDEZdn/YAjt1qUg0cYdGYaC4dMCkbYTPp?=
 =?us-ascii?Q?4HUXw/fJ4DIlTqqGkSv06rlr/a2LLcqDFZM5FDx17CuFo9NRQ9RABLsYDVj+?=
 =?us-ascii?Q?BKpJP1USlyaXYWTbbYNvBMP4ddNexfH79WJmwzGsr6Eqex1OPHttPkrLi3nT?=
 =?us-ascii?Q?jhoWKza2xfEmB3Bekm8wTUg/6jIrDtLwijOOi/cJsURZ2MzZcoe69hP2o8Tj?=
 =?us-ascii?Q?pDItXvzcE1hpSfUrompy7iKjhXo0ia6MfkCWbkQTueZmOcUDEvaO//Bek8OT?=
 =?us-ascii?Q?4TrwyhetJf18SznQWtQ81gk9bWAZfAzXZPzUVhgKa4qAV4kCsPMuN4VmoY2x?=
 =?us-ascii?Q?i+vNiBzLKZ7+OnZaaVrMDmjL+tj//kt3PM22/Rs9K3PuieG26aSiJulPtTIQ?=
 =?us-ascii?Q?y0ivEK9hOtIZLfLy/aN/XUopwBvvowf8EHEdT/voQ7zVIwTZtdhGizooOWgn?=
 =?us-ascii?Q?LKWPcS+AITyRevA0VWCaNNbPYViVUgLzPEDYm6WWGvWVe+BNUvh74wLCtKhJ?=
 =?us-ascii?Q?9RwNOVtLGWrCq/6FzUw5wDAy1wXKz62PcNXrwx9MJ/okJEsU9PnO72xiKp4Q?=
 =?us-ascii?Q?dS2ySn2WOxEqTbdU2ijwkGvA1T06+mdvPwIw7KoSppaF5p5eJ/7/BElvd/P4?=
 =?us-ascii?Q?o5g0gshb5yob+Zm7N1zfP1g6cSSetsNvENXa9VZCxHj2xjHagLoc1Ye717xU?=
 =?us-ascii?Q?2MHmyttnrdpNOAz0M+fswZ8F9QjXaqVs6QKvQdRnXFLSOqbp5SVtp80PxzXZ?=
 =?us-ascii?Q?LhINBqN/2siDPiqaML6jnltQ8GxYqxXuS+WiEhyhlERVAvzV4MMKIr2gzZaP?=
 =?us-ascii?Q?bduN84fxdh5BufmBPrlmoSgQ4ymSq7oYRB8s65r5urTvb1cPi0zse/ZniUZd?=
 =?us-ascii?Q?JK1e5gm+5kxLWK0rZ/18Eel39OedHPa5p2MHmfrF0wHjIZRY/Hmgl2MnoxmY?=
 =?us-ascii?Q?7NeeMyX5lH0JWS6ZjCXMO2hIR1byaw9e8No1zkxuwiLLrF4RCuUZES33CLTR?=
 =?us-ascii?Q?ODytJwF3UQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: T4vqz8MZcI8iz1crHNmWsZaklldZMz6QBWGLBf+qEqwMKXaNJaWaEfH64+/RwglsaPDxdsFmD4FDdm9xbkpbTVcN608J/Z/1YCLYdwXvQrdnGlQE6fDa0uiy3K9Y16ET511S2TTWbNEm+iASgOckp5dpnbHsPDHyyKyvICgxct+gudzMGPNcP+4H1FT8iqDCb7nNhO1lueFcF3LbkaNIjOA9feBE33nUjxDBc2RU5uznliRGnoAPWOMeKys8dOKIQw0fa1TUP73L7ruFHtU5pd61xvuBSf3GRXpNmYT/JhWnFjln6mT8MCVJz0JcOBDZncjMt5BlHaPXMhmRxodxEg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e5f910-6f9d-4147-1c99-08de7e6069e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 04:49:29.1850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oq2CsGVNTH78Ayn7LoGYSQv4ckxmz9XDEGH7V1ao6NUtQC3RpflGcgAEIFii4bv1tbbvGcxwzNXK7AN+t4IxMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8794
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

> Subject: RE: [PATCH i-g-t 3/3] tests/kms_pipe_crc_basic: Add MST suspend-
> resume test
>=20
> > Subject: [PATCH i-g-t 3/3] tests/kms_pipe_crc_basic: Add MST suspend-
> > resume test
> >
> > Add a new subtest mst-suspend-read-crc that verifies MST outputs
> > preserve display content (via CRC comparison) across S3 suspend/resume.
> >
> > The test enumerates all connected DP MST topologies, and for each root
> > connector exercises all non-empty subsets of the discovered MST outputs=
.
> > For each subset it:
> >  - Assigns pipes and selects non-joiner modes
> >  - Fits modes within bandwidth constraints
> >  - Creates green FBs, commits, and collects pre-suspend CRCs
> >  - Suspends to memory and resumes
> >  - Collects post-suspend CRCs and asserts they match
> >
> > v2:
> > - Add error handling for igt_pipe_crc_new (Thasleem)
> > - Improve log format with index for clarity (Thasleem)
> > - Order declarations in decreasing line length (Thasleem)
> > - Add print message when no MST found (Thasleem)
> > - Add bounds check for idx in subset loop (Thasleem)
> > - Use igt_crtc_crc_new() instead of igt_pipe_crc_new() (Ville)
> >
> > v3:
> > - framebuffers missing in commit (Bilal)
> >
> > v4:
> > - Drop cleanup framework
> >
> > Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> > ---
> >  tests/kms_pipe_crc_basic.c | 314
> > +++++++++++++++++++++++++++++++++++++
> >  tests/meson.build          |   3 +
> >  2 files changed, 317 insertions(+)
> >
> > diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> > index f7b6ec293..59a44e92e 100644
> > --- a/tests/kms_pipe_crc_basic.c
> > +++ b/tests/kms_pipe_crc_basic.c
> > @@ -32,7 +32,10 @@
> >
> >  #include "igt.h"
> >  #include "igt_sysfs.h"
> > +#include "intel/kms_mst_helper.h"
> > +#include "intel/kms_joiner_helper.h"
>=20
> Usually you would want this declared under the below standard libraries
>=20
> >  #include <errno.h>
> > +#include <limits.h>
> >  #include <stdbool.h>
> >  #include <stdio.h>
> >  #include <string.h>
> > @@ -77,6 +80,11 @@
> >   *              CRTC does not cause issues.
> >   */
> >
> > +/**
> > + * SUBTEST: mst-suspend-read-crc
> > + * Description: MST suspend test for pipe CRC reads.
> > + */
> > +
> >  static bool extended;
> >  static enum pipe active_pipes[IGT_MAX_PIPES];  static uint32_t
> > last_pipe; @@ -96,6 +104,306 @@ static struct {
> >  	{ .r =3D 0.0, .g =3D 1.0, .b =3D 1.0 },
> >  };
> >
> > +#define MAX_MST_OUTPUT 3
> > +
> > +static void collect_single_crc(igt_crtc_t *crtc, igt_crc_t *crc) {
> > +	igt_pipe_crc_t *pipe_crc;
> > +
> > +	pipe_crc =3D igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
> > +	igt_assert(pipe_crc);
> > +	igt_pipe_crc_collect_crc(pipe_crc, crc);
> > +	igt_pipe_crc_free(pipe_crc);
> > +}
> > +
> > +static void collect_crc_for_active_outputs(igt_output_t **outputs,
> > +					   int num_outputs,
> > +					   igt_crc_t *crcs,
> > +					   bool post_suspend)
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < num_outputs; i++) {
> > +		igt_output_t *output =3D outputs[i];
> > +		igt_crtc_t *crtc =3D igt_output_get_driving_crtc(output);
> > +
> > +		if (post_suspend)
> > +			igt_require_f(crtc,
> > +				      "POST-SUSPEND: no driving CRTC for %s
> > (topology changed?)\n",
> > +				      output->name);
> > +		else
> > +			igt_assert_f(crtc,
> > +				     "PRE-SUSPEND: no driving CRTC for %s
> > (bad pipe assignment?)\n",
> > +				     output->name);
> > +
> > +		collect_single_crc(crtc, &crcs[i]);
> > +	}
> > +}
> > +
> > +static void wait_for_vblanks(igt_output_t **outputs, int num_outputs,
> > +			     bool post_suspend)
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < num_outputs; i++) {
> > +		igt_crtc_t *crtc =3D igt_output_get_driving_crtc(outputs[i]);
> > +
> > +		if (post_suspend)
> > +			igt_require_f(crtc,
> > +				      "POST-SUSPEND: no driving CRTC for %s
> > during vblank wait (topology changed?)\n",
> > +				      outputs[i]->name);
> > +		else
> > +			igt_assert_f(crtc,
> > +				     "PRE-SUSPEND: no driving CRTC for %s
> > during vblank wait (bad pipe assignment?)\n",
> > +				     outputs[i]->name);
> > +
> > +		igt_wait_for_vblank(crtc);
> > +	}
> > +}
> > +
> > +static void log_crc_for_outputs(igt_output_t **outputs, int num_output=
s,
> > +				igt_crc_t *crcs, const char *stage) {
> > +	int i;
> > +
> > +	for (i =3D 0; i < num_outputs; i++) {
> > +		igt_output_t *o =3D outputs[i];
> > +		drmModeModeInfo *m =3D igt_output_get_mode(o);
> > +		char *s =3D igt_crc_to_string(&crcs[i]);
> > +		igt_crtc_t *crtc =3D igt_output_get_driving_crtc(o);
> > +
> > +		igt_info("[%d] %s: output %s -> crtc %s, CRC %s, mode
> > %dx%d@%d\n",
> > +			 i, stage, o->name,
> > +			 igt_crtc_name(crtc),
> > +			 s,
> > +			 m ? m->hdisplay : -1,
> > +			 m ? m->vdisplay : -1,
> > +			 m ? m->vrefresh : 0);
> > +		free(s);
> > +	}
> > +}
> > +
> > +/*
> > + * Select non-joiner modes for all outputs to ensure CRC collection wo=
rks.
> > + * Joiner configurations consume multiple pipes and are not yet
> > +validated
> > here.
> > + * Must be called before igt_fit_modes_in_bw() so that bandwidth
> > +fitting uses
> > + * the correct (non-joiner) modes.
> > + */
>=20
> Lets remove documentation here this is a static function More over the co=
de
> should be self explanatory.
>=20
> > +static void select_non_joiner_modes(int drm_fd, igt_output_t **outputs=
,
> > +				    int num_outputs)
> > +{
> > +	int max_dotclock =3D igt_get_max_dotclock(drm_fd);
> > +	int i;
> > +
> > +	if (max_dotclock <=3D 0)
> > +		max_dotclock =3D INT_MAX;
> > +
> > +	for (i =3D 0; i < num_outputs; i++) {
> > +		igt_output_t *output =3D outputs[i];
> > +		drmModeModeInfo non_joiner_mode;
> > +
> > +		igt_require_f(max_non_joiner_mode_found(drm_fd,
> > +							output-
> > >config.connector,
> > +							max_dotclock,
> > +							&non_joiner_mode),
> > +			      "No non-joiner mode found for %s\n",
> > +			      output->name);
> > +		igt_output_override_mode(output, &non_joiner_mode);
> > +	}
> > +}
> > +
> > +static void create_fbs_for_outputs(int drm_fd, igt_output_t **outputs,
> > +				   int num_outputs, struct igt_fb *fbs) {
> > +	int i;
> > +
> > +	for (i =3D 0; i < num_outputs; i++) {
> > +		igt_output_t *output =3D outputs[i];
> > +		drmModeModeInfo *mode =3D igt_output_get_mode(output);
> > +		igt_plane_t *primary;
> > +
> > +		igt_require_f(mode, "No mode available for output %s\n",
> > +output->name);
> > +
> > +		primary =3D igt_output_get_plane_type(output,
> > DRM_PLANE_TYPE_PRIMARY);
> > +
> > +		igt_create_color_fb(drm_fd,
> > +				    mode->hdisplay, mode->vdisplay,
> > +				    DRM_FORMAT_XRGB8888,
> > +				    DRM_FORMAT_MOD_LINEAR,
> > +				    0.0, 1.0, 0.0,  /* Green color */

No need to add comment mentioning green color

> > +				    &fbs[i]);
> > +		igt_plane_set_fb(primary, &fbs[i]);
> > +	}
> > +}
> > +
> > +static void run_mst_subset_and_verify(igt_display_t *display,
> > +				      igt_output_t **active_outputs,
> > +				      int num_active,
> > +				      int n_crtcs,
> > +				      uint32_t master_pipes_mask,
> > +				      uint32_t valid_pipes_mask)
> > +{
> > +	igt_crc_t pre_crcs[MAX_MST_OUTPUT];
> > +	igt_crc_t post_crcs[MAX_MST_OUTPUT];
> > +	struct igt_fb fbs[MAX_MST_OUTPUT];
> > +	uint32_t used_pipes_mask =3D 0;
> > +	enum igt_suspend_test stest =3D SUSPEND_TEST_NONE;
> > +	int drm_fd =3D display->drm_fd;
> > +	int a;
> > +
> > +	igt_require_f(num_active <=3D n_crtcs,
> > +		      "Not enough crtcs for MST subset\n");
> > +
> > +	igt_require(igt_assign_pipes_for_outputs(drm_fd,
> > +						 active_outputs,
> > +						 num_active,
> > +						 n_crtcs,
> > +						 &used_pipes_mask,
> > +						 master_pipes_mask,
> > +						 valid_pipes_mask));
> > +
> > +	select_non_joiner_modes(drm_fd, active_outputs, num_active);
> > +
> > +	igt_require_f(igt_fit_modes_in_bw(display),
> > +		      "Unable to fit modes in bw\n");
> > +
> > +	create_fbs_for_outputs(drm_fd, active_outputs, num_active, fbs);
> > +
> > +	igt_display_commit2(display, COMMIT_ATOMIC);
> > +
> > +	/* rtcwake cmd is not supported on MTK devices */
> > +	if (is_mtk_device(drm_fd))
> > +		stest =3D SUSPEND_TEST_DEVICES;
> > +
> > +	igt_info("MST subset: %d outputs, n_crtcs=3D%d\n",
> > +		 num_active, n_crtcs);
> > +
> > +	wait_for_vblanks(active_outputs, num_active, false);
> > +	wait_for_vblanks(active_outputs, num_active, false);

Why the need of two vblanks when each wait for vblank here iterates over
All MST connectors and waits for each one to send a vblank.

> > +
> > +	collect_crc_for_active_outputs(active_outputs,
> > +				       num_active,
> > +				       pre_crcs, false);
> > +
> > +	log_crc_for_outputs(active_outputs, num_active, pre_crcs,
> > +"PRE-SUSPEND");
> > +
> > +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, stest);
> > +
> > +	wait_for_vblanks(active_outputs, num_active, true);
> > +	wait_for_vblanks(active_outputs, num_active, true);

Same here .

> > +
> > +	collect_crc_for_active_outputs(active_outputs,
> > +				       num_active,
> > +				       post_crcs, true);
> > +
> > +	log_crc_for_outputs(active_outputs, num_active, post_crcs,
> > +"POST-SUSPEND");
> > +
> > +	for (a =3D 0; a < num_active; a++)
> > +		igt_assert_crc_equal(&pre_crcs[a], &post_crcs[a]);
> > +
> > +	/* Detach FBs from planes and remove them to leave a clean state */
> > +	for (a =3D 0; a < num_active; a++) {
> > +		igt_plane_t *primary =3D
> > +			igt_output_get_plane_type(active_outputs[a],
> > +
> > DRM_PLANE_TYPE_PRIMARY);
> > +		igt_plane_set_fb(primary, NULL);
> > +		igt_remove_fb(drm_fd, &fbs[a]);
> > +	}
> > +}
> > +
> > +static void mst_suspend_read_crc(igt_display_t *display) {
> > +	int n_crtcs =3D igt_display_n_crtcs(display);
> > +	igt_output_t *active_outputs[MAX_MST_OUTPUT];
> > +	/*
> > +	 * igt_find_all_mst_output_in_topology() internally caps
> > +	 * discovery at IGT_MAX_PIPES entries, so this is the
> > +	 * correct upper bound for the buffer.
> > +	 */
>=20
> Never seen a comment over a variable declaration. Makes me wonder if this
> comment Belongs elsewhere ?
> Also can we group all structs together then int then ... while declaring =
seems
> more cleaner that way
>=20
> This is just what I see at the first pass of this patch I  am still going=
 through the
> logic would appreciate it If you could hold off on another revision till =
I get the
> time to verify the logic
>=20
> Regards,
> Suraj Kandpal
>=20
> > +	igt_output_t *mst_outputs[IGT_MAX_PIPES];
> > +	/* Fixed upper bound for tracking traversed root connectors. */
> > +	int traversed_roots[IGT_MAX_PIPES] =3D { 0 };
> > +	int drm_fd =3D display->drm_fd;
> > +	uint32_t valid_pipes_mask =3D 0;
> > +	int num_mst, i, num_active;
> > +	uint32_t master_pipes_mask;
> > +	igt_output_t *output;
> > +	igt_crtc_t *crtc;
> > +	int num_roots =3D 0;
> > +
> > +	for_each_crtc(display, crtc)
> > +		valid_pipes_mask |=3D BIT(crtc->pipe);
> > +
> > +	igt_set_all_master_pipes_for_platform(display,
> > &master_pipes_mask);
> > +
> > +	for_each_connected_output(display, output) {
> > +		int root_id;
> > +		bool root_seen =3D false;
> > +
> > +		root_id =3D igt_get_dp_mst_connector_id(output);
> > +		if (root_id < 0) {
> > +			igt_info("Skipping non-mst output %s\n", output-
> > >name);
> > +			continue;
> > +		}
> > +
> > +		for (i =3D 0; i < num_roots; i++)
> > +			if (traversed_roots[i] =3D=3D root_id)
> > +				root_seen =3D true;
> > +
> > +		if (root_seen)
> > +			continue;
> > +
> > +		num_mst =3D 0;
> > +		igt_require(igt_find_all_mst_output_in_topology(drm_fd,
> > display,
> > +							output, mst_outputs,
> > +							&num_mst) =3D=3D 0);
> > +		igt_assert_f(num_mst <=3D IGT_MAX_PIPES,
> > +			     "MST topology discovery overflow: num_mst=3D%d >
> > IGT_MAX_PIPES=3D%d\n",
> > +			     num_mst, IGT_MAX_PIPES);
> > +		if (num_mst =3D=3D 0) {
> > +			igt_info("No MST outputs found in topology for output
> > %s\n",
> > +				 output->name);
> > +			igt_skip("No MST outputs found in topology\n");
> > +		}
> > +
> > +		if (num_roots < IGT_MAX_PIPES)
> > +			traversed_roots[num_roots++] =3D root_id;
> > +
> > +		if (num_mst > MAX_MST_OUTPUT)
> > +			num_mst =3D MAX_MST_OUTPUT;
> > +
> > +		igt_dynamic_f("mst-root-%d", root_id) {
> > +			int mask;
> > +
> > +			for (mask =3D 1; mask < (1 << num_mst); mask++) {
> > +				int bit, idx =3D 0;
> > +
> > +				/* build subset for this bitmask */
> > +				for (bit =3D 0; bit < num_mst; bit++) {
> > +					if (!(mask & (1 << bit)))
> > +						continue;
> > +
> > +					if (idx >=3D MAX_MST_OUTPUT)
> > +						break;
> > +
> > +					active_outputs[idx++] =3D
> > mst_outputs[bit];
> > +				}
> > +
> > +				num_active =3D idx;
> > +				if (!num_active)
> > +					continue;
> > +
> > +				igt_display_reset(display);
> > +
> > +				run_mst_subset_and_verify(display,
> > active_outputs,
> > +							  num_active,
> > n_crtcs,
> > +							  master_pipes_mask,
> > +							  valid_pipes_mask);
> > +			}
> > +		}
> > +	}
> > +}
> > +
> >  static bool simulation_constraint(igt_crtc_t *crtc)  {
> >  	if (igt_run_in_simulation() && !extended && @@ -525,6 +833,12 @@
> int
> > igt_main_args("e", NULL, help_str, opt_handler, NULL)
> >  		}
> >  	}
> >
> > +	igt_describe("MST suspend test for pipe CRC reads.");
> > +	igt_subtest_with_dynamic("mst-suspend-read-crc") {
> > +		igt_require(igt_display_has_mst_output(&data.display));
> > +		mst_suspend_read_crc(&data.display);
> > +	}
> > +
> >  	igt_fixture() {
> >  		igt_display_fini(&data.display);
> >  		drm_close_driver(data.drm_fd);
> > diff --git a/tests/meson.build b/tests/meson.build index
> > 7f356de9b..06c0d8e98 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -399,6 +399,9 @@ extra_sources =3D {
> >             join_paths ('intel', 'kms_joiner_helper.c') ],
> >  	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
> >  	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
> > +	'kms_pipe_crc_basic': [
> > +		join_paths ('intel', 'kms_mst_helper.c'),
> > +		join_paths ('intel', 'kms_joiner_helper.c') ],
> >  	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],  }
> >
> > --
> > 2.43.0

