Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E028C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 07:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E136B10F511;
	Tue, 12 Mar 2024 07:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nV7vmD4h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C26110F511
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 07:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710229319; x=1741765319;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wx0V6QTXcVoChtJGr+/56l5nnREJ43afVKjBt8TEBN8=;
 b=nV7vmD4hv8RJPJdOuULDMeviIXktzUTeXwqCCtdlVYMmFwE2PANeGGLB
 3FUWIbC63JQyeeFyyFxMYIURqMjinJM5efheFIbot2VFp/lFlQ/6Mzeqe
 A5y107UW/Ax8HGBb402kA8vhKnMz1ysmBk33RK9DXtpGT7PwnQNCMaN1z
 rccXmz0+SSQEIJVrRAeqgaK/sw1tawYC6mIeMeVMPTOv+09/Q/IO9+1YJ
 kqArEaol72AgyMjPPdUfnYjM/MICrWtMa+dWePAiSNiI/wuOy+ezkRRjb
 5m41JBbrwPt/do63mRsxdOS7370+U9RBOvuFwP3Y2lIDuWzSepSzVK7MO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4780800"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="4780800"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 00:41:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; d="scan'208";a="11368870"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 00:41:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 00:41:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 00:41:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 00:41:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQPquv5jlv7zg5lYQevw5DBLg9O5Xvb9Z0jBXOqvhmWS7d11VbTRhNYXNY5XhhqnIkkwdJteI5eAevqSBEoccW/25YLYWyjLeWnJozPsOGSvOVTRvwHA4ygJb5tY/K6ZuobyVija8/cEVOrFo/fbgbwLIMl6tO0wnH/RDOGMe90nRnlzm6iLOcnFmWJxiSycysv4n/4ntnAA867B8bWAkbziddB9rpdgg+etF6mXKtJIp16ftuzriPHt2oSDciiGIogkOx9GPBFN21Zsr4uvcJVvOw01GVkUrgCY3j35Nr+yXjNhLhqC3sBe7Qw4zqW0k3YXBlJ47n74jA0h9Vg3TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNjyWBl2DuYCLkwibH8VnXKuW41dmetLdG1Vkb4RO0Q=;
 b=PhTTdcewILaxVYfHG+C6SPVR6ih7GhBNXN/hoNJP1OB7NpuKdaadDXX9B9NVRC0nF4OfgP4XWX8Y9z+nycVAcvjVTtOy37flFJLNne/9XXpUBupOhPPSIKq61/mnNkrEiZohbTylCejyJDp1tN44nXLUBm7xRcTFAIqXncV/67odImvzHJ76fKJWg/PfJjqwwgBp9eWOGhn/iHXdU91ekd+sugLM0XeqJEu2Fh5qnsaYG1k6v7xJ3SojSeog4NXZB4sqObeKhszyY3V5NlQV3M+1fmJJQfVxGpdK8M1aFDi7O1zMvSKSwrIdgoDcUG8BwzpXH27/fXoMb3KKKCMPZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by PH8PR11MB6976.namprd11.prod.outlook.com (2603:10b6:510:223::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Tue, 12 Mar
 2024 07:41:54 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::9d1d:68bd:1d3f:901]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::9d1d:68bd:1d3f:901%5]) with mapi id 15.20.7386.015; Tue, 12 Mar 2024
 07:41:53 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Dandamudi,
 Priyanka" <priyanka.dandamudi@intel.com>, "Nayana, Venkata Ramana"
 <venkata.ramana.nayana@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/xe_evict: Skip test if smem less than
 lmem
Thread-Topic: [PATCH i-g-t] tests/intel/xe_evict: Skip test if smem less than
 lmem
