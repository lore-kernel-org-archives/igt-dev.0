Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E5DC44520
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 22:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8628810E218;
	Mon, 20 Jul 2026 22:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RnV+rjy3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097DF10E218
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 22:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784587877; x=1816123877;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lFfxK8p5J9Zadb9i7JrU77igvMjSjcyXZ9/iaxKIzts=;
 b=RnV+rjy36XT68dIdp4HE02vCGRnYNc50Mp0vj+jJC5s93pAY8vT5Mppa
 rpX4uxHfGkB4SYQk+V0errLAqye4QqI88zM4mgLIaBhwUOPJnBl7dj8EL
 gjc1UYx43zdNJRHK6pwcY6wLlLPUvQjowYqCiEBpXrawFtYdjYmX3I/sy
 iDtQoae3+12w4BmpRaTwuBKU+21AIHI7TPLXi2IWJincqaAhtG/hHAUJb
 u/Z6zEzqGDdEjrLrAFDulAa7itqEImC/GWHPRhzYKw4LLG9OhOl/qKCtR
 hu1dL2/zFZYEmAyGovGVuT1zB0B0MRqgRZZmRhRU4PsbZq5hKOItTQCu6 w==;
X-CSE-ConnectionGUID: EGcC5Kx6TZa7EIeO+t8J6A==
X-CSE-MsgGUID: 76o1ikFATOSChDKapzke8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85201628"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="85201628"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 15:51:16 -0700
X-CSE-ConnectionGUID: 7+XiVW+0RQ69ZYP6qEGRXw==
X-CSE-MsgGUID: EfONEbstQsGtyNts5P84Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="259571054"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 15:51:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 15:51:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 15:51:01 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 15:51:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZlY0oBfYxTRqMNqRrskHffvd9emg9QdzZzbCCcdThFT5IobarsKG9Pd784Pn0YZLzNHpQsWlwu46oktVaGqoOsqj0kmvI4KhDOTYuJkWcYw6azV/8YeIWn2uF/E95+kax3z0rI6rlHw/QyjWzTp00P8rAj3WVJUK1O5bkx5SIRyEI0Qf/Vhpj0SUVtFvYIddOQgeqq8oKaVzobSYcsbaqtt6PnAzfhM3o4fhn4qOzoLK7s3/5s/7HS8VFrjjOgrrKD1F0Zj8CU/rVawZuz4/GrrkIs3xvfOTVt9weDgBZPoFRJ2mq6AeAnThtMQl3cR4JgW1znyGoBu+WHUS+iq+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFfxK8p5J9Zadb9i7JrU77igvMjSjcyXZ9/iaxKIzts=;
 b=ZzwlupJivlsi+Ef31lIby1N4Lq0x9g9zhl6Oa91YlN0b5Ik2gDkTfe0ME8BWxem5UIN7fILOg92842xYy2BHg6BZWRKR0b2nC7Tgu1AfQuor/CLHekZbwbWGIZMTMDYcrImfEyXyVnT10k7witH3fyf1vXUtDw0rajVm7JiII68zz3mBW872wNuvrMLI87GjyLfszVJ1dsvCNKzW8YzxzHOYsCIP8ijS8dcWUVMczDAuNMRTbfury9URYs7QXMU7/cj8B3aU/AZlYKV0qF530wpX9N8ufVzvjXDXS+RPrQJdY3CuwBizkQKbP239Ut1271nQ/icN0rDuGBFHBR2zgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5395.namprd11.prod.outlook.com (2603:10b6:610:ba::6)
 by SJ0PR11MB5213.namprd11.prod.outlook.com (2603:10b6:a03:2da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 22:50:58 +0000
Received: from CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490]) by CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490%4]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 22:50:58 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Zuo, Alex" <alex.zuo@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_pxp: Require output for display tests
Thread-Topic: [PATCH i-g-t] tests/intel/xe_pxp: Require output for display
 tests
