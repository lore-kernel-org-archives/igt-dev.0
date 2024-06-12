Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1DEC27C77
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 14:11:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FE610E863;
	Wed, 12 Jun 2024 14:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BHu02RhR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8660510E863
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 14:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718201461; x=1749737461;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HveprKH33YinZ8Yrakk9giMSd8W7ZMt+CaSVlw6DfEg=;
 b=BHu02RhRdFRlOypiYBw35iT6iLrUkLlDnVvdPRu45AFZIb2aGhei2a+s
 Wl3DHKF3+cR8Gsf/O0HXI7zcOOsqlcyxy9oB1cmaVYP0Hy4KjLMuUrkjH
 B1pXN4NNZeQjUvlNcIJgSLaJDt7w7hUrGBMDmQn30Sleboiw9kjoWao0Y
 UxtmS/PV1reVDgdNYgOz3aYpn5zC/aJDsJ+QHiyRUl2xxbS7F/XhU4/Kl
 kbzM3iucRQCb8EZAruQUbi0egbOJg0njueRrDH3599rSY7jhYq8Fwof2b
 XJlDgt8T9jsaTybNrLTQ407KVLAn0aReMRaKdQa2CZHY+ayS2cjH61hN3 g==;
X-CSE-ConnectionGUID: 2kOpsUHITvuZTZcIQ8S7nA==
X-CSE-MsgGUID: uCSueaj0RES67qXJuOe8wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14803004"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="14803004"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 07:11:00 -0700
X-CSE-ConnectionGUID: aibA3GxBRxatejg1OxHY8w==
X-CSE-MsgGUID: x6hbPNqlTYKAQPRQYQmjkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="40280879"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 07:11:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 07:10:59 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 07:10:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 07:10:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 07:10:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRON888BI2+mIZwmVhaoV+mQk8xpxIYfL2sMbPesvBjoh2suEQsSUC9s4MGc2kI/y131wbDh9CuMxGJjT7UQbnmM8YZgrjJKcUYq9z+IwT+V6UNO4stIvMnfZaDxW6LJdZD27fH27SaHbox4tQEqFqahFUIkroZwCX9or6nlg0wOwx+AKRBfMgvP7Lm2O4o7KjnW1MaCrM0bKkyFqNo/jRmlPLr2F8MhLQVStSTPKuK/Mh66ZKLw3rdXBgQU+aGwqGkVbEj3fgclS13aDeYSdYXQRmSZxE+CQVjkUw8g5Q0+D+XyWxQg6gJSG1omQLr0aIgROzBVmy2DXSeizYxAWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HveprKH33YinZ8Yrakk9giMSd8W7ZMt+CaSVlw6DfEg=;
 b=mVf8psaBjTjXov2GoecyUuqWJp3mNg3Bbi6wSIQeFZ07Bk20McwkakvQuG4Y2QyhXuF2N/NCRj4cQM+Ru9RmXg7+1TFpa4I04pSPH9jOF0Fs9WBfvLXqyBAP9+Rn5CfMLnSPsVcaUGA4ei5b01tdaF60WAQHfZUpcMzdZhVjR4r0FeamHCpc3VDPXF1AfOPcL9h5J4uDM5Bv8AimcSuWIBpBEBYZwrIWJSCQALx2kOHQXd8jKDBD6wGgTQabMzhseuQIVXIdcjeAzCu12D2Ow3FRGO6hgtjDs04pps6zjxrNju7teNy87TaGKFbwskOEdRKzoJ2ddnXnaqfKdyhGmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7382.namprd11.prod.outlook.com (2603:10b6:8:131::13)
 by DS7PR11MB6294.namprd11.prod.outlook.com (2603:10b6:8:96::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Wed, 12 Jun
 2024 14:10:56 +0000
Received: from DS0PR11MB7382.namprd11.prod.outlook.com
 ([fe80::80b3:e6e7:efec:dbee]) by DS0PR11MB7382.namprd11.prod.outlook.com
 ([fe80::80b3:e6e7:efec:dbee%6]) with mapi id 15.20.7677.019; Wed, 12 Jun 2024
 14:10:56 +0000
From: "Coelho, Luciano" <luciano.coelho@intel.com>
To: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 2/2] tests/intel/i915_pm_rpm: check
 drmModeGetConnector() before use
