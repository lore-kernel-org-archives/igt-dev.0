Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB393606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 09:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fp333kX5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B0A10E5F6;
	Fri, 23 Oct 2026 09:06:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A48D10E5F6
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 09:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792746318; x=1824282318;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mE/AtW8/zX5pPU/97Ws6JI/QUD9lnjK7HXobeOq/7hY=;
 b=Fp333kX5CeKFjE1ak99WwQsNHDh67UtWcqOj+I1h90xtsU4rvP/XdBNl
 UAtr+LlOZ2wuB3LoDclSfsHlOME8QOxZpAo33Xpsaa5AaU3zMCVgEFMsL
 jD/hFDUBzRmfe6adh0sK54kD98esjX3CQ45REmoqEduMyQwCXA3J7cUYa
 WlgonJrO25xfIsSSAR5S0JSW7yN+P7/BcBBG0o8TY6S7qffnLLEZp/OIQ
 jEu1i5YRh6OfkZ8gemgomxlqeu2qYaUcCnD7h61V+QJnfVxXZaAk0UeRa
 UpoHWMCTrMmB2tDBT3OPN0lmGi/kqZSHnRwAbjH/75R21gfsi4jFKnyIU A==;
X-CSE-ConnectionGUID: 1ovavHslTU2ROyRdAPnsvw==
X-CSE-MsgGUID: v2P5KuOCQIq1irYM+5vxBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1392936"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1392936"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 02:05:18 -0700
X-CSE-ConnectionGUID: FtDQenPNQBWg6mXOAaHJCg==
X-CSE-MsgGUID: VrHrTTtBRyOQ/9a0s/xs3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3535500"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 02:05:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 02:05:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 02:05:17 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 02:05:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCi5pZuI6w2toOq439UikTgVtgBKB9SaTHa6iD51iVR0/n3kUbAp0CnSJxmHqNBOhUPbLjAL8WiMi86YSeWPpK1jIH3agKZrctvFZGSa7s/KObKhmgHfDg+SLc4FNWxdJLLxMqZ4dmHZldVxJ7K6F9wJmbaspGgIQVUZs6HGUT8IQYvF8AUVxPO0j3mO70FpHEVLcPQiLU6F6I9z/LKcL7bSrowIRr8uJoULSZtDHsLE20YG9FAMCdq49MxSwkgm2BdK3vkrFvanh4iNQChrINF22V5qMzYicOlwDl7YkZkAy5TboTV+WJxHJbQv/4TPtzRCA1vFw0F78TRvhXVI2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRkQ9/fhsOEDe7y48sjHyp1x98wC13ELeYrTOZzrjtk=;
 b=KFj3D4YpNjcc3iVIwdHnSwk8luUXjYwCy2XHKUpYWU7HvSlBY5A/iNxVLD1RSSSsKK2df7ooMw1b+eM/xMi2F/3O65dSQ7IGFBkfzgCdsJqJAVOEhHTCOmZls7V5kOsKx/TWc3zA87zh0kMgn4vjEdbyYL0vZHV/nN5I++ie/wbR5xlxrrstTGu1vg8jALpei3w5bX0Mq8R5Nf4Qk9UIxBXvJnxIZ2N/6TXIFva8qpjgs5YhfO+PkeLs2Ib1AmTV7Gn7SPrTD2Zuk9Pyhs4Jn2svupWX9at4XtHvvA3beYIHhUCOxZmEobfvJXtwxuIAOhKdtgLGiRVPcGx1LWzIYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PR11MB507330.namprd11.prod.outlook.com (2603:10b6:8:503::18)
 by SA1PR11MB7112.namprd11.prod.outlook.com (2603:10b6:806:2b7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 09:05:10 +0000
Received: from DS4PR11MB507330.namprd11.prod.outlook.com
 ([fe80::5d1b:9fb4:12bf:30f4]) by DS4PR11MB507330.namprd11.prod.outlook.com
 ([fe80::5d1b:9fb4:12bf:30f4%6]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 09:05:10 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Lattannavar, Sameer" <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t v3 6/7] lib/igt_kms: Add drm_kms_helper.poll
 save/restore helpers
Thread-Topic: [PATCH i-g-t v3 6/7] lib/igt_kms: Add drm_kms_helper.poll
 save/restore helpers
Thread-Index: AQHdYJ0G/+e/n/YrC06Y6yDJsS5vh7cK2b9Q
Date: Fri, 23 Oct 2026 09:05:10 +0000
Message-ID: <DS4PR11MB507330B38F26519FC1633356FADA642@DS4PR11MB507330.namprd11.prod.outlook.com>
References: <20261020141151.753331-1-pranay.samala@intel.com>
 <20261020141151.753331-7-pranay.samala@intel.com>
In-Reply-To: <20261020141151.753331-7-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR11MB507330:EE_|SA1PR11MB7112:EE_
x-ms-office365-filtering-correlation-id: 916f4ce4-254b-4199-0c16-08df30e4bd94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|261009223027099003|38070700021|261022075727099003|11063799006|4143699003|5023799004|10067099003|18002099003|261021121427099003|22082099003;
x-microsoft-antispam-message-info: zfLlsDaCmnEsqd2XHKEdbcuM7OaxE6OUKYv8+0dyiQFBJk9TXnU9dfQ9RV+mp40f46uH2pJzDCA48VfR9KRcdj/zYBWoCC+OIHbzMkNF4vyOaSIwuKZt+v/NhCiHRMSOCphx+/KowQSiPIUA+NwJBAp3YS/a6oPeV5r5/4n1W13+Q7TUiUEN7t/J/wei3H+TKaxjG7M9H+zac895OpgUTyOAq8kOewj2sbXI0wf7GffVjHPi/9p9sYJcRpCSjnlGEjb5t6UMIhdcg5aIfV8/gYFgX0sFqYkfSYteyrIM9TuTUD/oUro9VXBznRvKIRZZXeLm0nCczXhhnXtsV7JKVxR4XkmrRmqMnhY1DoGHBdV3CL/m3BtBaH2SxzLPn2Yau8AY5JgQ9rlXkdC7mfcFe2cFLdWkfj4SJHqMujUkfOgaA2NwNYnyDAXN7ZLjyo5CdhwabzjAFJkF/R6riMm0u9xm5DFtDaOEy5UWLKUFCGka8rkW0TxYAYhOJhzJUFZ3DUZxB6x7LLfbaciQwn9APPmwWK2EdrEUvP1pUv7HZYMeorUKqr/7OYKfT+rjfITVFGY4AIxfLKRhgK/sGj9wGJr8yew8LnhAeI2lH4G87LJhMmgZWebyrw9qRTr6NrBcKLPIcQy0bjMdC8UpWC5VlESp5e7FXI4E7u7DMeNpwYqtqAeaDmSqw7YF73WxbzEj0nYON4vaICgFH7L9wswVu9AM28ljAnAeRj2twl2szrI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB507330.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(261009223027099003)(38070700021)(261022075727099003)(11063799006)(4143699003)(5023799004)(10067099003)(18002099003)(261021121427099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?x1oOsNB0U2U+EY6wWtx2ujQooQRr98JHITbtjxgo1O8W2s+x1nnzKn7CH49J?=
 =?us-ascii?Q?82liU19jDKZgiqq/KvY8Ev7+xScXnxPIGMPwAuDPJMo5vzssnzqlN9HNW09L?=
 =?us-ascii?Q?QFI9aKCkCePckrDQ/fnfrbUyU59ol6K5c17CufWKm3Lcuk5DaRb2CNMqKcNc?=
 =?us-ascii?Q?FJrorjXVNgX1nOm3MEviRbM6myM1KkqjuGfuGoCwg6F3Q688obS/p3KwbGSz?=
 =?us-ascii?Q?O12GLzeAosGUrg7TnkMHdcwXJhNvjKmamuWalJWb3Ed5B0B+Ox+5CXUW+t3h?=
 =?us-ascii?Q?E6hnK/n7E+zGVXf6ZAPSgq8rm0lNxg1oyFLx2k6cgTmubOAyHUXTsGBa0Vuz?=
 =?us-ascii?Q?MCP2y5Glk6Hp72T/6nPvGCjUBVe3tMKK2w/KfNVE8YOVfZMdO4Sasktl1XhW?=
 =?us-ascii?Q?rRiaVa4QvW8kCgFkzWkkZqA/j1Ae3YuRtd5AUmgleerfgPSPSG8iqJR2DJWl?=
 =?us-ascii?Q?lJa76nW+fsmCn97KN5Vj+WfS41KobJRDvWifgOEI+MTQSulGQBD4OfG4Huxc?=
 =?us-ascii?Q?RFz53p/IOOTOs+n0H/+JaYh2dVlNai3GcvKqayy0ttdO3DnOdC8kqvjbfrjh?=
 =?us-ascii?Q?JAGzskpV1oXDwzoyGGcW3CwY9pfvkC2WbybgwJnJt526zZ705EdFjFFjm74s?=
 =?us-ascii?Q?oCzBDY0RpJp6ojCF766ygRpkD7h7aBCEaRFpB9K9Z2q0LX0WUXieqpxD2yLv?=
 =?us-ascii?Q?+a6Go2rGU/WB5i3R2j6wOtJiaTnAJsxICvArf0OJcg3tncdhJxpQP7j7EwPO?=
 =?us-ascii?Q?Ryo+tyq6HqOBa5U9H7dX6P9f7gpaUfPZCRlDe/x6PDZuTVe0BuZ5D0yWtdFd?=
 =?us-ascii?Q?CbZSwItc4IP/q6F3INWCbloeFAuVwS/24PFV1L97JrGfkkPTkb6jW0TkuE7o?=
 =?us-ascii?Q?kqmj2GXkpeMpw0jfBUkvZyUJfc3IAncEN02py0iip+tlbdf0ZzyS7MYuuT9J?=
 =?us-ascii?Q?wXUwyCFVB4uYyc5vTBOH8Y2TtB3N+2Abj4odz9MUr93O4G9ejnFEzWBuNmV8?=
 =?us-ascii?Q?LFMxHW8k6yn/RmU1UFdDc+vPn3DdwzXgY4MYSHrU3LdG4FZ3chWlND4EJ6Qy?=
 =?us-ascii?Q?k/vH18nZN70wUQEM2pkU9fjVgjShRm6x6gu0nwehYZvbdcAzz3yR5OdnTVdc?=
 =?us-ascii?Q?6sa437LgXFm4c+md/RD3T65Gkkcm9glx+PJqNfjMGikfMX/Hp5xjYDaQ+gGK?=
 =?us-ascii?Q?8G8bxFq4ryeqzyHy/lXK8ART1FjZE2sp0Qao2YGGdCsqFJKOw9O3cPUaVl+A?=
 =?us-ascii?Q?VVcyIIuD1DwatGKqunfrISS3FTr+N+adArmUJ2YeMCSbsWr/jNp3gKl/K5B2?=
 =?us-ascii?Q?UxPQnprrx44Zp4n4D29jPsVV0fm2SxaMVrEnZkdcUMz3hbpQuvi7f3xd8SG1?=
 =?us-ascii?Q?txF5BdaqT96FDCCWB1gARq0I4hr2i2WZmKanmSvyCa1QYJOlJj56gDyUn/Il?=
 =?us-ascii?Q?6GggDzAKsM5kxe+lKGgbzAiDzViD7ppABqyE+rbDWp4GQYLJq1avRBv9Z3oS?=
 =?us-ascii?Q?OB03puPUb5/U8qh8bqaMTl8LsABmlQjR/OyIgLICtYLyyt8m02i1ZVTmIyiC?=
 =?us-ascii?Q?+VHDJLpHgrNWrIYprlwP4T8iTd60cZIwHUcNnhhElR3+yV88Uw4PuVCZyPST?=
 =?us-ascii?Q?mhXxJ0Vb89Wzy68xjfCXiYcdU06MDF6h/oP8Nx9USoGK/FTc9UReWJZZVHN0?=
 =?us-ascii?Q?eOtoFi+1twvJe1wfphpOD4kDN6rW+bzA4jxIbtzuzFA/dJ0AbdW8xM6XAMcM?=
 =?us-ascii?Q?/TPqZrSQBw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Lo1HgIqKY5i6b3n0x8FYHJU+hpbyDjC1CWjFQqSIH7NcuXqZ6ga/oX6Lmf55LtXzfZKW6K47jvXqA0OTlJTmpm3DNuJepulA9ndt2Zjvfw9MgnbcNECo1mHIIFDIPYsr0idvTcwFt5JcfqU1qXqoBob3yB5BP6e1JmW+mA7cTw3u2Nj1Jt5F2CJQTVstvbNuzm9dd08SIDzs7sUZ1AOJAOE9FoZhdbKSBfEI4vg7soz1SRUc+yUEVrRzkV20pscYZP4NMwwFv5EPbUNKr8PyWyUOXUV/PiaiFuU6wmdNdrBoZDM+lGNFacKw/1AGevJ8TRnttH7HylWUjNXsSiiyiw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB507330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 916f4ce4-254b-4199-0c16-08df30e4bd94
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 09:05:10.0808 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8gJGJOk/d7MvdUZONX/JH0NIFgz3mHysYHBNauiW+0gB8qIhkpEvpMgQZueeTjIHjAtJ8QT7Lemlz6GQenB3hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7112
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Samala, Pranay <pranay.samala@intel.com>
> Sent: Tuesday, October 20, 2026 7:42 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t v3 6/7] lib/igt_kms: Add drm_kms_helper.poll
> save/restore helpers
>=20
> The new PME hotplug subtest needs to save the drm_kms_helper.poll
> module parameter and put it back on exit, so that an earlier test cannot =
leave
> polling disabled and make the measurement pass for the wrong reason.
>=20
> tests/intel/kms_pm_dc.c and tests/kms_prime.c already open code that,
> each with its own defines and saved state. Rather than add a third copy, =
add
> igt_kms_poll_save(), _set() and _restore(). Converting those two callers =
is left
> to a separate patch.
>=20
> Save and set stay separate, because a caller may want to restore the orig=
inal
> value on exit while leaving polling switched on. Save installs the exit h=
andler
> itself, and restore does nothing without a save.
>=20
> Writing the parameter does not by itself start or stop polling: the poll =
worker
> stops at its next run after it is disabled, and is only restarted by
> drm_kms_helper_poll_enable(), on driver load or system resume. The
> kerneldoc says so, so callers that need polling running check for it.
>=20
> v3:
> - Move to igt_kms and rename from igt_pm_kms_poll_*() (Kunal)
> - Document that setting the parameter does not restart a stopped poll
>   worker (Kunal)
>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
