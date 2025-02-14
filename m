Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE690C02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 11:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457CF10EC39;
	Fri, 14 Feb 2025 11:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GFajGJDO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7B610EC39
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 11:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739531871; x=1771067871;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pxBeCgkbSBAOjfns3INLESvabA+PBn9Nhv7krO5XZZk=;
 b=GFajGJDOLajNDVEMzH7laL9VpmuiQuy9Z1a01bR02RkNCtOBPg8Hb583
 Je5AF+NpXEuJ6In4SMm3aOTi3cR6EEo43t4oBakWTYfoDAONbuMt/0G9E
 y+K0hmUX73RZPEV3StBXfscwM5pmtB5Zck+GbCnu8XCm8HMIbIZ5vHR/W
 p3Quh0XnYQao4K150n0spge81fJeZoEZToZRk5DVdY+E7C97UmCv7GEsp
 4sq1WLU33ipJzJ7ACV02TvZTyUZSFIpuzjzm4cxtafF+NruL9herbwVhG
 Cq8H8HrSCX3k1SllMZLmQwYmAh4wbfdiHIM5qW+zbZ5+kPb9Ldz+UBSYY A==;
X-CSE-ConnectionGUID: SfDIfqDzSNydnxv0FQ9LIQ==
X-CSE-MsgGUID: XxyyizuuS7WtuwnZk1MGeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="39985750"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="39985750"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 03:17:50 -0800
X-CSE-ConnectionGUID: cFI+C3mUSNi8mHX4rYLs9Q==
X-CSE-MsgGUID: lnmVU1e7QjmnmE1vRPuSyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="113955506"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 03:17:48 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Feb 2025 03:17:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 03:17:48 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 03:17:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lW+fH/vLNmEAg0Dee+32ecV72MReQO7uB0o3YiAgrt8hah6JEb2kMQ7ZXDmNJ7UhQs4uGnEChilsQ+bQIEWcHCIfo7dclvCJ7Q7ZHh2HYUucKK/XCCArNox+7WxLJkSlLoiMCTtuo/tIVtymaFOZNTaxj8BGGbEgoAn9hmmgo8iLnaWVLG53HGiZp6NwiC382z5IJkrOXqSae93SSx28ADvW1IThl0iXn+TINL+cPacHNfnSJoi5qc+YN9whHdTWcqfAr9EDve7o1m+Gegy++TgmBdtpWXax4jdEZy58YD0+UxqmvVh6dUCxMcRvxH4+U3yaiaWgs2NxT9+9HnfXRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxBeCgkbSBAOjfns3INLESvabA+PBn9Nhv7krO5XZZk=;
 b=pmj8dTONyfmYJQLgNjAGh2qVfHUkPqV8ApMfS+f3+86gZaON/hm/OlaeklxOJkaR1OLcJWbXLkXtlYBSPbdN8ZWZ4aL8fRm5T/6N1Njx+zqcf6JkS9e4+nsL/taBKENR3IpwKz8dZUJGFR37haQnlw3f0CrMnsQ9X0Z0cUlaWDVzmqLbM59XzFXJtpqWSSP3vzISjJYp9qYEmJkJycBj/AmpzcUbcZsug/pKKL8gwaJ+4InmTYPyfNBaIbXrNHT3zocORY6BfpMqvwhx2wxjlv0SoFpue+ciGRrbCK2hcxwJIBrhtUXnp4ngGsS6o+Q/SlPkju9eBkLb6s3Ie7+BBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by SA3PR11MB8003.namprd11.prod.outlook.com (2603:10b6:806:2f7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 11:17:18 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38%4]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 11:17:17 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] lib/intel_compute_square_kernels: Extend compute test for
 ptl
Thread-Topic: [PATCH] lib/intel_compute_square_kernels: Extend compute test
 for ptl
Thread-Index: AQHbfq7ZofwGpgigkECcgoLHp2vmNLNGk+4AgAAR8GA=
Date: Fri, 14 Feb 2025 11:17:17 +0000
Message-ID: <BL3PR11MB574724494523F8D70208132DD0FE2@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20250214070518.53840-1-sai.gowtham.ch@intel.com>
 <20250214101018.mrn3gtvgvn3zecnj@zkempczy-mobl2>
