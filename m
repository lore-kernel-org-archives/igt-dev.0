Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D45C35FFC
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 06:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E52C10E0A7;
	Tue, 25 Mar 2025 06:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OIm1++gI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B63410E0A7
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 06:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742883786; x=1774419786;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=crYxEBSffsRyg+8qV1QfM2BApvqMnJ0xS9caWTjBGZs=;
 b=OIm1++gIJ1uQSOpSpDLVi/nCuhEtQyxScu+uTMt0uctxYAU9HMsR9F/h
 DrZgE4zEc/mfDj5kSePZN9/3JworEXaM2FdtAxArUuRQE+wtqrTos2AfO
 etU5v2EbKH6q1kL0u9SdsjdhihxBNNFdp+B6X7tSKnY1WzlZYzmvXwNMl
 sRKC4R+4qmNDBr/rr1T/jpDddVSGVASlIUADQH5RE8maLq6R0FsEGWlFu
 oCKmlv4rGixWkRO82NU7xJdwbm9mVhIVsFkTfQwL0CykDNmG+sV7trJ2X
 4bmxm9/76ttlngz4e/h0ORT9cZhR04r7J8SDAncXSfo8MjtdPxu+PbWll A==;
X-CSE-ConnectionGUID: AXHFwAJJRZWbo8k/cX/G/A==
X-CSE-MsgGUID: 7dw3/GqWTHKPoWOtdyuQrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55107342"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="55107342"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 23:23:06 -0700
X-CSE-ConnectionGUID: v75/5yKmTgOBeqJDUhf3DA==
X-CSE-MsgGUID: aJ5CNBCETWSq3c1atHcJnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="129461351"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 23:23:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Mar 2025 23:23:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Mar 2025 23:23:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 23:23:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYkXyJmXT05XE8WWRP8jQXXe2PmnAplxWFEyd58uGMwYeNxH0a12B9qICue8L8BwxF91VSUhib7qFqmAKrdpKGQBbro2KYCqLo+f7HkBlKe8rHYGnxGkGszPTemeBZRETYIO3SnZdPr2nzM/FAjyJSB0G13wcCjvmiQzaODpcUuwEJnWj6y00QbJPaL/ZC6wrub0glFzEBO3KoJSKAGXIJQmPHC+OSqC039AQXalHtmT5YWuGOKXyhfE2YpekvP5b/YVskYWspIFLo7Aza/2LSbQl6zNluNsBthwdkSqy9j/wSQpEsJc6GEfLbYaFtFlsAoTjbGj0AzhXKX+V8+7+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crYxEBSffsRyg+8qV1QfM2BApvqMnJ0xS9caWTjBGZs=;
 b=cB/37o8wQV2OEuBub1Q8sOyaUqoj0E4Ms3oacd5xwLlzfwhHI9UonI7Hec5c8ufavB2efT/i5qMJc+8nvJ6A8Z5xR9QpMQcKO7a/Xf0kAda9kLFHvnn20iPxInRnafj6xkU8RRcJ/qSuCJbc7hK9srND19oKn4zlWgE2qYjNY40gwgTSErrcW26Plz7xDNZMaBh027s58G0iutFPsFBvuCDSdZt5RPnYQ2AZG40TVzzlMpzz5hN9k/eMUS4YTTVLt3YnOP1JUPQu1DYkuj87LWC3W9aWdfsLcZrdZYj7vthhfUD9HW4C2fyb6O50hxQzHc5PyV+2VgM+yrK44wSwSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CH3PR11MB8659.namprd11.prod.outlook.com (2603:10b6:610:1cf::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.42; Tue, 25 Mar 2025 06:23:03 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%7]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 06:23:03 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
CC: "Saarinen, Jani" <jani.saarinen@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t v1] lib/i915/fbc: Disable FBC in case of selective
 update in xe2lpd
Thread-Topic: [PATCH i-g-t v1] lib/i915/fbc: Disable FBC in case of selective
 update in xe2lpd
