Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988EA606A32D
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 06:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N/eBjv8H
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EC588668;
	Thu, 22 Oct 2026 06:16:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18A810E3B3
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 06:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792649742; x=1824185742;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TxR4WNbiMedcAUqGlAnOj5Z7VmYLeoetb1zRrUCYQx4=;
 b=N/eBjv8HFgHklQa88iHm0QBSskLgCLQ7/U4j3AFhJKQjJuIPIly4t9w7
 CFpUXT2tRSqD3ZwlX478S51+lPSgbFlj08XUhjGRN2MD75mHpnMrGEJM1
 WGz9EwmTzUP2r3BdiFSaizoOrxqan8w0NTeFivst/QFIvdHabGc3tyEKE
 LJpr/1gA7+F3WTq5haoUNq2ZRXbeXNlX6ffXjHHnc178LB6v3R6SvnDe0
 yzokbdqArSoce9BbR9laWtxvYzKvDQtor4/tImST9qmPa371MVU4lPYZE
 VB3gOzzv8Dd/HcW29P3aqEAIOI6cScVROUZpJ7mSyoRZpJuCsrQoD7zS1 g==;
X-CSE-ConnectionGUID: zpe3FQF4Qhm05chCSI3djQ==
X-CSE-MsgGUID: 7tbX8zMrTSOy15EtKDyKqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1277210"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1277210"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 23:15:41 -0700
X-CSE-ConnectionGUID: 4CtydsbTQw2qL7wGY7KJLA==
X-CSE-MsgGUID: Pf83AFhWQC2D1G5JpdT7fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3226414"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 23:15:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 23:15:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 23:15:40 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 23:15:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ffbf1Xn6767TBmmMyvYG1njRto/Luh7nKtCG8DQ7M+IKm20eJI8RW4U0pmgsH7uhVsvf0wQAYxsFfLeHsCwOhi9QkpN4NyEQRGjTM+0FFQYKQbpGlvgZspfLFipriGOtb2PBvKqyP3Ejim9Mh8R2V2aLtKSXeqIIi/qs+nE/WSOdHdRxd15j8yEU8Qu/AjTygmqpFSePRXZZK/lCy5vUfQ4xdGbiR7MlabcJZj5NIh30zxp/DvD4irxV/nEd6i5GCG2opVjWWDqGu+71P7EQ3W5dbhfwMKoDXiUbVsmfbWyIP/Q9yrXRAOBru2mVuYjx+w+8wy1B/Pcwe2L7LvgvTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2amNuZTO+mvxIxi6rTE6qnALxCoEv7BHom32wBTGC4=;
 b=P5emwPNLSRBmSW704k21iLYVxudXTgr17tczHvWQYPWyVXVszIlxYa4NGfMAkWuoqp6Xnc9ZC+4h/yzPlG0DvVTObrXyKQBrAjdC9cNnZlhpOcX2G/EHcjKBPsr6xN9HRUUwsC0GuNXcTDVq+GtHr81tJLN51znW3bte+y57aa2ld7NociVTNfCJpbU+X8H5s3h3rGC7/7HvcbP2OlCh9ZlNtr0mcqXK1IcK1TKVEMAc8/1AIX3nY4onh2sRwo/2f5T1yGG6AwgRZlYL7kZJP825gUT7XXafVjvsSVe/IcQWJ4+NE6SLfTZgvNsbRYeAi8gNYfG7PR6fpf0CoyPLIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DS0PR11MB7360.namprd11.prod.outlook.com (2603:10b6:8:136::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 22 Oct
 2026 06:15:30 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%6]) with mapi id 15.21.0522.017; Thu, 22 Oct 2026
 06:15:30 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Use small
 modes on simulation
Thread-Topic: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Use small
 modes on simulation