In-Reply-To: <20250214101018.mrn3gtvgvn3zecnj@zkempczy-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|SA3PR11MB8003:EE_
x-ms-office365-filtering-correlation-id: 7a27b907-204d-4320-1825-08dd4ce9246a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?QVUrb0k1RzBXcWZiVlROcUFhLzlzSTJzKzRCWWlQNnRDdGt0RTZiMDVUR01j?=
 =?utf-8?B?VGNOMzhKTTV4L0FDakhvNE5uclN3NldLWjZhL0c2SmhpOVBKOERTYkJ4Lzll?=
 =?utf-8?B?WGtDT3lQdUNIVzU5emVHS09wRDhrdWZ1ZlhoTFUrODd1NVgxNlQzam9GNEw4?=
 =?utf-8?B?N3kzOEcwS2NtU09rS2FPMlRWWWJpWE10VWErTVRabVlGZUhCZ0R4cmJTcXFS?=
 =?utf-8?B?SS9tckljaU9sTjlRcEZhRTJYdW1FYWltd21nd21yU0dnZCt5UFF4YnVzOExs?=
 =?utf-8?B?UnM0Q2FPNkFlYzhIMEJPWlltcWxHUXZYUlN3ZlpBUVF5Z0VMQ1dwdXBEYjBv?=
 =?utf-8?B?eVNDYVJ6WlRPMUw5cHpsejA5YjhFbXlQa3U5S0dxaHF2R2hQUWkzcmVnMzRS?=
 =?utf-8?B?aDMwZTJucHdmOG1hQjIrUGIydUNvYkxqclR0UHZqSGNmOTUxeXVNOFNYUHd6?=
 =?utf-8?B?SkRRYytCM2trdDUyMFR0Zld1aDNtei9jNUE5WjNXWHZxWUg1clgzQlJEZkJm?=
 =?utf-8?B?Vzk5Zkp4QzhUL1Y3d09WQ244d0hITHJpb1VPQXJrSnlWUkR1aFZYMXV2TnIy?=
 =?utf-8?B?ZlU5djFCdjg5UTk1Tko2aE40YUxpd2xVdGFTWEdlNGtrTC80cEpXZHR2QWN3?=
 =?utf-8?B?TjExS1lGTFBsR2dPTUhJeW9zVnlwMUJuVE4rSDEzS3hzMldYV0RXRjhQSGFG?=
 =?utf-8?B?U0tkcEprenI2cUFrLzJNYmNxaDRtSGp0aVI5czdMSmZXL0gvVjhFSmU2dU8r?=
 =?utf-8?B?ZXp0MzFzSFN3ak1pZzlxN29hREg5d1I5TXBkcGZ0YmJyd01ubldwNXBxdlAv?=
 =?utf-8?B?Uk5vMkpzNGNKNnh0aEdIbm9wRW51eHZDM0N0NEJVaUY2aExaOVFPekE1ZG5K?=
 =?utf-8?B?N2dNM0RKc1E4YWJRUW1TRlNROVFLaVVod3I2MFB6U3NCSW42TGoyZnZCQU1n?=
 =?utf-8?B?NHB1RXhpY1YwVVFlVG5ZNXJhcTVwZ3BDK0QwNU1xbXVxYVgxUkNndnVGNWRF?=
 =?utf-8?B?QUVNb09CR3RjbEV5R1kwbTFCd1FnbnVucVhNa3RHVVlabSt1OWh2cUt6QVRj?=
 =?utf-8?B?UHM2Vnp4ajNQMzJBK2YxMEZTZ1VVTWZmQXRmOFJ6dThNTGlvdVhnMVdsQmFB?=
 =?utf-8?B?bFVDUFpZK0dhckFnWlFUdjMveXBLam1FYmNXaStCTThWdDVsZGtwU3VXUGZZ?=
 =?utf-8?B?Z0QvenY2TGFZcnpLTFg3Um0vM25Wbm9ySjZ0YTdjeElGNk1xQzI0UVhBWTFZ?=
 =?utf-8?B?R3ZveC9YZDROZFBRNXBpam1Eam1VNVV3aDhWaTljQXdIU1U0azVsZU5WbmYw?=
 =?utf-8?B?a0hQRlVjcVQ0OGI5UUxmUWIreVdqQmtmaS9PN2s0dFFXd3FLek4xZTB2UExV?=
 =?utf-8?B?bXAyR0RHcWdNM25FdGJiYzcva0p4RkVSWnpVczlFUk1wZ0w0eFdBVjZWYVM1?=
 =?utf-8?B?aW91OGYxTHZacEhHVkt1ZXo4a1JPb2ZoNWZLNk5QMy9sRW9rV2R3aGI4R2hL?=
 =?utf-8?B?cjBCbVVRMFNRZFR4SUNwNG85ZFpPZnU4ZVY0cWpEQnFXcVJWQVF6SjRlc3JM?=
 =?utf-8?B?WGVTbWRBMXBqY1c5STlRL2NNUEdnM1RMUlVkUWZmSTVYai9keU1yTTNEbVhJ?=
 =?utf-8?B?NDdmTlFtTFh3Nk5Mb2JLSmpNTFlLQzZQUnJvVTdQWUhMK0g0Sys5T2xpWEFC?=
 =?utf-8?B?YUl2a3orMzJHODZPRHZNNTB3akVqbFAvNHgyUWVOSXplS0h4WlRiV0NpUG15?=
 =?utf-8?B?blhIdm9FbFhGU0hjQzJ6eStnN2xXenZ2cVU5alBqYW9hY3B6Zi9TWDJPWWsz?=
 =?utf-8?B?VzB6V3JDVU5lNWNJckVSeXdjNEZCL3FPeTM1cjdDSzUrZG1Fb2g5VFpObzEy?=
 =?utf-8?B?UmJYWnRMRk9kYW85dkRaQWszY3VaVHRiQ2dZK3hBeGF0VTdYdDZ4d0tMajNi?=
 =?utf-8?Q?s89GCk2o/eIGNf+qQa9EpSJ74iRjSiMq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2hZNEN4YkhldlRzOHdnbEVnLys1YWxYUk9Ud0txcVZuSmpCU1Q3MDR2eFhV?=
 =?utf-8?B?UUZmSkdBT0pGTjdoVForUEU3U0dKY2VYRVNja0Vnek9qQ3JGY0FUUjRuSkI5?=
 =?utf-8?B?akFqRmw1RHVJbG1DR2hudVhEWU1hUjVSWFJhNWF6RUVSZmRzci8vU1dGTEdt?=
 =?utf-8?B?NHZlTWNHRHN3UmJCR0xQSlQyd1BxY2xTMjZBbnZxWFVPWFhEYUhOOUJBK3ZY?=
 =?utf-8?B?Sjc0TzJkcFlRSUhjRnlNa1ZndXZZY25TY1NKV054QVAxSGlrRUZhMVRzem5h?=
 =?utf-8?B?aEgvcmdIM1N2ZTVOVWwwVncxMGFqbFoxWkdIcHgrWVpoVWEwdWxRTDdNaGhI?=
 =?utf-8?B?elJxQU5sd3oySEFoY3MvTGg2Z3JFdlMrYjBsdWczejVZVXdydGJpVml2OGts?=
 =?utf-8?B?N05oVmRJb1hlNDFHOTEvT2tBV3NHZ3h2RzJYL3QyMGJvOUZocTV5akIyRzhS?=
 =?utf-8?B?SUNPZ2swWTlqTEpTMmhpY3YrZlZVY0lVckNKOXZmMnBUVUs3Z3lQeDVFU3JO?=
 =?utf-8?B?SC9zL0Z1c0tValFCVm9hT3hldGRyRjFXVnplMjJEaitpQnA1cjlMRXZQZEpK?=
 =?utf-8?B?cUtNMGlyZk1FRy9Bc0V3SVZWOW1FNWJDMzFlYTM2ck1aYVpNaTdZaXNzU0FY?=
 =?utf-8?B?NHhzLzBMcXhKNFJSZFpaWkpSRHJudGNYTHEvRGwydjB1Z3d3ak5aNDVKbmVO?=
 =?utf-8?B?VDVCK0ZFS2JoWTZaM0psMHhTVjNCM1YvcFlOMjZ3SXUvVXo4UHZFUTd2SjJL?=
 =?utf-8?B?R0s3RndrazFUYXl3S0NsaEpSUW4zc096UVlWTnh5VEdBcUVYTTROQUNhZXpI?=
 =?utf-8?B?MTRicHV1Tkg4ZlVKTVUwc0hWWlF6ekdjWWxwSVZtdkFyS24wQzgwRFRIUjM4?=
 =?utf-8?B?ZU5HUDZYd1c5MUZWLzdLcXpyY0R5Wm5ES1JJWjNDa1JHMzZjK3Q5M0Uvdk9S?=
 =?utf-8?B?SzhUU0xBMHFZSjZJSmhOMUhLdk9FenlaZHZyUE0wYVJBS3RvbWY1U3MrU2NM?=
 =?utf-8?B?aFNqLzI3WGdJVC9QRW5XaWlZUXBuMk5rNEo5ZHFyUnJoclpBeU5WRmUwZXlh?=
 =?utf-8?B?TWVzamptV2NHMWt5UnluZFZJOHpqd29tOHd2aFJlRzIvRGVORGptcXg0OUdG?=
 =?utf-8?B?SCtzZTFBN3A2a3ZsMkkzSjkzVEYzS2tUaWVUTWZsVzdrd1k4OTFmOTlQTk9p?=
 =?utf-8?B?emMzdHdETklyQ2lTVGI0YVU3K2s0UVYyNGxkeGlsQmNWd0w2T01XQmUzOENo?=
 =?utf-8?B?bDN3WXlUT09IZTF2ZHpKWCtCRm0xZjB4NUcvRHJCckFpU0dRS0J2anQ1MzZN?=
 =?utf-8?B?SGwvdFpQTmNwNk1TYUpESC8yTGM5S1I2QVZyUEFMbkJTZGRYQWp3Rmw3L1JE?=
 =?utf-8?B?VUZYY2ExcXZUNmxMR3EwVzR5R2dvN2JoQVRyNXVJMjQvSDU3OElRRnk3d2tG?=
 =?utf-8?B?MWxHcXFNUkZxcHR1MW1LcFJnVG44a1pJYUMxSkR0Y2pTVDlqeFNLSm5GNGpM?=
 =?utf-8?B?YVJkVzN3ZTU4K3BnNTJaTUg5WEdVU2NWNXI0SEdYditnOWNjMHNDL1Q0Q20w?=
 =?utf-8?B?RmhsM2I0TC9vZlBYN1pkMGhubnVjajIxaUl1bUN6cXBPUzdXc3ZRS3ZXeFFL?=
 =?utf-8?B?emVqSldvMFRxbUd1OWFLYVZtYUtKclE4emRZc1FHL0FybHFwYWRpek1IdnhH?=
 =?utf-8?B?KzQyUkNieG1DdVQyOW9oWlRjVGhUUk9Ud284TkFGRGc4d09iWjRZZWtWMDhL?=
 =?utf-8?B?N1lOQ3ZXM2VvZ0JZWVV3RDJBeVdrZmpzcldUR2d2NEUzeVZRZ1B1ZWNaT0g4?=
 =?utf-8?B?cmJDOUxxTVRac3MycHFaN053M0l0UVFReXlBakJERXM2WkNuMEtlaUpKQVFz?=
 =?utf-8?B?K3BCT2ZjdllneEhMUWJPZkZQcDVmR3dWcDY1MXdOWTcvYmg3bDBZbjc4N0tz?=
 =?utf-8?B?VVgvSEpReFJQc0l6RjA2SldIQnNNSDlpQjQ3TUM2OVNNUGo4WkxqYVhiYmls?=
 =?utf-8?B?aVRIeW1mbTZiem5rR1Z1UTNNSVRKVmJWSmo5MjVBM1ZBVGhPN0VmSTM0WkJJ?=
 =?utf-8?B?elJrdWhBV2lyN2tyZG41ZjdBRXgwQU90bytjY1BscXF6UDRlT1lBSThBNHFv?=
 =?utf-8?Q?DaO94KuwiSmPkm7RyHf3CKfND?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a27b907-204d-4320-1825-08dd4ce9246a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 11:17:17.8007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oCLBse/kZC640Ru9WXwmu0f5TCNCPuoXya6U4NCK/3fvQKBaPb8ZS5zOyJIrNFTfs4OPsE+VYI9Hlvjh+AkpEbvtvyeHhFb/y/93eNaW8Qw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8003
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEtlbXBjenluc2tpLCBaYmln
bmlldyA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPg0KPlNlbnQ6IEZyaWRheSwgRmVi
cnVhcnkgMTQsIDIwMjUgMzo0MCBQTQ0KPlRvOiBDaCwgU2FpIEdvd3RoYW0gPHNhaS5nb3d0aGFt
LmNoQGludGVsLmNvbT4NCj5DYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj5TdWJq
ZWN0OiBSZTogW1BBVENIXSBsaWIvaW50ZWxfY29tcHV0ZV9zcXVhcmVfa2VybmVsczogRXh0ZW5k
IGNvbXB1dGUgdGVzdCBmb3INCj5wdGwNCj4NCj5PbiBGcmksIEZlYiAxNCwgMjAyNSBhdCAwNzow
NToxOEFNICswMDAwLCBzYWkuZ293dGhhbS5jaEBpbnRlbC5jb20gd3JvdGU6DQo+PiBGcm9tOiBT
YWkgR293dGhhbSBDaCA8c2FpLmdvd3RoYW0uY2hAaW50ZWwuY29tPg0KPj4NCj4+IEN1cnJlbnQg
Y29tcHV0ZSBzcXVhcmUga2VybmVsIHRlc3RzIGRvc2VuJ3Qgc3VwcG9ydCBvbiBQVEwsIHRoaXMN
Cj4+IGVuYWJsZXMgdGVzdHMgdG8gd29yayBvbiBQVEwuDQo+Pg0KPj4gQ0M6IFpiaWduaWV3IEtl
bXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPg0KPj4gU2lnbmVkLW9m
Zi1ieTogU2FpIEdvd3RoYW0gQ2ggPHNhaS5nb3d0aGFtLmNoQGludGVsLmNvbT4NCj4+IC0tLQ0K
Pj4gIGxpYi9pbnRlbF9jb21wdXRlLmMgICAgICAgICAgICAgICAgfCAxMCArKysrKysrDQo+PiAg
bGliL2ludGVsX2NvbXB1dGVfc3F1YXJlX2tlcm5lbHMuYyB8IDQyDQo+PiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKykN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEvbGliL2ludGVsX2NvbXB1dGUuYyBiL2xpYi9pbnRlbF9jb21w
dXRlLmMgaW5kZXgNCj4+IDIzMzgzNWM2Yy4uNTM1MDM4OWRmIDEwMDY0NA0KPj4gLS0tIGEvbGli
L2ludGVsX2NvbXB1dGUuYw0KPj4gKysrIGIvbGliL2ludGVsX2NvbXB1dGUuYw0KPj4gQEAgLTE3
MjksNiArMTcyOSwxNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHsNCj4+ICAJCS5jb21wdXRlX2V4
ZWMgPSB4ZTJscGdfY29tcHV0ZV9leGVjLA0KPj4gIAkJLmNvbXBhdCA9IENPTVBBVF9EUklWRVJf
WEUsDQo+PiAgCX0sDQo+PiArCXsNCj4+ICsJCS5pcF92ZXIgPSBJUF9WRVIoMzAsIDAwKSwNCj4+
ICsJCS5jb21wdXRlX2V4ZWMgPSB4ZTJscGdfY29tcHV0ZV9leGVjLA0KPj4gKwkJLmNvbXBhdCA9
IENPTVBBVF9EUklWRVJfWEUsDQo+PiArCX0sDQo+PiArCXsNCj4+ICsJCS5pcF92ZXIgPSBJUF9W
RVIoMzAsIDAxKSwNCj4+ICsJCS5jb21wdXRlX2V4ZWMgPSB4ZTJscGdfY29tcHV0ZV9leGVjLA0K
Pj4gKwkJLmNvbXBhdCA9IENPTVBBVF9EUklWRVJfWEUsDQo+DQo+VGhpcyBlbnRyeSBzZWVtcyB0
byBiZSB1bnVzZWQgYXQgdGhlIG1vbWVudC4NClRoaXMgZW50cnkgaXMgaW1wbGVtZW50ZWQgZm9y
IHRoZSBmdXR1cmUgdXNlIGFzIHdlIGhhZCB0d28gdmVyJ3MgZm9yIHB0bCwgdGhpcyBjYW4gYmUg
cmVtb3ZlZCBpZiBuZWVkZWQuICANCj4NCj4+ICsJfSwNCj4+ICB9Ow0KPj4NCj4+ICBzdGF0aWMg
Ym9vbCBfX3J1bl9pbnRlbF9jb21wdXRlX2tlcm5lbChpbnQgZmQsIGRpZmYgLS1naXQNCj4+IGEv
bGliL2ludGVsX2NvbXB1dGVfc3F1YXJlX2tlcm5lbHMuYw0KPj4gYi9saWIvaW50ZWxfY29tcHV0
ZV9zcXVhcmVfa2VybmVscy5jDQo+PiBpbmRleCBiMDkxMmU3ZTQuLjE4ZjkwYzRmZSAxMDA2NDQN
Cj4+IC0tLSBhL2xpYi9pbnRlbF9jb21wdXRlX3NxdWFyZV9rZXJuZWxzLmMNCj4+ICsrKyBiL2xp
Yi9pbnRlbF9jb21wdXRlX3NxdWFyZV9rZXJuZWxzLmMNCj4+IEBAIC0zODg5LDYgKzM4ODksMzgg
QEAgdW5zaWduZWQgY2hhciB4ZWxwZ19rZXJuZWxfc3F1YXJlX2JpbltdID0gew0KPj4gIAkweDAw
LCAweDAwLCAweDAwLCAweDAwDQo+PiAgfTsNCj4+DQo+PiArc3RhdGljIGNvbnN0IHVuc2lnbmVk
IGNoYXIgcHRsX2tlcm5lbF9zcXVhcmVfYmluW10gPSB7DQo+PiArCTB4NjUsIDB4YTAsIDB4MDAs
IDB4ODAsIDB4MjAsIDB4ODIsIDB4MDUsIDB4MWYsIDB4MDQsIDB4MDAsIDB4MDAsDQo+PiArCTB4
MDIsIDB4YzAsIDB4ZmYsIDB4ZmYsIDB4ZmYsIDB4NDAsIDB4MTksIDB4MDAsIDB4ODAsIDB4MjAs
IDB4ODIsDQo+PiArCTB4MDUsIDB4MWYsIDB4MDQsIDB4MWYsIDB4MDAsIDB4MDIsIDB4MDAsIDB4
MDAsIDB4MDAsIDB4MDAsIDB4MzEsDQo+PiArCTB4MjIsIDB4MDMsIDB4ODAsIDB4MDAsIDB4MDAs
IDB4MGMsIDB4MDUsIDB4OGYsIDB4MWYsIDB4MDAsIDB4ZmEsDQo+PiArCTB4MDMsIDB4MDAsIDB4
NzAsIDB4ZjYsIDB4NjEsIDB4ODAsIDB4MjQsIDB4MmMsIDB4MDIsIDB4MDAsIDB4MTAsDQo+PiAr
CTB4MDAsIDB4NjYsIDB4MDksIDB4MDAsIDB4ODAsIDB4MjAsIDB4ODIsIDB4MDEsIDB4ODAsIDB4
MDAsIDB4ODAsDQo+PiArCTB4MDAsIDB4MDIsIDB4YzAsIDB4MDQsIDB4MDAsIDB4NDAsIDB4NDEs
IDB4MjIsIDB4MDMsIDB4ODAsIDB4NjAsDQo+PiArCTB4MDYsIDB4MDEsIDB4MjAsIDB4NTQsIDB4
MDUsIDB4MDAsIDB4MDEsIDB4MTQsIDB4MDIsIDB4MDAsIDB4MDAsDQo+PiArCTB4NTMsIDB4ODEs
IDB4MDAsIDB4ODAsIDB4NjAsIDB4MDYsIDB4MDUsIDB4MDMsIDB4NTQsIDB4MDUsIDB4MDAsDQo+
PiArCTB4MDYsIDB4MTQsIDB4MDIsIDB4MDAsIDB4MDAsIDB4NTIsIDB4MTksIDB4MTQsIDB4MDAs
IDB4NjAsIDB4MDYsDQo+PiArCTB4MDQsIDB4MDYsIDB4MDQsIDB4MDMsIDB4MGUsIDB4MDEsIDB4
MDQsIDB4MDEsIDB4MDQsIDB4MDQsIDB4NzAsDQo+PiArCTB4MTksIDB4MTQsIDB4MDAsIDB4MjAs
IDB4MDIsIDB4MDEsIDB4MDAsIDB4MDQsIDB4MDYsIDB4MTAsIDB4NTIsDQo+PiArCTB4NDQsIDB4
MDUsIDB4MDAsIDB4MDAsIDB4MmUsIDB4MDAsIDB4MTQsIDB4MTQsIDB4MDAsIDB4YzAsIDB4MDAs
DQo+PiArCTB4MDAsIDB4ODgsIDB4MDAsIDB4MDAsIDB4MDAsIDB4ODgsIDB4MDAsIDB4MDAsIDB4
MDAsIDB4NjEsIDB4MDAsDQo+PiArCTB4MDAsIDB4YjQsIDB4MTUsIDB4MDYsIDB4MTAsIDB4MDAs
IDB4NjEsIDB4MDAsIDB4MDgsIDB4YjQsIDB4MTcsDQo+PiArCTB4MDcsIDB4MTAsIDB4MDAsIDB4
NjksIDB4MWEsIDB4MTAsIDB4MDAsIDB4NzAsIDB4ODYsIDB4MDUsIDB4MTksDQo+PiArCTB4MDQs
IDB4MTUsIDB4MjAsIDB4MDUsIDB4MDIsIDB4MDAsIDB4MDIsIDB4MDAsIDB4NjksIDB4MWEsIDB4
MTAsDQo+PiArCTB4MDIsIDB4NzAsIDB4ODYsIDB4MDUsIDB4MWIsIDB4MDQsIDB4MTcsIDB4MjAs
IDB4MDUsIDB4MDIsIDB4MDAsDQo+PiArCTB4MDIsIDB4MDAsIDB4NDAsIDB4MWEsIDB4MDAsIDB4
MzgsIDB4MDgsIDB4MTksIDB4MTAsIDB4MDUsIDB4NDAsDQo+PiArCTB4MWEsIDB4MDgsIDB4Mzgs
IDB4MGEsIDB4MWIsIDB4MTAsIDB4MDUsIDB4MzEsIDB4MjMsIDB4MTcsIDB4MDAsDQo+PiArCTB4
MDAsIDB4MDAsIDB4MTQsIDB4MGMsIDB4MjQsIDB4MDgsIDB4MDAsIDB4ZmIsIDB4MDAsIDB4MDAs
IDB4MDAsDQo+PiArCTB4MDAsIDB4NDAsIDB4MDAsIDB4MDAsIDB4MzgsIDB4MTAsIDB4MTksIDB4
MzAsIDB4MDUsIDB4NDAsIDB4MDAsDQo+PiArCTB4MDgsIDB4MzgsIDB4MTIsIDB4MWIsIDB4MzAs
IDB4MDUsIDB4NDEsIDB4ODMsIDB4MjAsIDB4MjAsIDB4MGUsDQo+PiArCTB4MGMsIDB4MDAsIDB4
MGMsIDB4MzEsIDB4MjQsIDB4MTUsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAsDQo+PiAr
CTB4MjQsIDB4MTAsIDB4MDgsIDB4ZmIsIDB4MTQsIDB4MGUsIDB4MDAsIDB4MDAsIDB4MmYsIDB4
MDAsIDB4MTQsDQo+PiArCTB4MDAsIDB4MDAsIDB4NDAsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDAs
IDB4MDAsIDB4MDAsIDB4MTAsIDB4MDAsDQo+PiArCTB4MDAsIDB4MDAsIDB4NjEsIDB4MDAsIDB4
MTAsIDB4MjgsIDB4MTQsIDB4MDIsIDB4MTAsIDB4MDAsIDB4MzEsDQo+PiArCTB4MjAsIDB4MDIs
IDB4ODAsIDB4MDQsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MGMsIDB4MTQsIDB4MjAsIDB4MzAsDQo+
PiArCTB4MDAsIDB4MDAsIDB4MDAsIDB4MDANCj4+ICt9Ow0KPg0KPlNoYWRlciBsb29rcyBjb3Jy
ZWN0Lg0KPg0KPj4gKw0KPj4gIGNvbnN0IHN0cnVjdCBpbnRlbF9jb21wdXRlX2tlcm5lbHMgaW50
ZWxfY29tcHV0ZV9zcXVhcmVfa2VybmVsc1tdID0gew0KPj4gIAl7DQo+PiAgCQkuaXBfdmVyID0g
SVBfVkVSKDEyLCAwKSwNCj4+IEBAIC0zOTMzLDUgKzM5NjUsMTUgQEAgY29uc3Qgc3RydWN0IGlu
dGVsX2NvbXB1dGVfa2VybmVscw0KPmludGVsX2NvbXB1dGVfc3F1YXJlX2tlcm5lbHNbXSA9IHsN
Cj4+ICAJCS5zaXBfa2VybmVsID0geGUybHBnX2tlcm5lbF9zaXBfYmluLA0KPj4gIAkJLnNpcF9r
ZXJuZWxfc2l6ZSA9IHNpemVvZih4ZTJscGdfa2VybmVsX3NpcF9iaW4pLA0KPj4gIAl9LA0KPj4g
Kwl7DQo+PiArCQkuaXBfdmVyID0gSVBfVkVSKDMwLCAwMCksDQo+PiArCQkuc2l6ZSA9IHNpemVv
ZihwdGxfa2VybmVsX3NxdWFyZV9iaW4pLA0KPj4gKwkJLmtlcm5lbCA9IHB0bF9rZXJuZWxfc3F1
YXJlX2JpbiwNCj4+ICsJfSwNCj4+ICsJew0KPj4gKwkJLmlwX3ZlciA9IElQX1ZFUigzMCwgMDEp
LA0KPj4gKwkJLnNpemUgPSBzaXplb2YocHRsX2tlcm5lbF9zcXVhcmVfYmluKSwNCj4+ICsJCS5r
ZXJuZWwgPSBwdGxfa2VybmVsX3NxdWFyZV9iaW4sDQo+DQo+U2FtZSBhcyBmaXJzdCBjb21tZW50
LCB0aGVyZSdzIG5vIHJlbCA9IDEgZm9yIFBUTCBkZWZpbmVkIChnb29kIGFyZ3VtZW50IHRvIHN0
YXJ0DQo+cmV3b3JrIGZvciBnZXR0aW5nIHZlci9yZWwgZnJvbSBodykuDQo+DQpTdXJlLCBXaWxs
IGJlIHJlbW92aW5nIHRoaXMgZW50cnkuIA0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMsIHdp
bGwgYmUgc2VuZGluZyBhbiBvdGhlciBwYXRjaCB3aXRob3V0IHRoZXNlIGVudHJpZXMNCj4tLQ0K
PlpiaWduaWV3DQo+DQo+PiArCX0sDQo+PiAgCXt9DQo+PiAgfTsNCj4+IC0tDQo+PiAyLjQzLjAN
Cj4+DQo=