Thread-Index: AQHadE09LrHx5AsDfUeMiLO9PARaZrEzuB9A
Date: Tue, 12 Mar 2024 07:41:53 +0000
Message-ID: <BL3PR11MB5747C8050E03C835973FEBFED02B2@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20240312071502.2188325-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20240312071502.2188325-1-priyanka.dandamudi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|PH8PR11MB6976:EE_
x-ms-office365-filtering-correlation-id: 15e048b1-cc77-4636-463b-08dc4267e30c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R4pFdBz/6Y+xqeOr/TzhsWV0ElFfDzhh0pA7HZoTvrKfGDp0RDk6W+1q0cy20Z/QlI3YlLl8kDsXuADoWzawCsP+J1cNqJMx32VDSqJrcNvpPyxcyYwoFvupMCgeSK+BkPNWxSeX5uJ85CxP4IY/HVANibur2ntylh+5m49A3GeqNYEu6qXEQVQU42Br5zQTDyjMojaiZ23yvIu9Rcms+H/iM+JVhDYhnfIrXmOCtnPNsR2DqqpfsBND0EQDPZIIDfdiFSxDnu6/gePFUSEyc7e5i4UsNY2/1oo3WczhSsOm0EqP7Hjppo85ESdKR6outCMx+eZBiZ0CM7DFylG+alhR/6HLcWChjgT0oqtNKZ3OhtG74bbfxYBvkBHxnRnBHQXFpo1yCYZdbZ3GQNg7xNXJxC8yvXPywUnuZWK6HJjCtQ4oi79WN/R9dngFVTRXaS8YoHezA/6lOIJ1dbqpW4C6za6FxNjmqY8tx7US7cD47XCflZFRWc08qr56XPCK2G8LGED5pxa0Mjx3lV+x1BuRcLL+kAP4UmpfGN7kPCbRsKlGiaZXvt4a9JO0elVXi6KhE8Q+Zg+NWeFAT83k7IaeKXNDe07fWzOXAJbLYmSGGvmzDdmxlrPnmB3yANfUWLupCUBC900TGrS0DboKgrhGs4iCNgx+Q/6ATv7WReCM3TNs6PyJ/ZqqgAOCr4Zf16a1efgZWCIlSnoE/FEr5a52QIzqpYvvzT9FQ5OTFSc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8O6OgEvvz2FlJJ1tV3wPsW3tvQ4NmSZecHBuKO2ZBPzXasZcHIcX1WoSmW98?=
 =?us-ascii?Q?Y+Zvs99HC0LD9bVgrMPdjUAhFWcmnIVYoKwWEa89vIoKbqtaqh2Rtnw41tHY?=
 =?us-ascii?Q?vNreY8CYY0UbGinNeb7hzsKcDXvmbLj0uBkdMC8qaYDzQ0rtoU9bEb+0bBIa?=
 =?us-ascii?Q?GtScPQPF/2sV5HiCsjeEIJ6BHTHALRH7XOL3JnyTcZFgIIfojg7lN9SuZRjR?=
 =?us-ascii?Q?x7QOuQj8+PqZggJq4ye3oPsIBDUF89AAhOawcR+uF1tEAr0mh/oszxnduALU?=
 =?us-ascii?Q?9lEMX8T9FEgO0h4C8fSpX+3I0xK+GhePE2Jubh+tW85jczDhidSG928VlyZV?=
 =?us-ascii?Q?5mjtUF0LKBWkC3r8ZIi+w+ITTJc0S8+Emb/z0TZ+YkR6+GHKF0KtVzqZEIu3?=
 =?us-ascii?Q?zc7tSeJGM7AmpOGxVK8Hjt1r3mfMLHEvOOKfLJA9/ioVlpesihZc7wO9KRW7?=
 =?us-ascii?Q?OJv+ZTUSrHM7m2DD9lhSMKELPKGvjvNVFUyVCpc5Uk4hZKgh2pK/7ofwPDF8?=
 =?us-ascii?Q?pJfdDY+Hv4nxS4cU1K7UYWKgnQm8iwQxwOXzgovRP5QfzAoQCIyn8PO57c/J?=
 =?us-ascii?Q?QircCMFBVARvNLNW4oPCoiqIrV1WyO/3WDrvmLTXxxWf1/z48OOK+wFYlXLx?=
 =?us-ascii?Q?T4g8x7/3BcsRq2OHHFx15C8LR0Wl3SATiAyiuoirUwrN8Ei+LyMKcmPuZKKe?=
 =?us-ascii?Q?VzbAfnG/U9cqBxnP1api3JYSXBpiSwwwgrDP6HkiLJSKIbeCB2wFJBm5JCXj?=
 =?us-ascii?Q?PnBnCMftOJPHocD0rlbHFoInAvKzLkP94kdUofakImSL3ABoW0VTuPh7INO2?=
 =?us-ascii?Q?2X9FpO3xuP+1bhuWvaPV9h7ftO3xUZ1Hj0XhkRFbb7AZ7QjjO53fStYcMzPy?=
 =?us-ascii?Q?X+8/ZmBz3TD3j6GHDSxVd1wCVzYh+6zED5UNzplC2r5kJWtTg1w8MwJkaHZ0?=
 =?us-ascii?Q?oYX35hYf3pa5tpeW06V9kJLw901DoyDGs1xYVdY/fNgmpi2up4ZqjGvjXGVQ?=
 =?us-ascii?Q?07BJjEgXCMRx64uz7UEThkJv0bO+9tzT9rUIG/RbixguYnqeqbwmU+m7ak2k?=
 =?us-ascii?Q?dop5zK6/zsNGHgVyPKLY+K+zesoCPjG7NvZlZKi1wn2ZyTCp3CC4qA1PWoNo?=
 =?us-ascii?Q?6jl9ngwsDvJ20INp5c0lKF12EWS7kBmgb0sZyBlhrVUKp+2JjuAB17MWElii?=
 =?us-ascii?Q?NfW0pJjZejFjSbAP5v/n4h/rpxqXZnR/YpkSX3ibsvrz2nnE+siYjZHOqb7o?=
 =?us-ascii?Q?ZajJ2d9/DJ+SFJBGarQZav51qJvSUu0KXrE079aOKcvPJw+5CdQi0XduJt9o?=
 =?us-ascii?Q?tzf+3uLCQgEUkn3lQLvpd9Il1xiF2EESXgyVk60QzGm3wffBUGXoZ6jw4vVu?=
 =?us-ascii?Q?QD4xDsh/uGYda3n9l64J2XncKY84sBRTm+4sMptfoDP56zAvpuGcsy0zranK?=
 =?us-ascii?Q?zXQ6ZWE8Vgz7s/6nsps1imJzm1QxCKWyoXJ8uDx4i7DAlk9j16n61RFfwE8K?=
 =?us-ascii?Q?w01JV54uCxKsI8BCYmOQFPOMCzSzSx/fHGmNOu1zj9sMZnE/E0lK5BlAxdtY?=
 =?us-ascii?Q?00cH2NvZZyw7noPshbreiTV+QpuQwO9s9J+NC+12?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e048b1-cc77-4636-463b-08dc4267e30c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2024 07:41:53.7486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c3+bOaZ8UL/7haBxIEO9CunpuK4mU3dvvkS6djcB7yeufA8ndJzWGhVXut+Lr1X0CheXUUGF1bI0vKLpzAhAqIlR7xcCvV0/M6D1JDzFNTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6976
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