Thread-Index: AQHdYKC6CyC266b/l0emitwqMK6HurcJBPEAgAAPVRA=
Date: Thu, 22 Oct 2026 06:15:29 +0000
Message-ID: <PH7PR11MB605390CE7D7CADAA8FAC45CFE7652@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20261020143830.772865-1-pranay.samala@intel.com>
 <PH7PR11MB6796126D448F7B03A7EE3C03E5652@PH7PR11MB6796.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB6796126D448F7B03A7EE3C03E5652@PH7PR11MB6796.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DS0PR11MB7360:EE_
x-ms-office365-filtering-correlation-id: a348c8c2-2fde-4c49-dfb0-08df3003df57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|261021123027099003|38070700021|4143699003|11063799006|56012099006|3023799007|261009223027099003|10067099003|261021121427099003;
x-microsoft-antispam-message-info: GNJwUI8qFZGH2twTyxBrvkhqGyiPNDB2kSx3c0TnIlcUq8E2bfUXrhvVV13H03HqXvTW1sUmC/db09fvd6qhN/74xPeJgTRpcLOUL0RoI1LWcia/OM0E9a6W++ZjbDfXT5cTnmjP750xsXF3fy1Inh9UNpVqg867NxWeV3YcMavXBAyVU5dtf0cpHvuRpWc6+G0NkE2TaPMtVZj0TpE9fVgz8iQQJYljGhmRt5prnf44KHwJqOzk8cSf19PF8Sm2FhgwaMa/qGWCUjGE3JNvvsxq47+89JozBidhFn9q35qhk0Na3sZuYZopl8NrhEFVEe6TI4CiYsedGfMqeqDFFsoFtX0R+Ex9hOa5HHRrzoXOU6sZEqv+9Yc2gUjvLOy0Q4PEdkU0LNexIefofWeuTtNMLtgdECbLhY0eD7/VRTXkjsFb2l6A9YMuUBw4E+/OCyKm6BYHBRM46lZD1cSy+KXI0cHvDOztfYR8c+h9d56P1kF2C0JJj6icxcYSDxjc64FNMlpmYvo9hmlOiRvYO+UE7g8X94DPEn6LsdRDntOmYtvlYNddEEBJcSKeX3gvT3qqssPm4J1GOlP1Gdz1BcanjMipVaA5dvr+O15TecX6KJH2cI5GHPqppO5JY7jvvkc4mDY23F2wr5mqC8L0DGEo/78zn52VD9e/atm9FU0PxSgtzyBlbA1FI5zCr98kbAV0wEx0ynhPjCyiSr+HvtmsFKmkGBt2mABEe3BakCM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:ja; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(261021123027099003)(38070700021)(4143699003)(11063799006)(56012099006)(3023799007)(261009223027099003)(10067099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?Nk5rY0Y3RVVONURPQ09NeDJYRi9FSXNPZHhmTGdDUUZwaEVFdmNhaXdU?=
 =?iso-2022-jp?B?dkg0OXQrZGJ1MStBcldQZjBZcktkRGorOXpZT3J6QzNMR0hlemxvNSs3?=
 =?iso-2022-jp?B?YktnUU9YUkkrNGRONElldWplc2lCOFYvV01PM0ovOHZHUE85T3RlQmxx?=
 =?iso-2022-jp?B?SlQ3WGtWbkNKY21TWVZkOE5tT1c4WE9TRERFSGtPQTZGaDIrcWVvNUd3?=
 =?iso-2022-jp?B?WTRBeE4vaEsySzAvMFkyNW4rY0pqdTBvMmdOTGVIWEhIOHVoUzZPZUFE?=
 =?iso-2022-jp?B?bHc4UjNjWkxvRGFENnEzS29sTnZYOUxOaE9GZEhMRE50Q1lEMFZQRWNR?=
 =?iso-2022-jp?B?Z0hybjMwNjNseGJmV1h2ak8rOGZuQ29UdFZqQVB5MlplT1J5eUtkdnJn?=
 =?iso-2022-jp?B?clZTV290Zis4Tm9lT3BXdWZ4V0VwMzBidGpqdTRIdFRCWUdDNURyTE5J?=
 =?iso-2022-jp?B?NHcrR0Raczd2RzVVcXRXY1B5UTVEYmM3UXRWMDZJaytlWUFoQi9pcEo1?=
 =?iso-2022-jp?B?SGJwK0ZFTXhQaVI3QWVKMWU2blNEUHFKL2Z1NkN1dVp1ZzNrOEh6RmhN?=
 =?iso-2022-jp?B?ZWl1eEZLbGYzWnlTNUM3RmhtVENzZjRvb25KQnlPVTM3NWpQa2xXOGtu?=
 =?iso-2022-jp?B?L0c3WGViWDNIc2E5QXoxWGFrbmQ4ODBJMVNhNkR4V053dERSV1dwanh1?=
 =?iso-2022-jp?B?djkxd09LWHBPaEJvaDR6Y1NvY01MTU50N3NaQWRRdXgzRzNuaGVVc21t?=
 =?iso-2022-jp?B?M0Y0RVdxQW1kcm9rRXd3eWlrUERHR3hrUTN3SnlNZnFqdFRiTWNVVHJh?=
 =?iso-2022-jp?B?bXQwVE95VW5GcGVnUjdVKzc3QWF4NUFuRWdaTkF2d1NpRWxtUlpWaTFm?=
 =?iso-2022-jp?B?NEJTdnN6aWE4WTdpSitjcWJwMXg3UU5oRklkUkNmaWozZFJuc1VKS0tV?=
 =?iso-2022-jp?B?dHlVUitHa0psb0lwajA2SnN1KzRRRm5QMFZpeUhoOTNvb3N5a2RWdGpp?=
 =?iso-2022-jp?B?dHo1N1lEME96ZmZwU0tOcVVhQ3MrTTJxZGlSR1p5R0VLN3dwYzl5YzFq?=
 =?iso-2022-jp?B?RUsybG5MSk5rZEZ6QVE1UUFxai9IbmlUN2RGTnEzTVFSNlZxbkhSeElV?=
 =?iso-2022-jp?B?QUI3SEVOckc2andGZ2lRTGRMZzkrdXYvYzl4aVBwMFdiUnlybTRGb1pk?=
 =?iso-2022-jp?B?SGJEY0lXS2VrVnlmb0JHOEN6c1JMQzF0TkVrdkYzUm51TG5ZdWtOeG4y?=
 =?iso-2022-jp?B?SWJUby9HT2IyZUdxMzkrZnhmOThYOENkeS8ycFVjcGNYWlBZV1ZmcDRL?=
 =?iso-2022-jp?B?QVUvYUFSbkFnZkFtb21JSTV4aFg4WVdJSEh4TFhzT0ZMVzI2MEJ5YTB2?=
 =?iso-2022-jp?B?dzZtNFdqekZPWm0xS3piMVdzZXBLcGc1ZXpvaGlWWkNVWXErRlM4Y1pN?=
 =?iso-2022-jp?B?QzdKTkdQTXNNK1hNU3dTNHgxd1JtdTFVMDRna3lHZ2dBQzZWOGNqbGVE?=
 =?iso-2022-jp?B?Sk5jTVpZUUhiZ1pCd0JuRW9wR1VnTVZwckNieTVBeGJJcHRqd24vMk5G?=
 =?iso-2022-jp?B?NjBYZ1NqT0VxZk5FSFRrODIvYnVtV1pBbzdUSCt6ckI1dEdGQ1VqcWxN?=
 =?iso-2022-jp?B?VUE2NXh1dnRvMG9ib2l2VlJZdjc1alEzOFgrejc5S3hmRDFQRVB0TWVu?=
 =?iso-2022-jp?B?WTMya1NWVjI5MzVBNFo3NERKTVN3ZFhWT0I4bmZVQTBZalB6ZjZYUUts?=
 =?iso-2022-jp?B?VkVoT3NzWUhUeUNhd0Y1NVNTSWYvWEM3SUo3cXdPeDVCQVBVZnNaWER1?=
 =?iso-2022-jp?B?TzZKQjhSMmtJMVVVZ29yQkpCTnFQRVluRXdRRVpmL25EQWhwZW14YXFi?=
 =?iso-2022-jp?B?d2krUjIydXF4V1R6WllzempWVTArUEt2UHFCMWxGd1RIRTUvV3dBTEFr?=
 =?iso-2022-jp?B?cmh3ZndDNzNROVJaaXIxVmpKbDdKNllBNFNoR21tVGFCWlBvakNqZllh?=
 =?iso-2022-jp?B?d1hIakgrMmM5WDdiYXo3M00zTS9pL0NzcVFFZTF2WEFQZ2V3ZzlnSzRi?=
 =?iso-2022-jp?B?ZG4yTWdVWm5EZlZRZzFFdU5rekU5MkthZHkxUGVWTVFSU2hlM3QwY1k4?=
 =?iso-2022-jp?B?SEk2Yld3NEwwRlh1YUtvRU96bUx5NU9JakVjS1V0b0dBNjNSTzNmL1pG?=
 =?iso-2022-jp?B?MG4yanIrbkNKdklMUUdoMmk5akppYjBRV1hpWE9wTngxemtWMmd6V2Fy?=
 =?iso-2022-jp?B?MXhrekpuc2l4R2wvUUdXcTBubUp2OWdYVElYT2t6SUhITU9mblJyRDdJ?=
 =?iso-2022-jp?B?K1FrRlU5a0NGUnhHK24rV0VOM3k0Unl3RUw1WHNrLzNZZWxWdjFMMHgv?=
 =?iso-2022-jp?B?Tm9SeUpkcmY2bWdhR3VGU2RsQVlvaHhiVklyZGp1TEw3NXZMb2llY3VW?=
 =?iso-2022-jp?B?THhaS00rZ1NsUitGR0dRY2JpUzl3YkkwQ1F3Z1oyRkRENjRDQWFaV01S?=
 =?iso-2022-jp?B?elZ1K2JpL2t4TEZHR2tKWTRReEpoY0JlSDNFQT09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WtFhjJ1w/Y2uTQv5ZxBBZZvZzMY2dR20eN/xT9pE4C9M0ErVRyC5BqZ2MYBsDyKc1Tod0K7kUQv0hg9PbYRRkTtQpxT1ciKaqk/eT7IfGAZDMXTCFc7QpBbKtE2xgmcfW8vMZFSdmLh/rZ666Fx7ezVZV7vm+U6cH/iYHgKIayuSG4bIiNEPR/ixTDGFBRt39d92e5Zl59xku1G+mF4pVWQhWHmiALl4NyLl4Pp56in9XWK8hfya0Z1VwkQY61WdcdizWRMcXbXd1DwSQJnE/iGi+7GjQK6jQWWNzqIGGbP0gG5Yq3eUAh5OiBgkPvoKF/gOvLkNvaVc4vtqqUm1Rw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a348c8c2-2fde-4c49-dfb0-08df3003df57
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 06:15:29.9551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uAbXSh4kmMwKAoeAkpBMwLhaK+RvDCTutJs8UG2+IoZmxT8tiCEPEO+tgzm1F6esLt/Qns2zIRc4cMdfz8Cn7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7360
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sowmiya,

> -----Original Message-----
> From: S, Sowmiya <sowmiya.s@intel.com>
> Sent: Thursday, October 22, 2026 10:37 AM
> To: Samala, Pranay <pranay.samala@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: RE: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Use smal=
l
> modes on simulation
>=20
> Hi @Pranay Samala,
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Pranay Samala
> > Sent: 20 October 2026 20:09
> > To: igt-dev@lists.freedesktop.org
> > Cc: B S, Karthik <karthik.b.s@intel.com>; Lattannavar, Sameer
> > <sameer.lattannavar@intel.com>; Samala, Pranay
> > <pranay.samala@intel.com>
> > Subject: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Use small
> > modes on simulation
> >
> > Due to slowness of drawing on simulation, use the connector's smallest
> > mode and draw only one rect in draw subtests when running on
> simulation.
> >
> > Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> > ---
> >  tests/intel/kms_frontbuffer_tracking.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/intel/kms_frontbuffer_tracking.c
> > b/tests/intel/kms_frontbuffer_tracking.c
> > index 8d5afdac2..3f345f644 100644
> > --- a/tests/intel/kms_frontbuffer_tracking.c
> > +++ b/tests/intel/kms_frontbuffer_tracking.c
> > @@ -2997,7 +2997,7 @@ static bool op_disables_psr(const struct
> > test_mode *t,
> >   */
> >  static void draw_subtest(const struct test_mode *t)  {
> > -	int r;
> > +	int r, n_rects;
> >  	int assertions =3D 0;
> >  	struct draw_pattern_info *pattern;
> >  	struct modeset_params *params =3D pick_params(t); @@ -3043,7
> > +3043,9 @@ static void draw_subtest(const struct test_mode *t)
> >  	prepare_subtest(t, pattern);
> >  	target =3D pick_target(t, params);
> >
> > -	for (r =3D 0; r < pattern->n_rects; r++) {
> > +	n_rects =3D in_simulation ? 1 : pattern->n_rects;
> > +
> > +	for (r =3D 0; r < n_rects; r++) {
> >  		igt_debug("Drawing rect %d\n", r);
> >  		draw_rect(pattern, target, t->method, r);
> >  		update_wanted_crc(t, &pattern->crcs[t->format][r]); @@ -
> > 4373,8 +4375,12 @@ int igt_main_args("", long_options, help_str,
> > opt_handler, NULL)
> >  		if (opt.tiling =3D=3D TILING_AUTOSELECT)
> >  			opt.tiling =3D drm.display_ver >=3D 30 ? TILING_4 :
> > TILING_X;
> >
> > -		setup_environment();
> > +		/* Full-size modes are too slow on simulation, use the
> smallest
> > mode.
> > +*/
> >  		in_simulation =3D igt_run_in_simulation();
> > +		if (in_simulation)
> > +			opt.small_modes =3D true;
> scaledprimary_subtest still does the same relative thing (half-size regio=
n,
> quarter-size region, upscale by aligning to 4), so it won't fail or crash=
 ? the
> ratios (1/2, 1/4) are preserved. What changes is the absolute pixel
> dimensions and alignment edge cases being scaled: a 320x240=1B$B"*=1B(B64=
0x480
> upscale exercises the scaler hardware differently than a 960x270=1B$B"*=
=1B(B1920x1080
> upscale would. If there's a scaler bug that only manifests at specific la=
rge
> resolutions or specific odd pixel counts, running this subtest against a =
tiny
> simulation mode could miss it.

Thanks for the review.

Agreed that a smaller mode exercises the scaler with different absolute siz=
es.=20
However, scaledprimary_subtest does not check the scaled output on screen.=
=20
After each scaling step it calls do_assertions(DONT_ASSERT_CRC), and the DO=
NT_ASSERT_CRC flag=20
skips the pipe CRC comparison. It only checks that the atomic commit succee=
ds and that FBC/PSR=20
end up in the expected enabled/disabled state. The subtest's own comment sa=
ys the same: it=20
exercises the scaling path but does not verify that scaling is correct.

So, if the scaler produced a wrong image at some specific large or odd reso=
lution, this subtest=20
would not catch it at any mode size, including full size. Using a smaller m=
ode on simulation=20
therefore, does not reduce what this subtest actually verifies.

The change is also limited to igt_run_in_simulation(), so silicon runs keep=
 using full-size modes=20
and draw all rects. small_modes is the existing --use-small-modes option; t=
he patch only enables=20
it on simulation, where full-size drawing is too slow for the test to finis=
h. Without this patch only=20
one draw operation completes on simulation; with this change, the test pass=
es on simulation

Regards,
Pranay

>=20
> Regards,
> Sowmiya S.
> > +
> > +		setup_environment();
> >  	}
> >
> >  	for (t.feature =3D 0; t.feature < FEATURE_COUNT; t.feature++) {
> > --
> > 2.53.0