Thread-Index: AQHbmYiQE8I1xA/TUU2I3fylgTZ2WrODaaaA
Date: Tue, 25 Mar 2025 06:23:02 +0000
Message-ID: <851cac0a1f7a049560b8e2b8b411ad07fe90cfb3.camel@intel.com>
References: <20250320110908.175867-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250320110908.175867-1-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CH3PR11MB8659:EE_
x-ms-office365-filtering-correlation-id: d8de451d-2bdc-4dab-fc3d-08dd6b657f66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NENPQU5JbmVDTFl0QzN6VmtYbEY0ZGdGWmNFWWc0b016czlSZ2dmd2tKdEVx?=
 =?utf-8?B?dHhGby8vcUJYdlI4RWlrZHE3WDcyVHNUMzF4V2dEamhVbHdzMkFUU1VQMXgx?=
 =?utf-8?B?TDFwNE4yUG5zN1dpRzgyS2wyMEFxZzMyZlQrT0tnWU1kemwyMnJrNkczNElZ?=
 =?utf-8?B?RVE0K3ZVQkcrTWRpVTdlMTlJYUd5OERleGV0UGN5eVZwRmVqckZ1M2hCZ21S?=
 =?utf-8?B?a283S2pmeFBJbUZrZFFMcFUrenBaeTY0ZFFHUCtHTGpZRCtCSGRmS0t1QjVD?=
 =?utf-8?B?MVA0STJ1ZDJEdkg0aysxcCtKWHp4ZHpKeFExNlFicmc1d2EzbFc4MEQ3ZWVY?=
 =?utf-8?B?WHd0RUdMaTJrVzdOM0Y3VE9TcTJvVGtiNk5ycFZhdWlwSjdXV3NrTnVsNzda?=
 =?utf-8?B?bjRCa0U1VHZMS2JFNkJtOVBLekxFWC9LQkJxT0Zld044eDdyNDJBVlVUbjVj?=
 =?utf-8?B?OER3NHJDYTE2MW1sVEsvTnU5cURZSzU4UkFlalZrSWFIZUNsY3VUVVp5M09l?=
 =?utf-8?B?RUc5TnE5RER3bVVBS0JYK3d2WXdZVlVYUENTMXlJMHBoSmt1TGh1YVNDYjls?=
 =?utf-8?B?Z1AveW13cEN3TWxhNFNBSXY2TURnWUR0MkoxbTlPNVpRbVdhUVNDaW9EUldZ?=
 =?utf-8?B?R1JObUZDNGdOU2RKczlWVEtLMEcvRHRKUmljZGgydlpoNkNidW1wZVBCMVRC?=
 =?utf-8?B?WjBxcHVrQ1E2QzFnbjdaNEpFQldvZjRvaWdZOEZzMXhlVTlsNE4vRTNnMlJ5?=
 =?utf-8?B?cnlqMVh3Y3djNzl3Q3MwYkVteCtsOU84KzFhL2hyU1NPQnBRK0tRSlFSQnFC?=
 =?utf-8?B?bi9ob1ZZZ1E4ME1ZT05tVDdyTW1RNmluL3dnTUJ1UXRENmlqYmVUNUtYNEpG?=
 =?utf-8?B?UXdQYlcvbkRGdWpxVlJ1K2xGdVhPSU1GbmJXVzRrUU9IZkNIV0RPeVZxTlNK?=
 =?utf-8?B?YjVCc1ZyTjlsdDJhb1lMMXEzY0V5RlZsbzZRZ1hCYlFwQy95bFpTeWVPdkpq?=
 =?utf-8?B?VDVteC9abnhoYlNNNEJ0Szk0a3FiT0RZbS9FbjlCRkU2dyt1N1FlRHNWQnFv?=
 =?utf-8?B?OGdnSVpoakUwZDJsSE0xN29uZXhmZW83R1VzTEFvMGNxdnFSZGJpcnBkRDJa?=
 =?utf-8?B?dmxwazdzODVWc3gxWnRYcmRkOUFUOERCR1Y1enVmY1J2WjBIcXdmZUI4RVdi?=
 =?utf-8?B?eVlqSDBBQzVPcEhKNHErMjZqdFBkUDMvMHp3WWtPS0VoMlR4WE9KamtxMktG?=
 =?utf-8?B?STM2NWRiREdZWmNoYjZoWmx0R2NuL2JoZlhGbldhektDc0M4NEFzcDFGMlMx?=
 =?utf-8?B?eDMrVm1DSjZnWmZ6NmE4dVNCUlpKbkxXUklmNmk0M0MrTjlNdS95UUdKMzh1?=
 =?utf-8?B?SzZVVnFUNGpUOG9zZS9VSXFCMjV5ci9lVVpDTHprenVMdjZyN0YveTkwbzcy?=
 =?utf-8?B?Vnh6UG9wYUZnbzBXVHhwMWRtWXp3aFZydnE2NG9jYklBbXl1YnBkUFhoek9u?=
 =?utf-8?B?RHdFTk9hTnlUNUZkL3JRRG9jaEw2UkVWcXJlYzVtN0lIWElkR05Ca0pJTHRS?=
 =?utf-8?B?N001ZmY4ZDVPeWx6cmMxd2dubDdKRktMbWQ0MzlrQlh6UUVYcE1KNnRGdERM?=
 =?utf-8?B?Z3JhWWdmdXBUNklHQ3pPMkxzS2k0dDl3cXJtS0xRUmQyb0pFbEhNKytvQ1py?=
 =?utf-8?B?azIyaWY4cVNJUzZsU3JyU1Bqcnc5S1VVOGtjbW1ZcUdDMGJNZHcvQ3MxTFk2?=
 =?utf-8?B?RW8yalhjZTMzNU9LdDV3aFRYOE14OEF1UUk5WXVYbzh3c2hsVklMQ1Q1OEFu?=
 =?utf-8?B?aXJqdkZjZXM2RzR3QURuMUo4SWVVSGg1VUVYc2pKS1dxalptWTAvQVQ3N3JW?=
 =?utf-8?B?SFRDSWJwUDZXR25iUnJFUldTR25UamNBZERib1FmcFYwZHRPMFdGNG1GVDFj?=
 =?utf-8?Q?57gx49vqy9E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzE4M2pSby9nenNGR3pzeSttUjY3ZWRZanpDSFNNL1RKakJEek40Rk1VMC81?=
 =?utf-8?B?a2F6MjdwVytHQVhJZlA0QVdJNzVIbGRkcFZnd3hQTDlObXNMWmQxc2hadFhl?=
 =?utf-8?B?SlpXUEpWaHR6L0FkWS9RZHBIeWJrVEdqNmJnTkFMNTVqYkRkeFRicWtpUHpk?=
 =?utf-8?B?NzhYNG54NVRaZ1IzU2F2MUxBRFE1aXhvQ3pzcE1MTW94Ymh3L1JoZStXSlZ3?=
 =?utf-8?B?ckVqR3dFSDc4T3FzZ0dyVFdWVFcrUFl5d2hWRmhZc0pzZTZ0OWFOZlFVaGFP?=
 =?utf-8?B?d0hNOFlESUE4TXcvUXg2T1FybUNsby80bjZBOVU5VWhPSDhhdEdJeHl6SXUz?=
 =?utf-8?B?S3lLZXZKODUxYXFUOW1jUVJhRFZHNXovY3JEUE5qWDhRcldvSFU4L0RUaFE1?=
 =?utf-8?B?TlVZaFRvZGw5TndEcTZseDZ2Y0Fxa3QrYVZkY0RXS0NQY2xyRHlqaW5GTjN4?=
 =?utf-8?B?Y0kwbFZ6OTg0NzR1c3IvM3lLaDdqamRSOUY0YVc1eVlBaXlGZ3FGU051cFFN?=
 =?utf-8?B?Z05sTXAyNTd2R1IvWmk4TDdQVkFrWDIvT05mRmR4NGJWMDdlYU8wRERoeEov?=
 =?utf-8?B?UjBNLzJENHM4SUU1QUtscEFxd2RpVWlJSVcyQ0FMMnNnbmdHNldHczREVThO?=
 =?utf-8?B?QXZDSTZlRW9ldnpTZ21uTyttNG55eVNEMGdHTmVrcmczYUdONmp0R29mMjVS?=
 =?utf-8?B?SStlckNXNEYvNW5RcG81a0RlSjdkRWtJdFI5Y1lpMWpwRXAyYzJoMHJzamw4?=
 =?utf-8?B?L3JiclNtRk1mZE1IaDhQVlB0UkJVR0ZRR3NtcFF6bzNtSjdMMHlweFlZYUVw?=
 =?utf-8?B?dkRmalMydEtBR1FIVXYwR0lQQnh0SFdNUTVReDZBUURjeSs0cWF1V1VoNlhr?=
 =?utf-8?B?eHJybDl1N1BKZEFZTE9VdFAxZnQxZzVGcitwempraVVjdkgrb2czV21RY3Vp?=
 =?utf-8?B?VzNuWGVlQktDRkZnTHFqWDh1S3pYMy9pbGFjZ1p5MS9kMzI2N1dHRStSdEts?=
 =?utf-8?B?clFuWHZVeHJheGVDMkFYTDlNTFlIWHVzbGY2RWhpM09rSEQwVVlxYkFEZWFy?=
 =?utf-8?B?cThEZjN1MVg1d2N3N2haR1NmWERTVUNrem5aeHpPUkFZM1M1ZTlaTUUyU2h2?=
 =?utf-8?B?K1dnejEvQ2FIMkN0bjFmb21VbitvK3lOdXNxbjlVNkppem9kZ3FKeTU4Y0NM?=
 =?utf-8?B?aEdiVDhFaGNXYnkva1hJZWZ4TU1qUHIxaXpTZmVvTkVYMWROT09udC9xSm1y?=
 =?utf-8?B?Y245ZytLR0R6U0lXT3hXYWlLVEdhNXhzTFFXaW5vdnVGWlJpb3ZwcU5mdElw?=
 =?utf-8?B?dk8xR3lqNHQwV3FjUDg4VnV4R3VsSnJhSGk0aWM5bTRlOUhuZFZTK2ZwV1VO?=
 =?utf-8?B?UGZON0QyM1l1QjhMMWVXUDdNWDIrQmo1ZHJhMkRNc0orUmdmTVhiVXZiY3U0?=
 =?utf-8?B?MFJaRFBlK0hsLzE1ei9OMzRIRFR3N1gyUEMvRmpGRllhT0dlZHo3VDZKa1lw?=
 =?utf-8?B?bGtMczJmQUhNVVhMWlhkWUVEM0FuN2JaSXFFWlFSOTJpY2sza0JZODcyRU1R?=
 =?utf-8?B?N1NUc2xmVDRaSHB1Wk5wSkhaeG9ZSHFUbGhEY2laeGJwMC9FcXJDOVZqRWVr?=
 =?utf-8?B?VDdQZTlRdjJpdWErWm16aVlpNDNRcnc4Yy9IU3c1Y0czT016YTl0eU55WGFw?=
 =?utf-8?B?WC9kSTNaeWZWYjlnWTQrWkxHaTlsa1ZRcTJKYTVPcFhCbUFRNGE0MTZZQUlh?=
 =?utf-8?B?K2hkRjZnS3Y2MkpoNFE3dHNLVnpZM0x0YzFiSDFyTjYwcTBZbVVES0NINzNU?=
 =?utf-8?B?NmFYUSthem0rdUpBd0xjUEdJdVJzYkFhQ2QrUUx4MHpydmg1S215dm9ia1I5?=
 =?utf-8?B?cFEwcTdqME9xK0RyWm5Yd0EvUnVxMitMeGljQzd1R0t6d2t1dzF3RU9ZeHlR?=
 =?utf-8?B?Tk4za243ano5MUNlTmQvOXYxU2lPM1N3VGNXdDBDVWUwbVJOcjlRK3NDUXc0?=
 =?utf-8?B?TUpoaHcvejM0cDlrQ2Z1NW1RMFQyWUtpVHpVU3Azb2xqZjhJT3ZzdEJLeEp6?=
 =?utf-8?B?OGtqaXdLaTZaMkJoQ3dkeDZMdUxibkMyRG1temtvVjRiUElOTzNncU1VQ0FL?=
 =?utf-8?B?TWthMW5XNzV5RDFxTlIrWDZ5VjJmYVB2OU00TnVnQjZHbGtXbzhJemwxbE5T?=
 =?utf-8?B?VkQrdnY0VjZKc3d6aDVmODh1eTgzcmU3aGNFM2U3Z1lyNjlqd2tqVnVVa0tx?=
 =?utf-8?B?c0g1b1BSTmdhbGJsOU1ROWdueldBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <501EDED97279CB47AB1795B2C10AC71C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8de451d-2bdc-4dab-fc3d-08dd6b657f66
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 06:23:02.9468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OMFjtZjfNULaPcO65TNwHFCs8pWcl4+VReBeuGKhMMeihE6J3OUvHBMLr6cN+zqkhqf5+Dbv6Wwv+esfZK9r4qkN/N/N+sa23aQmBSsD42c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8659
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