Thread-Index: AQHdGJmlsIZFR22S60qmmXcy6x+m5rZ3AtIQ
Date: Mon, 20 Jul 2026 22:50:58 +0000
Message-ID: <CH0PR11MB5395E5947DED0B108D996721E5C32@CH0PR11MB5395.namprd11.prod.outlook.com>
References: <20260720224635.1963815-1-jonathan.cavitt@intel.com>
In-Reply-To: <20260720224635.1963815-1-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5395:EE_|SJ0PR11MB5213:EE_
x-ms-office365-filtering-correlation-id: 785e23fc-0a25-40a7-87fd-08dee6b15d90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|23010399003|366016|18002099003|22082099003|38070700021|3023799007|56012099006|5023799004|11063799006|10067099003;
x-microsoft-antispam-message-info: a/l6NNL83Lg0AnsSJTsMS6XuOR294yrpONQOvFvpdXwp5ypV2XkH3dN0W41QUC44S2KHSmACMhjRuMkT9WHUDpDp3FyrmEFdiVntFCl+fyKRRlC9nbw8i0Px/CyQSw0VH4WxPORPyasN/7KTXw9y271A47EGw3jv/6HVFnOXDSvgCgFWEeeArqUp6zsphnOZ72jsuO13dQtKVIcwZGzGEa9JkwaOPyHXYlxs80aWyf6LWEcvwCyTVqywnF45jsd/pUzTXr8PxsulXFsaxQe6lRUQ2FvxOBJjW1KdlbcOZNrrd0X5SJ6L1ZAJbTRiQ5P6ihrwjoEU2386QWJNYio888iIdwc7pqcx9VxiuK2xhBKMo4r1QMK85H4C+qSyVQ/Z5KK4RDIJHhodVLoVHG2EqFPnyjFphIvv4ZrESojMDyppCR1/0RMwaymxlWBogU7crIZtqsjqN3gSfFafhdEQ3rINHtTc5UMagQYtTtWjIjWo/jq4DKCEz8l2FfvnHEK1u/48bylnmCA6RXD6INEfQvIHkFCicfBiRJnfdtH6QeYr9s3d6tI7oGfffWjUC0FP0zM790hanvj6fyqxVwxW0zA//JTpmMzdgMS63wB/jVzXeM7l8etffYbM7KuG2/RMXLlzU9GGr2WFUdsIiXMMWMUBeIGCDc0bj7/RDQB9nRoEqNExc3DuaJiG9qx+ZfQpsVXr2P7GdTmpBI0CYYtm57Ws8EJGT1H1XniJz8ThXao=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5395.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(23010399003)(366016)(18002099003)(22082099003)(38070700021)(3023799007)(56012099006)(5023799004)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2hlRXNDbFhqUEZVOFhRanBsUGI5dHFLUG1mNElRdk5SaVU0NVVESTFmVEZW?=
 =?utf-8?B?Q3hEWDRaVmhqejlxenF0QTg1UWRWaVVPbFN0ZVQ1RTAxSmhPRzgvS1ViVUFY?=
 =?utf-8?B?NEV3OTk4VHpFdGNiYnUyUkhSSHlZaUlnSXFkaW1tUFhhQ3gwdGpka0FySXQy?=
 =?utf-8?B?VWp0emVBVTNqY2hYNy90a0hwZUlYUEZweXZLZHdIL2ZXOHc4S2Z3VFhGa0JY?=
 =?utf-8?B?NXBPcmtMckZpeFhpWkN3bzJzQldJK2UvY2FnTkRtdy9LcnltUU9OL1NaK25h?=
 =?utf-8?B?TnNaaXJ3elVuQUZrckcyUGRkekpDQWZDa0lXWmg5bzJ1aVM4amxLeU5JN2Vx?=
 =?utf-8?B?OExkdEFFRjNreEtOQnlOQ25EL0ZiSmlQNHR4d0JiN2pJMzhRcDJyczVRamlw?=
 =?utf-8?B?Tjkxb1BreTg4aXViMGJCZGhUSk9qREVkVXVEWWVWV0NDa1JGZ3NYMmVxYzh3?=
 =?utf-8?B?alVVcE9rTUNBT2lCamxFY1dsT1Qvb2ZBc0dwSUVQaDdaUmhxajd5cXdwOGxj?=
 =?utf-8?B?UGJhTVpqRGhobk1iSUF6WlQzRmV0VGwwSjhnOTBiVVAvSmJYU1MraGxBeUZX?=
 =?utf-8?B?TDR5cXBHaDNiRUVObjRrUmVCNHVSeDRoYW1lS2U3QnN2NUc3RTVuQ0VnaGFy?=
 =?utf-8?B?Y0tyR0RpN01RV3AzT2h0RmRqMEFWRUJWTGhPRFJ1S0tBNlJaZFgrNjhHOUF6?=
 =?utf-8?B?ekM2bkhqcG5RZXhNSFhYRzQ3LzBZRjBjNXFoMUJtUHp6c092TEp4c0pRaEtR?=
 =?utf-8?B?ZytSemY4SCtoanBZVU1ISGhxRWFPZHFUYkpCdkk1LzBtaERDVUdNN29xZ1hu?=
 =?utf-8?B?Uk1mRkU3a3BjS1RsWnZPVnJrcTU1LzZIT0FhbTlPcHJsazNwbzhqWFFZVlJS?=
 =?utf-8?B?U1VNaXd1Y2x3V3BrT3JTc0VsamFOdVB5MFhsNFZpWXZqeFRINjgxamF5VW9G?=
 =?utf-8?B?WXlPYlEwN3E4b1dLQTR6T2RQMmd5a2IzMGh4T2lQN2FVU0FnSjBpN2l2ZThV?=
 =?utf-8?B?LzRWbFdtckI5ck9ucmkwVUN2MVZqYTdWZG5HNlBGRktrL21NWjd6OXVOdDNR?=
 =?utf-8?B?UElPeFZxMUsrcnVpcC81UHQ0SUNSaHd4ZzVHL1FqYTZsb3BJWEFFS1VYdUtP?=
 =?utf-8?B?NGhYRWlJWk8vOTA4aUZ0MFVUejNIMGlpcnY2cmxCaXhCb2tVNFQ3WXIvcnFq?=
 =?utf-8?B?c3BmWG9VVGNIZnpNYjlJVkd3VU9JSjc3YlJlMWxnSWdqTkdPMnZWS3R4Wkoy?=
 =?utf-8?B?aUh6MDhQSUJGWVovSno5ekRwQ09vQU1ldmsxN3AwNXdjajQza1VaM2hMbm8x?=
 =?utf-8?B?d3FCYm94RHBKcFdkK2pQUUcrUkUzU1FqekpoMVdXZzVCV1VoUFZ4dmg4REhl?=
 =?utf-8?B?STk2ZTJxTnVHWTB1K2hsNmcxZGI0cEcvRlZlZkNrWGx0U2luL1lUVVhZNTFq?=
 =?utf-8?B?N1RSRTF1alEvSE4ybDR0L2VXNUtvMnhYeXR6dzRBUHZreEZpU2FyRytJTWJp?=
 =?utf-8?B?WmRJbjVTQ1NYd3FwQ044cHRqc2FFZURtUm1ycmFNbUZZRlFpN2cwM3hOVnJL?=
 =?utf-8?B?TWRlZUZJUmpXMzFHWVRsMTN1b3F3UEJnVGh6aVRBRVUyOTBJOXVXRU9HSE9n?=
 =?utf-8?B?SVRaR1pmdzA2Rnpmalpqd3BhbzZZa2NMQUtEZGQ4RjhGTmVNUFNmOXBJeWo1?=
 =?utf-8?B?YXB6SEdEMGtzZ3ROTmpXWlBLYndqUzhxYUlVcnU2V3N5ZFJYQmdQVENrVTE5?=
 =?utf-8?B?OWxhSENCTUpKeloydm5sZEtOeVlqWlZ3NmF6OXdZNmc0SU1EcUljR09QZ0pl?=
 =?utf-8?B?ZzhuMmQ1cVhpazM4NW1GUjVXTi9hc1plRVk0WURYeWRJM3pOVVZFb0Jkc3dQ?=
 =?utf-8?B?S2ZBbTlOaHVWV0IrQnk2ZWdNbXBYejNzdXNHN1FadXh0dlRONkdUM1cxVzR1?=
 =?utf-8?B?QnNoV2NBbGhqelFNNmxGeGtvYytwZ1NrUTZyWmVPVkdKN2ZQSFE5S2ZwMVVH?=
 =?utf-8?B?SHk5Y0Izb1VkSVY0TkhBWHIrckFpU1E4ZGYxaGdmVk9wbjNsUmVMblVTQXl2?=
 =?utf-8?B?MDQvQ09MQ1k2Z1Q2d2NZVHJtQjF0RmN0QUQ3OEdRNXE0OGJKZTNxOGRvay9n?=
 =?utf-8?B?OW0zMFFiTzlyR0N3NFEvUVJ1K1IzbWtPNWZVSU8yVVc4SzBiNUt6SFM5cXd2?=
 =?utf-8?B?K2I1NmpQNEtxME9zWDhIWk9USnRpd0x0K3FqbURCMUFlVVNua0pxR2srUUU4?=
 =?utf-8?B?L05pakVETXFvR0FzT1B0dklvV1NLQWlHbXJCbTM3QUd3Rlp5endSam1zeTFw?=
 =?utf-8?B?RmxtM2NsNm1KWTRQci9adWN2RGYzT1ZGYjNTN0szejBuVVRrREp0UnZvRURF?=
 =?utf-8?Q?JkLkOyftxjcrqECPf4R+A8lFhLoCx6m59+TKddttr8JT9?=