>-----Original Message-----
>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>priyanka.dandamudi@intel.com
>Sent: Tuesday, March 12, 2024 12:45 PM
>To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Nayana, Venkata
>Ramana <venkata.ramana.nayana@intel.com>; Brost, Matthew
><matthew.brost@intel.com>; igt-dev@lists.freedesktop.org
>Subject: [PATCH i-g-t] tests/intel/xe_evict: Skip test if smem less than l=
mem
>
>From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Currently the tests are failing with OOO memory error.
>Added code to skip the test if the system memory size is less than local m=
emory
>size.
>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>---
> tests/intel/xe_evict.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c index
>4de82c3bd..2dc3fe542 100644
>--- a/tests/intel/xe_evict.c
>+++ b/tests/intel/xe_evict.c
>@@ -753,6 +753,8 @@ igt_main
> 		igt_require(xe_has_vram(fd));
> 		vram_size =3D xe_visible_vram_size(fd, 0);
> 		igt_assert(vram_size);
>+		igt_skip_on_f(igt_get_avail_ram_mb() < (vram_size >> 20),
>+			      "System memory is less than local memory \n");
Can you elaborate the commit message a bit more ?
Looks good to me
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>
> 		xe_for_each_engine(fd, hwe)
> 			if (hwe->engine_class !=3D DRM_XE_ENGINE_CLASS_COPY)
>--
>2.25.1