Thread-Topic: [PATCH i-g-t v3 2/2] tests/intel/i915_pm_rpm: check
 drmModeGetConnector() before use
Thread-Index: AQHauO0Akfjob5CpTUW1A9XcMfk9e7HEMtAA
Date: Wed, 12 Jun 2024 14:10:56 +0000
Message-ID: <64137841cd6f4d3f0c8b994664a46798effefa8a.camel@intel.com>
References: <20240530085908.564733-1-luciano.coelho@intel.com>
 <20240530085908.564733-3-luciano.coelho@intel.com>
 <20240607151123.4o66krb6y4kwyg5u@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20240607151123.4o66krb6y4kwyg5u@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4-2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7382:EE_|DS7PR11MB6294:EE_
x-ms-office365-filtering-correlation-id: f028725a-aba8-4151-c929-08dc8ae97a6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230032|376006|366008|1800799016|38070700010;
x-microsoft-antispam-message-info: =?utf-8?B?ck03ZUJqek9KcC9mRnorZmVtUDNia1RkRVh2ZWtPdVFjWDRnUTMvVk9UTmtR?=
 =?utf-8?B?VWNiRWxxZURLZVkvU0RWZXJ4d3FmRXJBMDgxdHNRbnovVEJNa1c2em00QTVr?=
 =?utf-8?B?WTZyTHlwTmFQUmoyNUVZeENxN3pZVGNHcCtIYUoydjAxOVg2QU8rNHo4R3A4?=
 =?utf-8?B?RExoWWkyUmZFeStia0dIRHl4elJzTUFGSTRVUFVZVWZQVkgrTm52YWlwTENL?=
 =?utf-8?B?ZnBubjlEVVlYbEh1N1IyeDRwOVo3cUloUlI0OVhmL0NqVUttbkNicmNwM2hl?=
 =?utf-8?B?ZTFOMW8vRzk2dWpOaExScGxpengrZG1qdVpVYkNWcWkrc2poU0R5Sjc0VStk?=
 =?utf-8?B?dXFXZ1B5Y3FPZEM4WkZwSHI2VmxtbWZLMjU3cS9LZExzMW5rMnRuVHBiSHp6?=
 =?utf-8?B?d1dkNFlSK1RDbWNsSEdydlZwSFZUbE5aOW00OXUxWHNXUE1PY051TVY1alA3?=
 =?utf-8?B?ODVSN3ZIck9ydmVDdGJWK0JxelpWVkFZZlUwbEZzSHpIbldPZU1QczZ0cUR6?=
 =?utf-8?B?WW1QdHNhbTcveWNJRUJvdlFqL1Z1enpYd1FheFhqT3FDc1V4ektmZWlCL29S?=
 =?utf-8?B?Y3BwcVNqdXJQbThmYWJ2NlcrSmJIbXlqbEFDczkrV3RieEtzSlZucHN6U3hr?=
 =?utf-8?B?aVFrMlc4U3VFMFJCWE1lRW0yRC9aR1lZbTIvNmp4Q25oc0xPL1JVSmtPcTZY?=
 =?utf-8?B?K2ZKVTVSb0xROFNuTkEzOUJUMEtvSml3S3Flb1h6dUJCSHBHZUErN0IxUHpS?=
 =?utf-8?B?ZUQ1bGRVbkNxbTFtVStKcjNHOFN1L1BtZGZ2bWJZNHo4UTZYSnNOODZneUZY?=
 =?utf-8?B?Z3lBKzMxSTFLUWNYVUY3YjZ5dGw1anVSRE45aUhlYzVvVzdPTEc1MzRJYitP?=
 =?utf-8?B?L1hDTTZXRCt3ZlJ0Z1NMMC9ZVXA2QUY2b3FMNDd6RXcrVHdoa0QvbGxkSUtM?=
 =?utf-8?B?ZFBpa1VNejFuOFZXUWU3UXFETnB1UXM5NzJ4Zm1GMkk4dEtXYjNVcnk3cVcw?=
 =?utf-8?B?Nkkva1VDVU1CQjI4WS9uQldQNVhNdmVBMytyczZRM1RFVFlSUFFub2FQVFh2?=
 =?utf-8?B?TnVBdzZLMm1mVmx0dm1VajNvQWNna3UrWDlSN0FORk1FdHBORTQ1ZHZObERF?=
 =?utf-8?B?bjVvcUVtYW5aSnFRMjZGcTNVNlkxdXdjTmI4QS9vRmtjdHo1c1BJYlpSOGdO?=
 =?utf-8?B?TFJjb2E3RUY2ZmlOODE3Zk5YOVFrdEZRVGFtdTNSMHAzZ1N2N3FKc0x3aGUx?=
 =?utf-8?B?WEN1ZjdaaDM1WjkzMHpjWTdLTmU3dEt2MVJrL0RXQ2lyK0RCSzBrTVNidCtH?=
 =?utf-8?B?MmdmVmZ6aUJVSHdmQTlnb1VkVE5lRGxVckxoMjFqQUo5MUxqdmZ2S1JXbW9S?=
 =?utf-8?B?ZHo5TzgzNlFNTTVYWnNOWnZGaTFLNEphbmZvU0l6YVFobmZwTkltcFdONWkz?=
 =?utf-8?B?R3dJS3BadHU4dWJVVlVTdEhVaWI4S3hOVGVqdFNhemw4cGljK096TDNCZ0lr?=
 =?utf-8?B?VVFHajV3U0VPTXBsQ2RHZW5PTS9BUDdrSEVLcWlXUHowUnlKNTRuaXhyeFRN?=
 =?utf-8?B?VzdDaUhpQmJVWkI2eXYxT3JBdmlyVzRhcG5TUG93ai9GRzNCWEhYVFBmQjcy?=
 =?utf-8?B?R1d3TlJXV0lWTVBEVFJMQk1MZk5uWjNKdnNpS3BXTnpqcnlaajJjc3JOMnEx?=
 =?utf-8?B?MEYvTDVpbnd6SERLcGkyRVB5ZWFLcmJ3eFowSjdFbk1mS3NwQm9PSXZIdnN2?=
 =?utf-8?Q?3sgFG/Y6uKdQ6yTVDTZop8JXk/IjvK2imwf78TD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7382.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(376006)(366008)(1800799016)(38070700010); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVJ4K1hMRWQ1dUpURm9BOS9ZWFZKdWtyNHZORVBqbU1xR2NNSnd1WThUaXJT?=
 =?utf-8?B?dGxRaW8wZ1lyL0ZzT2VsQnVaWGRvNzRQT0kyckxJQzZQNmRnRENmZlpkZ2VC?=
 =?utf-8?B?Nk9zZkF2QnJQSkZKRWtDc2x2dHNBK0xDQVc4WGhZVkovN0RVRFM4aHkyaUsy?=
 =?utf-8?B?cy9DZkFNNy8rUVhrRC9iRHNIRkdmbHI5ZmRIY3NENWV3cll5U3JBRWpFeUNw?=
 =?utf-8?B?bi95UGpTYTRjUjViNWhOZUYweTlTTDJoSmFoeERDTVZSTlMvN0x1QnAvZHBy?=
 =?utf-8?B?akdzMWVmL0RBU0lXN3JCM205ZVo2THFGM2RDbDRBUWsxK0JZOXRiano3ZGlG?=
 =?utf-8?B?VmsxdmdreFBjYzR2YVlPWDgyejlvT2RyalNzcHlwdlRTblAwQUxrTmFyNGRK?=
 =?utf-8?B?NUNjNG9pVzE4RFJMQXhYSjFCdU9aZWlSb3BRU3ZVNU16Y3FmTjIzZUdDaUNE?=
 =?utf-8?B?RWZIaU1QY0pTSElMZjZ5MTJDZ0FpRGxJTnRxcUVwNThKazhOVkd4L21wZTRJ?=
 =?utf-8?B?d1Bsc2FGaFhFaHJMdjM3MVR1RVgyWmJYLytBQ2dIeGZDNiswUlJTNldlMDkw?=
 =?utf-8?B?WGR5YURWNzdMM2NCL0NDTWMyK1dYcW0zL1lpdnR4YXJ0YUZyY1JCNnFhbzIw?=
 =?utf-8?B?alpQb2poMm1GWk1qSENpMG5tYWNBMVZmeWJZVkpoNXRhbVl3bXp0V0Y4d2I4?=
 =?utf-8?B?YjEydEd4Uy81RFh6NVM5dzNYNGRIT1NOMzZuRFBHdzJTOGFFMEt0Q3d4UFky?=
 =?utf-8?B?cmlGcExKYXYweE9vSDh3WmFiNmtvQUhrOUpGTVp6RzdWb3NKVXJUOWdTY0ZZ?=
 =?utf-8?B?L29QV0FrWDlzZkptcmpqQUJxTVk5U1pDUVdObzJxUE13bllicGxwT0h2Y1Rj?=
 =?utf-8?B?TENCdENEb21rdGNlTitCbzRtNWhxZ2IrK3c3NUpINjR3OTdaOFltanhLV3NO?=
 =?utf-8?B?SDBhK3N5WTVSRmw1Q2RJTmJWOEhydFhlZjdhN00rY0VteFRsTlhNd3JPZEov?=
 =?utf-8?B?VnlYK0ExMGk4aEx4RjYrVWFJeWtQNS9Na2R6cTk2OFkvU1I0SUJSZysrRDZC?=
 =?utf-8?B?a3VZc0l0Q2cyVWRxalZoYXBpS3owaDR0OHJ5WjZ3dDcyMFN1UUcwNzdtMEtG?=
 =?utf-8?B?ZHJoZW8vWElzNkdoWGJIZjJlWm9iSHVKV0JuUGVSMXN5MzNVUUhob0h4b3Vj?=
 =?utf-8?B?ZUp3T2IyR1pqYkRvUENLd1ByakJNbHlaSUx6QXFUL1hsVFBhdlplMFptWUls?=
 =?utf-8?B?WDY4TkEzSE1iekRTT0VWeXF6ak9MS0xYM1Z5dlZWZ3c5YWw5elZpSXBMdXhO?=
 =?utf-8?B?K0orV29RN2JUMitiR1RGMnpQZ3NqeU9SQzlSN0E3ajE0cVdJc2lDSk8wSk5u?=
 =?utf-8?B?cWtTWlNTZ3BZU2R0T1pCV1JSRUlGYTdibkNvR2RpeVFkWTE1clY3bHVoaXpM?=
 =?utf-8?B?Ty9oNy94MkRPayt5NWQ4ODN2WDV3U0taN0VVZjBMbFlXWFF6SHNtSGFuNVU2?=
 =?utf-8?B?bzd2a1JaN000b1oxb0J6bzluL3d3UllSWUx1ZFgwQkRWZlpKSHpnanZPT3JD?=
 =?utf-8?B?RzYvcUF0VG5xT1d4Mk5XTHRLWXdpTDJEbk5DZmtFeVp5SkFqOHlaUGZEK0JB?=
 =?utf-8?B?OU9qUmZZdVlMa1BwVWpQVnNNcEUxNXlXUHlkK3VlSVRVdTRjanovbWw4WHU1?=
 =?utf-8?B?Z2l0MjhJczBleEFSWWtsalN3VGxTYW0xNmRJTkVVM0VTRjFzVXUzR0ZsMy9i?=
 =?utf-8?B?UTJ2QkZKQ3k5ZWVGLzlqU2hFaDYvN3NKMHR3ZG9VOWV6Q0N3eTMzUGFwbnZ1?=
 =?utf-8?B?SWk5ajdYS3BwL01oN2k1MVZuZDdoWVdYSjR0bEVXMUI4MWxiaHo0RS9RWXFq?=
 =?utf-8?B?Tm1vNS9hRVhiWEg4eEEyVkZFQlczM0dMc3R3ZjZwL2NpWW8xMTFDOVhjTGZ2?=
 =?utf-8?B?Q21aMTdoRFlNVUJmU2JlcHBiTlBkQ1JsRUdaZWpkWmUwbXplK29nYVVQR2JL?=
 =?utf-8?B?aWEvR0NCRlhKcXVBTnkzTVIzaXR6MDZLK25VcVhWbngvM0NGbHVnSGxFb01J?=
 =?utf-8?B?YXJKOHFZV3I4Mzc2UVdCdWhEUWQxYmNqcUJOVGpMVzhLUjI3aCtnMUIwU3BE?=
 =?utf-8?B?U2Nva1NaRXlVN0ZzRm01RWllckhoWU4wSTMyVzA0ZFV3WUtOeTBjdUFYTjBa?=
 =?utf-8?B?ZXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3C08F64437FF8429CF91795CC6559A3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7382.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f028725a-aba8-4151-c929-08dc8ae97a6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 14:10:56.5203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vi61ktwtEQauYXDdCnEQ9C47NA5+uWIOYVLZdfccwFLYZJ/1pBsZlYH4KYYZeXHKoPk2slNe+zS4jktHokbPFO0J0lkfQjNPOsoTiXg7P1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6294
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