T24gVGh1LCAyMDI1LTAzLTIwIGF0IDEzOjA5ICswMjAwLCBWaW5vZCBHb3ZpbmRhcGlsbGFpIHdy
b3RlOg0KPiBJbiB4ZTJscGQgb253YXJkcywgRkJDIGFuZCBQU1IyIHNlbGVjdGl2ZSB1cGRhdGUg
c2hvdWxkIGJlDQo+IHNlbGVjdGl2ZWx5IGVuYWJsZWQgYmFzZWQgb24gdGhlIGRpcnR5IHJlY3Qg
dGhyZXNob2xkLiBEaXNwbGF5DQo+IGRyaXZlciBsYWNrcyBzdWNoIGEgbG9naWMgYXQgdGhlIG1v
bWVudCBhbmQgaW5zdGVhZCBkaXNhYmxlcw0KPiBGQkMgaW4gY2FzZSBzZWxlY3RpdmUgdXBkYXRl
IGlzIG9uLiBTbyByZXBsaWNhdGUgdGhlIHNhbWUNCj4gaW4gcmVsYXRlZCBJR1QgY2FzZXMgYXMg
d2VsbC4NCg0KQXMgYSBuYW1lIGludGVsX2ZiY19wc3JfY29tYm9fc3VwcG9ydGVkIGlzIG5vdCBz
cGVjaWZpY2FsbHkgcmVmZXJyaW5nDQpQU1IyLiBJdCBpcyBnZW5lcmFsbHkgUFNSLiBBbHNvIGNo
ZWNrZWQgdXNhZ2Ugb2YNCmludGVsX2ZiY19wc3JfY29tYm9fc3VwcG9ydGVkIGFuZCBpdCBzZWVt
cyB0byBiZSB1c2VkIGluIFBTUjEtRkJDDQp0ZXN0Y2FzZXMgYXMgd2VsbC4gVGhpcyB3aWxsIHNr
aXAgdGhvc2UgdGVzdHMgYXMgd2VsbC4gSSBkb24ndCB0aGluayB3ZQ0Kd2FudCB0aGF0Lg0KDQpC
UiwNCg0KSm91bmkgSMO2Z2FuZGVyDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFZpbm9kIEdvdmlu
ZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBsaWIv
aTkxNS9pbnRlbF9mYmMuYyB8IDE1ICsrKysrKysrKystLS0tLQ0KPiDCoDEgZmlsZSBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xp
Yi9pOTE1L2ludGVsX2ZiYy5jIGIvbGliL2k5MTUvaW50ZWxfZmJjLmMNCj4gaW5kZXggMzk3MWU0
OTIwLi5iMGI0Mjc4YWQgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pOTE1L2ludGVsX2ZiYy5jDQo+ICsr
KyBiL2xpYi9pOTE1L2ludGVsX2ZiYy5jDQo+IEBAIC0xNjcsMTEgKzE2NywxNiBAQCBib29sIGlu
dGVsX2ZiY19wbGFuZV9zaXplX3N1cHBvcnRlZChpbnQgZmQsDQo+IHVpbnQzMl90IHdpZHRoLCB1
aW50MzJfdCBoZWlnaHQpDQo+IMKgICovDQo+IMKgYm9vbCBpbnRlbF9mYmNfcHNyX2NvbWJvX3N1
cHBvcnRlZChpbnQgZGV2aWNlKQ0KPiDCoHsNCj4gLQlpbnQgdmVyID0gaW50ZWxfZGlzcGxheV92
ZXIoaW50ZWxfZ2V0X2RybV9kZXZpZChkZXZpY2UpKTsNCj4gLQ0KPiAtCS8qIEluIFhlMyBGQkMg
UFNSIGNvbWJvIG5vdCBzdXBwb3J0ZWQgYmVjYXVzZSBvZiBGQkMgZGlydHkNCj4gcmVjdCAqLw0K
PiAtCWlmICh2ZXIgPj0gMjAgJiYgdmVyIDwgMzApDQo+IC0JCXJldHVybiB0cnVlOw0KPiArCS8q
DQo+ICsJICogQmVjYXVzZSBvZiBzb21lIHJhbmRvbSB1bmRlcnJ1bnMsIEZCQyBpcyBkaXNhYmxl
ZCB3aGVuDQo+IHNlbGVjdGl2ZQ0KPiArCSAqIHVwZGF0ZSBpcyBlbmFibGVkIGZvciB4ZTJscGQg
b253YXJkcy4gVGhlIGRpc3BsYXkgZHJpdmVyDQo+IHNob3VsZA0KPiArCSAqIGltcGxlbWVudCBh
IHNlbGVjdGlvbiBsb2dpYyBiZXR3ZWVuIEZCQyBhbmQgUFNSMiAvIFBSDQo+IHNlbGVjdGl2ZQ0K
PiArCSAqIHVwZGF0ZSBmcm9tIHhlMmxwZCBvbndhcmRzLiBVbnRpbCB0aGF0IGlzIGltcGxlbWVu
dGVkLA0KPiBrZWVwDQo+ICsJICogRkJDIGRpc2FibGVkIGlmIFBTUjIgc2VsZWN0aXZlIHVwZGF0
ZSBpcyBvbi4NCj4gKwkgKg0KPiArCSAqIFRob3VnaCByaWdodCBub3cgdGhpcyBmdW5jdGlvbiBp
cyBlbXB0eSwga2VlcCB0aGlzIGZvcg0KPiB0aGUgZnV0dXJlDQo+ICsJICogZGlzcGxheSB2ZXJz
aW9uIGJhc2VkIHZhcmlhdGlvbnMgZm9yIEZCQyBhbmQgUFNSDQo+ICsJICovDQo+IMKgDQo+IMKg
CXJldHVybiBmYWxzZTsNCj4gwqB9DQoNCg==
