Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0B8CD98E1
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 04:07:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7800410E919;
	Wed, 17 Jun 2026 04:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hxrc7NzZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A7510E919
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 04:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781669242; x=1813205242;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2M5rPv/S8JcBvNKQJBoOol4RHqRR3mxEjXryXU7Smkw=;
 b=Hxrc7NzZJu9nA5xxOROLA5RFWCzOxFRh4l3gV3oEO5dEvtFgaIafhaz5
 HgWmSQ+Wda4GTjHFdGcD7lTMYMLOtetvT9nyLh9a5lQ1Yt290D1O+QFFh
 EJ+uV2R6He0rZyjYLHxfpaRltfz177x0orDn93wVU8zZ20i+qWhZsXNnf
 2WE1nUBnlU2BHY3W8NzAweaDXV7aK9/IhR9aZ4TqrSbHP1MVvi+5NPkdh
 cc3ALNSkjBnvmHMLnF49VJ+cM/NEZzlnnszqTuAtMQYLFMmQeBHfGctGO
 5Vsxj8si4mjMb+qdoCjnwGab+nrlBkQZ4B+sMhFcfpYGL0lGHf8Bfvcb8 Q==;
X-CSE-ConnectionGUID: lJolmIjFQTeR11cjK9wP0w==
X-CSE-MsgGUID: 79tuAc+MTOqCoiFulFDldQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="99865700"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="99865700"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 21:07:21 -0700
X-CSE-ConnectionGUID: 1MCYh8ztRPWLB7GQB+VFKA==
X-CSE-MsgGUID: O19mJnIhQqePn6cbNfy4Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="245056921"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 21:07:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 21:07:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 21:07:20 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 21:07:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWc8EV8I2/66o1jMjn228AOXEKa60QAJnAHajn2/LnFhSSrQQB3/ZHfkgwOJoyxQ7HAu9jyD+gOh7fMxYTh6CHXur2D7lCRigKIS9hAu4b0quiATsz9j+fgWKTiE6GZtld7OdONs23PJ7KR2XCubiCqhzGWcPdAGhPAeqUJKuNRVUXSkRj6OqLPlMmrDZUd9pdCRg1TFipscA/g/AA4bfp7JM5N6FW4RECPcKTJMX59wvLv3NRzKsO50gUOGjbIM7NH0jxVWMIp7HAb8bMvtnqg2gwa7A2YcEngYYsSDxwN9/74CFXmeVb0Ikzg9k34yq8dquP9fqtRQeATOcr3lWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2M5rPv/S8JcBvNKQJBoOol4RHqRR3mxEjXryXU7Smkw=;
 b=l+Zx9AsWikfK087fakRvq/LVa0dTFlSD2usJuQ9Rbz0AvnteWltcFrxpX31Mh9taIX4Cku/cyLqZ75nkwpKpDPdSM/C5MgQcIng3dX4znkmIddfvQOy0zbNrlg28fXlvPvIJcBP0TzgloIPhRdBF6ejGRUjTnaSnYlO1Vcm7OP90R7rvPhpic+IhV5YlbVD1vsKar4n0jHcW6v/LRZ22BsGnvgHBLcJwEbn+zhW08w0LVb7uecMKDWKcFi4oLwPaIMrOINBxXjRKpZCCsNWYdaLca/JCx6KTMf25Zoxo5NP2j11tpYsmxgoJJ2855ch2daYKXR2yR+2Q5wq2Lxxx2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8483.namprd11.prod.outlook.com (2603:10b6:408:1b0::7)
 by MW3PR11MB4538.namprd11.prod.outlook.com (2603:10b6:303:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Wed, 17 Jun
 2026 04:06:59 +0000
Received: from LV3PR11MB8483.namprd11.prod.outlook.com
 ([fe80::1b9c:4b:c780:82bf]) by LV3PR11MB8483.namprd11.prod.outlook.com
 ([fe80::1b9c:4b:c780:82bf%3]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 04:06:59 +0000
From: "Muppidi, Venkateswara Rao" <venkateswara.rao.muppidi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Dugast, 
 Francois" <francois.dugast@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
Subject: RE: [PATCH i-g-t v3] intel-ci: Add SVM, multi_queue tests to Xe
 fastfeedback
Thread-Topic: [PATCH i-g-t v3] intel-ci: Add SVM, multi_queue tests to Xe
 fastfeedback
Thread-Index: AQHc/XOFGM3aURgPpkSo9/u+MAeEfrZBTNOAgADVRyA=
Date: Wed, 17 Jun 2026 04:06:59 +0000
Message-ID: <LV3PR11MB848300F6117F57FEE23ADA5CDFE42@LV3PR11MB8483.namprd11.prod.outlook.com>
References: <20260616093542.2510-1-venkateswara.rao.muppidi@intel.com>
 <20260616152155.54hlofblt3c3hl4p@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260616152155.54hlofblt3c3hl4p@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8483:EE_|MW3PR11MB4538:EE_
x-ms-office365-filtering-correlation-id: 1eb18090-b518-4524-085d-08decc25e0d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|56012099006|3023799007|4143699003|11063799006|5023799004|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info: ZWLo0hSn9eEJ645vS0y33AUT48/hPJQeFtNIaOJEW1tZDCVx3tIcOpVUrF4iG83UwA1P4HksCxygY3Rz8+6YbEOoea80nXdv+z75Ndkg8mg4wG53eyAfPfBh/zxl+G3G/uYq56BoROKs4eVQEwC8W1dQnF/iy60OMaGGp0JHxL4OFXs06gLmc8z2lng9dqODIXEvH35dISAaWBr/TnzAnYi7pCWI2yfeDwz0o8Le/6WKexUk0N9WkfXWNJRdwWpts6MshmDg+OQ8DP8qHZBuxqeXUp0elby7woqf+WLoAXcIlVvENJpADInOdvosTW2N6MwnEmsCTNcVv5GuY6gxW8X9BboUhQeFje8NVpaZU0o2gWQlXdkRcxMGQm10i9auGYHN8jwoxL5KImS+CZrrBpVAC1vNd8BTXklwUIVDI5TIyrmFQ1Kj6N/O9GG0QlM/iQnqrXiphcI1iidNQPLk8UaMXAbmP1DqxOo468Iu47BZG0Z1EGLbDulmI/MR7fRY5UesUnsMtonAcM0DcgJpxUWhc/sRh4IHgUG7ke+WQdBzgOzAV98rB7g6R+SpCB+as02lqGfPJmyoX0K76DoOoX2rQbRMmytGLm421v1MYJqLtpQNtafLkkvl/rXqAYRpRPBif3lpgs229+yrUKkHfJ8Z/whOw1VmZG7B9cnkHLLYsvMTTJFA3cBQRpyzLcV8ry85786IGhbAecol6GGXalOwIHHNmRg0wftKAytzVOLDUudLmmYWjjJVVWucPd2Y
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8483.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(56012099006)(3023799007)(4143699003)(11063799006)(5023799004)(38070700021)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWcrNE8zMGxSRWtjbCtuVW5aL3dIYzZudmxHMTNOdFpLM0JXWFU2U2FQQkh0?=
 =?utf-8?B?TTNDa2NwSjNpUXZiSGFOWFpmUzVEcE1wYWVORC84NUdLNkxoMTdDRzlSVkJ5?=
 =?utf-8?B?WE43dFVMYW9sZlpaeFIwUEV4UVI0M0xHTXJhUVBjblNCZ3VGWDBYVktIY2Jk?=
 =?utf-8?B?L2pXcC9qSkhIdXUycGhDbjR2aThWOTlFbmEvT3BIaEZuWVpxQUZoWU1NTVY2?=
 =?utf-8?B?bStaM3YwRjdxUkc2ajBnSVV0TkQrWE5IeTFoanhFT2NUV2pDZDllYkFoMFBM?=
 =?utf-8?B?R281R3ZBblBmYW4zNjZSVEFrbEhkQTZjbFF0V2xxVGM2Z0RZVHd1RXVONHV1?=
 =?utf-8?B?bXVLOWRTZGhCZDVhOGJOVFl0RkFxY1JubTdOVFFrTzZTOFJQc2k2dHdZTGZ1?=
 =?utf-8?B?cHhiY3ZTUUs5VHpPU2FEUXgxenNINUt3RVltU1NDQWRUNkMxNGVRSG9NTzlB?=
 =?utf-8?B?SzB3OXg4cWRGZGN5V0wxWHZxRVB5UzFhd3ErNnBaZDl0NEpUNFIyM0xUNno3?=
 =?utf-8?B?L0x1U2dxRXhKR1Q1MTlGR2tNa1lBNk82NG51K29Za2FQNUM3K2xad0dwTGZ3?=
 =?utf-8?B?OHY4TjFUNzI5ekc2NWU0SjRIbWlNTmc1NnBLMHZrWGNZWnAwM3BVK1lpNjdm?=
 =?utf-8?B?a2s0R1BNdmVyeWJCbXF0QXpPVDBNUGJWWnlnMElCbmNBakU3V3NBQmJ6OXpw?=
 =?utf-8?B?YU9uZDVDYW1YNTY5azljaFF5c0hVQVJ2QklZNHRsRDdtZWVzcFo5K21pWjlz?=
 =?utf-8?B?S0RteVRwbTg3V0FYUUVKNXJad2tiT2RVdXBaSmE1ZXl0UmJMdU9VNTJ2MGRD?=
 =?utf-8?B?REhMVzd6TDQ3Ty9tSUhYdnBMMkw2a2JhNy96NWhxUzI5RHd0cmJkaGRzckJB?=
 =?utf-8?B?ZVEzVEg4L3dGTlY2QVUzbHRDTzJoVEM2bktGOXg3VC9rbFEvSEd1empqOW5X?=
 =?utf-8?B?VnpkK1dVUjh3WnZuN2hBMHQ5Q0Y3RlN1QWlaMG1xbmtQMURKWjg1U3JwbFJp?=
 =?utf-8?B?aE1sVkovM3hZcEduaTlOYjRiVmJIOUpXdE5BMFBQYjVoOVh1azBOZDdmTmJP?=
 =?utf-8?B?Mk5iWEcvUVo4eEtKa3E0WnErSEpVUS9nTmRvN29ZVmdSdE0wY1BSYmowSnBr?=
 =?utf-8?B?ZFpEVnRzZHpjRUY0QVc2enhTVzRpb1NBUlJrTTRVK0tQazJmZ25lRTI1SXJQ?=
 =?utf-8?B?WktZVVZ5amUvYTI0a1ZnVjJPcWRDdjVHZFNsekt3OUdQdEZtdnJqcXBLRnVn?=
 =?utf-8?B?MVpVK0E5SWFuWnVoVGxiclpXOUlHT0hzVzB4RFErZkZRMXNOYUFiRnl4amZN?=
 =?utf-8?B?UmdJdGlsVzBDVnR2b1RDL21XTkNFUUFqQzhXZnR1TEFXVlpBREJuQzVianUx?=
 =?utf-8?B?WXhINXpFNjV4dWVTVkt4cnpuRmtZNm5TTDVXSzQ2d2Z1TmVOYzhUcXhlK1I5?=
 =?utf-8?B?R3pQYXZVTTZrWW9MTEZXZ0FrWUZXNXNLaDYrTWd1QU1neDVrOUdRb0lRZ3px?=
 =?utf-8?B?bmRxaVQya0UxNC8zMVdjNGs3WTB3N1k5NkpxQzd1MVhGZ2IyRUpVTFBzZjRX?=
 =?utf-8?B?YldXb1ZLQkZJYmpTRmVqWkZRVGhOME1RYy9uYnRMMXFsMjFxSXJINEREZ1Js?=
 =?utf-8?B?OUU2b3dNOVNVL1hIOVdHWmpNWUc5RUJ4alhVaXlRSlRZdHYwZVc2ZTNUVUZU?=
 =?utf-8?B?cCsyVS9OQjdiZ3pqZmwveTMzekxQSEkxWWRwcjlRNWhWdU5FMnhYYUtLTml3?=
 =?utf-8?B?L3ZQTGI3MklGSXYrZmVYcnYySWRoWlpDTFYrTUgxZzl4blY2M1JlRFhsSW1N?=
 =?utf-8?B?cUhqc01aMVZNclJCQUlaWWJwOXBOVnVVNlB3VmtnTEYvUzJYT2RKUzFzSWZQ?=
 =?utf-8?B?Zm1Demg4U29kMXpsU0tKTmUzcGo0U1hwL3RTQ3B2bGp0K3QrL1ljSzR6UlJ4?=
 =?utf-8?B?TkJ0emsyY3hFbVAvTVI0OG5OQkJnQmYxNFJVeFNSMnpNMzBHaTEyQ2xoc2tI?=
 =?utf-8?B?UXhHWlVibFFaZlA4UzJPbUdjUzV2cGdtaDdOL3lkQlBzSU1RbUtWZXVmQnJV?=
 =?utf-8?B?RXZ2c0xFRUhzaEJMeHFML1Z1dTdxdFhJU1htMlRqNUdEdWZOQW4reGlPSWwr?=
 =?utf-8?B?STk2bzZCbHUxZEN0bzRZUzNRdGcrOHJ2T3JHUWJEMTlmOU1qVzN4RzRVNmtQ?=
 =?utf-8?B?MWw4SzY1aU1DdTZ5NUc2WFEwaDNpWTRLUzRtUStEY1RSOTNSNmROenpMLzlr?=
 =?utf-8?B?SGlNcTlnY0xiVStsdmxSdmh1QW9sWmM4T2xyYkhFeDJ3Ymx3TG5CT0tWZGFE?=
 =?utf-8?B?b2o4dExUczJPSzNncDN2a2Y1bjBSNlVyd1dVaTBmMW9QK0d4OTN4Um1VbVpG?=
 =?utf-8?Q?e7HpS/q4ZebzBHfs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: N7fpvX7ZAhRRGNNFKpQBBKieWZXOpDzs3ZSetl9mDnHa1qOcLVU9Jc26D+PLbac8HlXjONXe5fTNqb6QXEMYuPIHSyKTEw2Hk/vqK5nbN/So8njFUNauUEc9NKc5Ypn8vlB9sK8borWuuv3EzTuNnCpg51InRpi92dACa3VuMQyUEdk+Icy1Ph/F7yOZ1GoSC1HkWNuy4/lvz5ZlYNKADEhpIO0NULo7GpVnLouZe014b3RE3/BqqMlfYSMaG6/kLrlv77VTadaiWZcK+N0CPo/bVDqcVMI6vy6aEh93qlEVWgrZOsCA57/q+MQkkTDXpBtSLmm3pwzzmt52U+HDAQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8483.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb18090-b518-4524-085d-08decc25e0d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 04:06:59.0991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CBuSECggIDR4ts+DOp0LzKMbfLSXxsT9aarnHHH8c0YlZMG6Ge5oVLlC5R6HyW+AMlQS/zCoXUKZ8hb2hCB4v1DYCGYGWe/utlRAsdHtVxzhGafVamFIIHUSYTofnt+N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4538
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

SGkgS2FtaWwsDQoNCkkgaGF2ZSByZW1vdmVkIHJhY2UgdGVzdHMsIGFkZGVkIG90aGVyIHRlc3Rz
IGZvciBTVk0uICBPcmdhbml6aW5nIGFsbCBlbnRyaWVzIGluIGFscGhhYmV0aWNhbCBvcmRlci4N
Cg0KVGhhbmtzICYgUmVnYXJkcywNClZlbmthdA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KRnJvbTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29t
PiANClNlbnQ6IFR1ZXNkYXksIEp1bmUgMTYsIDIwMjYgODo1MiBQTQ0KVG86IE11cHBpZGksIFZl
bmthdGVzd2FyYSBSYW8gPHZlbmthdGVzd2FyYS5yYW8ubXVwcGlkaUBpbnRlbC5jb20+DQpDYzog
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IER1Z2FzdCwgRnJhbmNvaXMgPGZyYW5jb2lz
LmR1Z2FzdEBpbnRlbC5jb20+OyBLZW1wY3p5bnNraSwgWmJpZ25pZXcgPHpiaWduaWV3LmtlbXBj
enluc2tpQGludGVsLmNvbT47IERhbmRhbXVkaSwgUHJpeWFua2EgPHByaXlhbmthLmRhbmRhbXVk
aUBpbnRlbC5jb20+OyBWaXNod2FuYXRoYXB1cmEsIE5pcmFuamFuYSA8bmlyYW5qYW5hLnZpc2h3
YW5hdGhhcHVyYUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIGktZy10IHYzXSBpbnRl
bC1jaTogQWRkIFNWTSwgbXVsdGlfcXVldWUgdGVzdHMgdG8gWGUgZmFzdGZlZWRiYWNrDQoNCkhp
IFZlbmthdGVzd2FyYSwNCk9uIDIwMjYtMDYtMTYgYXQgMTU6MDU6NDIgKzA1MzAsIFZlbmthdGVz
d2FyYSBSYW8gTXVwcGlkaSB3cm90ZToNCj4gQWRkICBTVk0sIHJlbmRlciBjb3B5LGNjcyxjb21w
dXRlX3ByZWVtcHQsZXhlcmNpc2VfYmx0LGV4ZWNfbWl4X21vZGVzLA0KPiBhY2Nlc3NfY291bnRl
ciwgZmF1bHRfbW9kZSxtdWx0aV9xdWV1ZSB0ZXN0cyB0byBmYXN0ZmVlZGJhY2sgbGlzdA0KPiAN
Cj4gVjI6IGFkZCBldS1mYXVsdC0ybS1yYW5nZS1kZXZpY2UtaG9zdCB0ZXN0IChGcmFuY29pcykN
Cj4gdjM6IGNvcnJlY3RlZCBzLW8tYiBhbmQgRnJvbQ0KDQpUaGlzIHYzIGNoYW5nZSBicmluZyBu
b3RoaW5nIHRvIGRlc2NyaXB0aW9uLCBzaG91bGQgYmUgcmVtb3ZlZCBhdCBtZXJnZS4NCg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogVmVua2F0ZXN3YXJhIFJhbyBNdXBwaWRpIA0KPiA8dmVua2F0ZXN3
YXJhLnJhby5tdXBwaWRpQGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC1jaS94ZS5m
YXN0LWZlZWRiYWNrLnRlc3RsaXN0IHwgMzUgDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKw0K
PiAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS90
ZXN0cy9pbnRlbC1jaS94ZS5mYXN0LWZlZWRiYWNrLnRlc3RsaXN0IA0KPiBiL3Rlc3RzL2ludGVs
LWNpL3hlLmZhc3QtZmVlZGJhY2sudGVzdGxpc3QNCj4gaW5kZXggYWNmZjAyNWZhLi5lM2IzZjIx
Y2MgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsLWNpL3hlLmZhc3QtZmVlZGJhY2sudGVzdGxp
c3QNCj4gKysrIGIvdGVzdHMvaW50ZWwtY2kveGUuZmFzdC1mZWVkYmFjay50ZXN0bGlzdA0KPiBA
QCAtMjE1LDYgKzIxNSw0MSBAQCBpZ3RAeGVfd2FpdGZlbmNlQGFic3RpbWUgIGlndEB4ZV93YWl0
ZmVuY2VAZW5naW5lICANCj4gaWd0QHhlX3dhaXRmZW5jZUByZWx0aW1lDQo+ICANCj4gK2lndEB4
ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3JAZXUtZmF1bHQtMm0tcmFuZ2UtZGV2aWNlLWhvc3QNCj4g
K2lndEB4ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3JAbWFueS1leGVjcXVldWVzLWZyZWUNCj4gK2ln
dEB4ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3JAbWFueS1leGVjcXVldWVzLWZyZWUtcmFjZQ0KPiAr
aWd0QHhlX2V4ZWNfc3lzdGVtX2FsbG9jYXRvckBvbmNlLWZyZWUtcmFjZQ0KPiAraWd0QHhlX2V4
ZWNfc3lzdGVtX2FsbG9jYXRvckBwcm9jZXNzLW1hbnktZXhlY3F1ZXVlcy1mcmVlLXJhY2UNCj4g
K2lndEB4ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3JAdHdpY2UtZnJlZQ0KPiAraWd0QHhlX2V4ZWNf
c3lzdGVtX2FsbG9jYXRvckB0d2ljZS1mcmVlLXJhY2UNCj4gK2lndEB4ZV9yZW5kZXJfY29weUBy
ZW5kZXItc3F1YXJlDQo+ICtpZ3RAeGVfY2NzQGJsb2NrLWNvcHktY29tcHJlc3NlZA0KPiAraWd0
QHhlX2Njc0BjdHJsLXN1cmYtY29weQ0KPiAraWd0QHhlX2NvbXB1dGVfcHJlZW1wdEBjb21wdXRl
LXByZWVtcHQNCj4gK2lndEB4ZV9jb21wdXRlX3ByZWVtcHRAY29tcHV0ZS10aHJlYWRncm91cC1w
cmVlbXB0DQo+ICtpZ3RAeGVfZXhlcmNpc2VfYmx0QGZhc3QtY29weQ0KPiAraWd0QHhlX2V4ZWNf
bWl4X21vZGVzQGV4ZWMtc2ltcGxlLWJhdGNoLXN0b3JlLWRtYS1mZW5jZQ0KPiAraWd0QHhlX2V4
ZWNfbWl4X21vZGVzQGV4ZWMtc2ltcGxlLWJhdGNoLXN0b3JlLWxyDQo+ICtpZ3RAeGVfZXhlY19t
aXhfbW9kZXNAZXhlYy1zcGlubmVyLWludGVycnVwdGVkLWRtYS1mZW5jZQ0KPiAraWd0QHhlX2V4
ZWNfbWl4X21vZGVzQGV4ZWMtc3Bpbm5lci1pbnRlcnJ1cHRlZC1scg0KPiAraWd0QHhlX2V4ZWNf
ZmF1bHRfbW9kZUBpbnZhbGlkLXZhDQo+ICtpZ3RAeGVfZXhlY19tdWx0aV9xdWV1ZUBzYW5pdHkN
Cj4gK2lndEB4ZV9leGVjX211bHRpX3F1ZXVlQGV4ZWMtc2FuaXR5DQo+ICtpZ3RAeGVfZXhlY19t
dWx0aV9xdWV1ZUBmZXctZXhlY3MtZHluLXByaW9yaXR5DQo+ICtpZ3RAeGVfZXhlY19tdWx0aV9x
dWV1ZUBtYW55LXF1ZXVlcy1iYXNpYw0KPiAraWd0QHhlX2V4ZWNfbXVsdGlfcXVldWVAbWFueS1x
dWV1ZXMtYmFzaWMtc21lbQ0KPiAraWd0QHhlX2V4ZWNfbXVsdGlfcXVldWVAbWFueS1xdWV1ZXMt
dXNlcnB0cg0KPiAraWd0QHhlX2V4ZWNfbXVsdGlfcXVldWVAbWFueS1xdWV1ZXMtdXNlcnB0ci1p
bnZhbGlkYXRlDQo+ICtpZ3RAeGVfZXhlY19tdWx0aV9xdWV1ZUBtYW55LXF1ZXVlcy1wcmlvcml0
eQ0KPiAraWd0QHhlX2V4ZWNfbXVsdGlfcXVldWVAbWFueS1xdWV1ZXMtY2xvc2UtZmQNCj4gK2ln
dEB4ZV9leGVjX211bHRpX3F1ZXVlQG1hbnktcXVldWVzLXByZWVtcHQtbW9kZS1iYXNpYw0KPiAr
aWd0QHhlX2V4ZWNfbXVsdGlfcXVldWVAbWFueS1xdWV1ZXMtcHJlZW1wdC1tb2RlLXVzZXJwdHIN
Cj4gK2lndEB4ZV9leGVjX211bHRpX3F1ZXVlQG1hbnktcXVldWVzLXByZWVtcHQtbW9kZS11c2Vy
cHRyLWludmFsaWRhdGUNCj4gK2lndEB4ZV9leGVjX211bHRpX3F1ZXVlQG1hbnktcXVldWVzLXBy
ZWVtcHQtbW9kZS1jbG9zZS1mZA0KPiAraWd0QHhlX2V4ZWNfbXVsdGlfcXVldWVAbWFueS1xdWV1
ZXMtcHJlZW1wdC1tb2RlLWZhdWx0LWJhc2ljDQo+ICtpZ3RAeGVfZXhlY19tdWx0aV9xdWV1ZUBt
YW55LXF1ZXVlcy1wcmVlbXB0LW1vZGUtZmF1bHQtdXNlcnB0ci1pbnZhbGkNCj4gK2RhdGUNCg0K
UGxlYXNlIG1vdmUgdGhlc2UgdGVzdHMgdG8gcHJvcGVyIHBsYWNlIHNvIGxpc3Qgd2lsbCBiZSBz
b3J0ZWQgYWxwaGFiZXRpY2FsbHkuDQoNClJlZ2FyZHMsDQpLYW1pbA0KDQo+ICsNCj4gKw0KPiAg
IyBBbGwgdGVzdHMgdGhhdCBkbyBtb2R1bGUgdW5sb2FkaW5nIGFuZCByZWxvYWRpbmcgYXJlIGV4
ZWN1dGVkIGxhc3QuDQo+ICAjIFRoZXkgd2lsbCBzb21ldGltZXMgcmV2ZWFsIGlzc3VlcyBvZiBl
YXJsaWVyIHRlc3RzIGxlYXZpbmcgdGhlICAjIA0KPiBkcml2ZXIgaW4gYSBicm9rZW4gc3RhdGUg
dGhhdCBpcyBub3Qgb3RoZXJ3aXNlIG5vdGljZWQgaW4gdGhhdCB0ZXN0Lg0KPiAtLQ0KPiAyLjQz
LjANCj4gDQo=