T24gRnJpLCAyMDI0LTA2LTA3IGF0IDE3OjExICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IEhpIEx1Y2EsDQo+IE9uIDIwMjQtMDUtMzAgYXQgMTE6NTk6MDggKzAzMDAsIEx1Y2EgQ29l
bGhvIHdyb3RlOg0KPiA+IFRoZSBkcm1Nb2RlR2V0Q29ubmVjdG9yKCkgZnVuY3Rpb24gY2FuIHJl
dHVybiBOVUxMIGluIHNvbWUgY2FzZXMsIHNvDQo+ID4gd2UgbmVlZCB0byBjaGVjayB0aGUgcmV0
dXJuIHZhbHVlIGJlZm9yZSBhY2Nlc3NpbmcgaXQuICBUaGlzIGlzIG5vdA0KPiA+IGJlaW5nIGNo
ZWNrZWQgaW4gaW5pdF9tb2RlX3NldF9kYXRhKCksIHNvIGZpeCB0aGF0Lg0KPiA+IA0KPiA+IEZy
b20gdGhlIGJ1ZyByZXBvcnQ6DQo+ID4gDQo+ID4gU3RhcnRpbmcgc3VidGVzdDogbW9kdWxlLXJl
bG9hZA0KPiA+IFJlY2VpdmVkIHNpZ25hbCBTSUdTRUdWLg0KPiA+IFN0YWNrIHRyYWNlOg0KPiAN
Cj4gTm93IEkgdGhpbmsgdGhhdCBsaW5lICdTdGFjayB0cmFjZScgaXMgbm90IG5lZWRlZCwgb25s
eSB0aG9zZQ0KPiB0d28gd2l0aCBzdWJ0ZXN0IG5hbWUgYW5kIHNpZ25hbCBhcmUgZW5vdWdoLg0K
DQpPa2F5Li4uIGl0J3MgbW9zdGx5IG5vaXNlIElNSE8sIGFueXdheS4NCg0KDQo+ID4gQ2xvc2Vz
OiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2VybmVsLy0vaXNzdWVz
LzEwOTExDQo+ID4gQ2M6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4Lmlu
dGVsLmNvbT4NCj4gPiBDYzogQmhhbnVwcmFrYXNoIE1vZGVtIDxiaGFudXByYWthc2gubW9kZW1A
aW50ZWwuY29tPg0KPiA+IENjOiBKYW5pIFNhYXJpbmVuIDxqYW5pLnNhYXJpbmVuQGludGVsLmNv
bT4NCj4gPiBDYzogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWls
LmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMdWNhIENvZWxobyA8bHVjaWFuby5jb2VsaG9AaW50
ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICB0ZXN0cy9pbnRlbC9pOTE1X3BtX3JwbS5jIHwgNiArKysr
KysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYg
LS1naXQgYS90ZXN0cy9pbnRlbC9pOTE1X3BtX3JwbS5jIGIvdGVzdHMvaW50ZWwvaTkxNV9wbV9y
cG0uYw0KPiA+IGluZGV4IDBlYTVmYmQ4YWZkOS4uZTBmMzk1ZmE4YTg0IDEwMDY0NA0KPiA+IC0t
LSBhL3Rlc3RzL2ludGVsL2k5MTVfcG1fcnBtLmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC9pOTE1
X3BtX3JwbS5jDQo+ID4gQEAgLTUxNSw2ICs1MTUsMTIgQEAgc3RhdGljIHZvaWQgaW5pdF9tb2Rl
X3NldF9kYXRhKHN0cnVjdCBtb2RlX3NldF9kYXRhICpkYXRhKQ0KPiA+ICAJCQlkYXRhLT5jb25u
ZWN0b3JzW2ldID0NCj4gPiAgCQkJCWRybU1vZGVHZXRDb25uZWN0b3IoZHJtX2ZkLA0KPiA+ICAJ
CQkJCQkgICAgZGF0YS0+cmVzLT5jb25uZWN0b3JzW2ldKTsNCj4gPiArCQkJaWYgKCFkYXRhLT5j
b25uZWN0b3JzW2ldKSB7DQo+ID4gKwkJCQlpZ3Rfd2FybigiQ291bGQgbm90IHJlYWQgY29ubmVj
dG9yICV1XG4iLA0KPiAtLS0tLS0tLS0tLS0tLS0tXl5eXl5eXl4NCj4gaWd0X2RlYnVnDQo+IA0K
PiA+ICsJCQkJCSBkYXRhLT5yZXMtPmNvbm5lY3RvcnNbaV0pOw0KPiA+ICsJCQkJY29udGludWU7
DQo+ID4gKwkJCX0NCj4gPiArDQo+IA0KPiBXZSBnZW5lcmFsbHkgZG8gbm90IHdhcm4gYW5kIGZh
aWwgYSB0ZXN0IGluIGNhc2Ugc29tZSBwcmVyZXF1aXN0aWNzDQo+IGFyZSBub3QgcHJlc2VudCwg
dGhhdCBpcyB3aHkgaXQgaXMgYmV0dGVyIHRvIGlndF9kZWJ1ZyBoZXJlDQoNClRoaXMgaXMgbm90
IGFib3V0IHByZS1yZXF1aXNpdGVzLiAgVGhpcyBpcyBhYm91dCBhIHJhY2UgY29uZGl0aW9uIHdo
ZXJlDQp3ZSBnZXQgYSBsYXJnZXIgbnVtYmVyIG9mIGNvbm5lY3RvcnMgdGhhbiB3aGF0IGlzIGFj
dHVhbGx5IGF2YWlsYWJsZQ0KbGF0ZXIuDQoNCkkgdGhpbmsgdGhlIHRlc3Qgc2hvdWxkIGZhaWwg
aW4gdGhpcyBjYXNlLCBiZWNhdXNlIHRoZW4gd2Ugd2lsbCBsb29rIGF0DQp3aGF0IGlzIGdvaW5n
IG9uIGFuZCB0cnkgdG8gZmlndXJlIG91dCB3aGF0J3MgY2F1c2luZyBpdC4NCg0KSSBoYWQgaWd0
X3dhcm4oKSwgdGhlbiB5b3UgdG9sZCBtZSB0byBjaGFuZ2UgdG8gaWd0X2RlYnVnKCksIHRoZW4g
eW91DQp0b2xkIG1lIHRvIGNoYW5nZSBpdCBiYWNrIHRvIGlndF93YXJuKCkgYW5kIG5vdyB5b3Un
cmUgYXNraW5nIG1lIHRvDQpjaGFuZ2UgaXQgdG8gaWd0X2RlYnVnLCAqYWdhaW4qPyENCg0KDQo+
IGFuZCBtYWtlIGNoZWNrcyBpbiBmZXcgb3RoZXIgcGxhY2VzLCBsaWtlOg0KPiAJCQlpZiAoZGF0
YS0+Y29ubmVjdG9yc1tpXSkgew0KPiAgICAgICAgICAgICAgICAgICAgIC8vIGhlcmUgd2UgY2Fu
IHNhZmVseSB1c2UvZnJlZSBjb25uZWN0b3Igb3IgZWRpZA0KPiAgICAgICAgICAgICB9DQo+IG9y
DQo+IAkJCWlmICghZGF0YS0+Y29ubmVjdG9yc1tpXSkNCj4gICAgICAgICAgICAgICAgIGNvbnRp
bnVlOw0KDQpJIGRvbid0IGdldCBpdC4gIENhbiB5b3UgZXhwbGFpbiBpbiBtb3JlIGRldGFpbHM/
DQoNCg0KPiBncmVwIC1uIGNvbm5lY3RvcnMgdGVzdHMvaW50ZWwvaTkxNV9wbV9ycG0uYw0KPiAx
Mzk6ICAgIGRybU1vZGVDb25uZWN0b3JQdHIgY29ubmVjdG9yc1tNQVhfQ09OTkVDVE9SU107DQo+
IDE1MTogICAgZHJtTW9kZUNvbm5lY3RvclB0ciBjb25uZWN0b3JzW01BWF9DT05ORUNUT1JTXTsN
Cj4gMzE5OiAgICBmb3IgKGludCBpID0gMDsgaSA8IGRhdGEtPnJlcy0+Y291bnRfY29ubmVjdG9y
czsgaSsrKSB7DQo+IDMyMDogICAgICAgICAgICBkcm1Nb2RlQ29ubmVjdG9yUHRyIGMgPSBkYXRh
LT5jb25uZWN0b3JzW2ldOw0KPiA1MTM6ICAgICAgICAgICAgaWd0X2Fzc2VydChkYXRhLT5yZXMt
PmNvdW50X2Nvbm5lY3RvcnMgPD0gTUFYX0NPTk5FQ1RPUlMpOw0KPiA1MTQ6ICAgICAgICAgICAg
Zm9yIChpbnQgaSA9IDA7IGkgPCBkYXRhLT5yZXMtPmNvdW50X2Nvbm5lY3RvcnM7IGkrKykgew0K
PiA1MTU6ICAgICAgICAgICAgICAgICAgICBkYXRhLT5jb25uZWN0b3JzW2ldID0NCj4gNTE3OiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRhdGEtPnJlcy0+
Y29ubmVjdG9yc1tpXSk7DQo+IDUxODogICAgICAgICAgICAgICAgICAgIGRhdGEtPmVkaWRzW2ld
ID0gZ2V0X2Nvbm5lY3Rvcl9lZGlkKGRhdGEtPmNvbm5lY3RvcnNbaV0sIGkpOw0KPiA1MzE6ICAg
ICAgICAgICAgZm9yIChpbnQgaSA9IDA7IGkgPCBkYXRhLT5yZXMtPmNvdW50X2Nvbm5lY3RvcnM7
IGkrKykgew0KPiA1MzI6ICAgICAgICAgICAgICAgICAgICBkcm1Nb2RlRnJlZUNvbm5lY3Rvcihk
YXRhLT5jb25uZWN0b3JzW2ldKTsNCj4gDQo+IHNvIGFsbCB5b3UgbmVlZCBpcyBhZGQgY2hlY2tz
IGluIGxpbmVzIGFmdGVyIDMyMCBhbmQgNTMxLg0KDQpJIGRvbid0IHRoaW5rIGl0J3MgbmVlZGVk
IGluIDMyMCwgYmVjYXVzZSB3aXRoIG15IGNoYW5nZSB3ZSdyZSBhbHJlYWR5DQpjaGVja2luZyBp
ZiB0aGUgcG9pbnRlciB3YXMgTlVMTCB3aGVuIHdlIF9hc3NpZ25lZF8NCmRhdGEtPmNvbm5lY3Rv
cnNbaV0uICBXZSBzaG91bGQgbmV2ZXIgZ2V0IGhlcmUgd2l0aCBhIE5VTEwgaW4gdGhlDQp0YWJs
ZS4NCg0KTXkgY2hhbmdlIGlzIGFib3V0IGNoZWNraW5nIHRoZSByZXR1cm4gdmFsdWUgb2YgZHJt
TW9kZUdldENvbm5lY3RvcigpLA0Kd2hpY2ggY2FuIHJldHVybiBOVUxMLCBzbyBJIGNoZWNrZWQg
YWxsIHRoZSBjYWxsZXJzIGFuZCBtYWRlIHN1cmUgdGhleQ0KY2hlY2sgdGhlIHJldHVybiB2YWx1
ZS4NCg0KDQo+IEJ0dyB0ZXN0IGlzIG1pc3NpbmcgZmluYWwgZml4dHVyZSB3aXRoIGk5MTUgbW9k
dWxlIGxvYWQgYnV0IHRoYXQNCj4gc2hvdWxkIGJlIGZpeGVkIGluIHNlcGFyYXRlIHBhdGNoLg0K
DQpPa2F5Lg0KDQotLQ0KQ2hlZXJzLA0KTHVjYS4NCg==