x-ms-exchange-antispam-messagedata-1: EJK+gGOog2jAgQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: H6gBZAmO8ghk9fK/AZfKW/WNqAco6HkkQSrFO1sg/63X8ikk2/NZcjclXZSlaBYww4aqMr9tHOA2iuDfWeg5/lR7PXtuq0MtmJg/19DXBR00R9fCvilTdl3Sqob4d+jv6iVfOpqeKLmMPr1sAblkKRgZUPBfogPOzvCBrQpBVca8yPOmbjXqJxPPh3rXya67THWwM+NpGUvk16hYAAVVm89tBkcHgf8hXw01nwXwy2Oyc8odKtW/D1hQH+5q7+xs/2NdYVhAuF2BnRVLPE5bKZg9/A7So3LjyH5+PWFzN0gGBOdjBoV8JfY4fQ6AswICVmdyckUNqe6OW7YxQ6AhPA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5395.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 785e23fc-0a25-40a7-87fd-08dee6b15d90
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 22:50:58.6045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ciLGm4sDkAOBa5NJE3aWeSK7dbVAuuYbRoN868GorhZC/po6avGSRAuU/phcwPFD3T9UhM8Ys+rWNzUg9HqGnpxTn9zJ5dam5gPSk2ZFBKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5213
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IENhdml0dCwgSm9uYXRoYW4gPGpvbmF0
aGFuLmNhdml0dEBpbnRlbC5jb20+IA0KU2VudDogTW9uZGF5LCBKdWx5IDIwLCAyMDI2IDM6NDcg
UE0NClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IENhdml0dCwgSm9uYXRo
YW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVs
LmNvbT47IENlcmFvbG8gU3B1cmlvLCBEYW5pZWxlIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50
ZWwuY29tPjsgdmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20NClN1YmplY3Q6IFtQQVRDSCBp
LWctdF0gdGVzdHMvaW50ZWwveGVfcHhwOiBSZXF1aXJlIG91dHB1dCBmb3IgZGlzcGxheSB0ZXN0
cw0KPiANCj4gVGhlIHN1YnRlc3RzIGRpc3BsYXktcHhwLWZiIGFuZCBkaXNwbGF5LWJsYWNrLXB4
cC1mYiBib3RoIGNhbGwgdGhlDQo+IGZ1bmN0aW9uIGlndF9jcmVhdGVfY29sb3JfZmIgd2l0aCBh
IHdpZHRoIGFuZCBoZWlnaHQgdmFsdWUgZ2VuZXJhdGVkIGJ5DQo+IGdldHRpbmcgb3V0cHV0cyBm
cm9tIGZvcl9lYWNoX2Nvbm5lY3RlZF9vdXRwdXQgYW5kIHNlbGVjdGluZyB0aGUgbWF4aW11bQ0K
PiB3aWR0aCBhbmQgaGVpZ2h0IGFtb25nIGFsbCBhdmFpbGFibGUgY29ubmVjdGVkIG91dHB1dHMu
ICBJZiB0aGVyZSBhcmUgbm8NCj4gc3VjaCBvdXRwdXRzLCB0aGVuIHRoZSByZXN1bHRpbmcgdmFs
dWVzIHdpbGwgYmUgemVybywgd2hpY2ggaXMgYW4gaW52YWxpZA0KPiBpbnB1dCBmb3IgdGhlIERS
TV9YRV9DUkVBVEVfRFVNQiBpb2N0bC4NCg0KQWguLi4gaXQncyBhY3R1YWxseSB0aGUgRFJNX0lP
Q1RMX01PREVfQ1JFQVRFX0RVTUIgaW9jdGwuICBNeSBtaXN0YWtlLg0KSSdsbCBmaXggdGhhdCBp
biByZXZpc2lvbiAyIGlmIHRoYXQncyBuZWNlc3NhcnkuDQotSm9uYXRoYW4gQ2F2aXR0DQoNCj4g
DQo+IFNraXAgdGhlc2UgdGVzdHMgaWYgdGhlcmUgYXJlIG5vIGNvbm5lY3RlZCBvdXRwdXRzLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50
ZWwuY29tPg0KPiBDYzogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1
cmlvQGludGVsLmNvbT4NCj4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwveGVfcHhwLmMgfCAxNCArKysrKysr
KysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYg
LS1naXQgYS90ZXN0cy9pbnRlbC94ZV9weHAuYyBiL3Rlc3RzL2ludGVsL3hlX3B4cC5jDQo+IGlu
ZGV4IDkzMjAwNzg3MzMuLjA4MGRjOTUxOWUgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL3hl
X3B4cC5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX3B4cC5jDQo+IEBAIC04NjgsNiArODY4LDE4
IEBAIHN0YXRpYyB2b2lkIGNvbXBhcmVfY3JjcyhpbnQgZmQsIGlndF9kaXNwbGF5X3QgKmRpc3Bs
YXksIGlndF9mYl90ICpyZWZfZmIsIGlndF9mDQo+ICAJfQ0KPiAgfQ0KPiAgDQo+ICtzdGF0aWMg
dm9pZCByZXF1aXJlX2Nvbm5lY3RlZF9vdXRwdXQoaWd0X2Rpc3BsYXlfdCAqZGlzcGxheSkNCj4g
K3sNCj4gKwlpZ3Rfb3V0cHV0X3QgKm91dHB1dDsNCj4gKwlib29sIGNvbm5lY3RlZF9vdXRwdXQg
PSBmYWxzZTsNCj4gKw0KPiArCWZvcl9lYWNoX2Nvbm5lY3RlZF9vdXRwdXQoZGlzcGxheSwgb3V0
cHV0KSB7DQo+ICsJCWNvbm5lY3RlZF9vdXRwdXQgPSB0cnVlOw0KPiArCQlicmVhazsNCj4gKwl9
DQo+ICsJaWd0X3JlcXVpcmVfZihjb25uZWN0ZWRfb3V0cHV0LCAiRGlzcGxheSBoYXMgbm8gY29u
bmVjdGVkIG91dHB1dHNcbiIpOw0KPiArfQ0KPiArDQo+ICAvKioNCj4gICAqIFNVQlRFU1Q6IGRp
c3BsYXktcHhwLWZiDQo+ICAgKiBEZXNjcmlwdGlvbjogVGVzdCB0aGF0IGFuIGVuY3J5cHRlZCBm
YiBpcyBkaXNwbGF5ZWQgY29ycmVjdGx5IGJ5IGNvbXBhcmluZw0KPiBAQCAtMTE2NSwxMiArMTE3
NywxNCBAQCBpbnQgaWd0X21haW4oKQ0KPiAgCQlpZ3Rfc3VidGVzdCgiZGlzcGxheS1weHAtZmIi
KSB7DQo+ICAJCQlyZXF1aXJlX2Rpc3BsYXkoeGVfZmQsICZkaXNwbGF5KTsNCj4gIAkJCXJlcXVp
cmVfcHhwX3JlbmRlcih4ZV9mZCwgcHhwX3N1cHBvcnRlZCk7DQo+ICsJCQlyZXF1aXJlX2Nvbm5l
Y3RlZF9vdXRwdXQoJmRpc3BsYXkpOw0KPiAgCQkJdGVzdF9kaXNwbGF5X3B4cF9mYih4ZV9mZCwg
JmRpc3BsYXkpOw0KPiAgCQl9DQo+ICANCj4gIAkJaWd0X3N1YnRlc3QoImRpc3BsYXktYmxhY2st
cHhwLWZiIikgew0KPiAgCQkJcmVxdWlyZV9kaXNwbGF5KHhlX2ZkLCAmZGlzcGxheSk7DQo+ICAJ
CQlyZXF1aXJlX3B4cF9yZW5kZXIoeGVfZmQsIHB4cF9zdXBwb3J0ZWQpOw0KPiArCQkJcmVxdWly
ZV9jb25uZWN0ZWRfb3V0cHV0KCZkaXNwbGF5KTsNCj4gIAkJCXRlc3RfZGlzcGxheV9ibGFja19w
eHBfZmIoeGVfZmQsICZkaXNwbGF5KTsNCj4gIAkJfQ0KPiAgCX0NCj4gLS0gDQo+IDIuNTMuMA0K
PiANCj4gDQo=
