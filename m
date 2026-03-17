Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB97FB5EA8
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 03:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935E510E16B;
	Tue, 17 Mar 2026 03:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XPG+rQwI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F77710E16B
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 03:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773719689; x=1805255689;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VmG8B30ew5feRLQBhp3SXn0khtrowCpPDGBe4zv7ISg=;
 b=XPG+rQwIB/0tiEHM0igH6CBcwkGWxl5esWbfnt8RsfXSCK6E+ewqKP3I
 9TKa3C1yyVshCtGtlGVtmBEFlYuae5S1LrTLJokn4+CbpEeI/lOi6/hax
 3R+RkOji0O/SewoLUhn18qykMGwz06YNSm0/o+bQZmN7m5OHZE9GTLksf
 /EnDv8mN94WPbNGystAWqMiUDo8qgtgdsh9uQN8FAKwJQQp69+DixrG2k
 eGIqzNGLKxwriskwQAMy3gHU8ZrTwuLRteImkWmsu35yl369CWbFqfCeN
 QQegW59Bt27GxlS9qLnQi0mAbsMNQkDieW+91c1yDprw9USiXc4bHs5ao w==;
X-CSE-ConnectionGUID: QMiszQJkTAK7hEcv5r0GzA==
X-CSE-MsgGUID: F9Ib1U07RmCHH3p5QHqztQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="77353456"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="77353456"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 20:54:48 -0700
X-CSE-ConnectionGUID: i/9V9Eg7T0WrJKqrtWx3nw==
X-CSE-MsgGUID: /eqnuTDtRCGX6964o8BvJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="226585536"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 20:54:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 20:54:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 20:54:47 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 20:54:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUVyhxbjbAQzLtzn/f3MHOzsirtJ519EsmEbFOFqLZJBt8XZ3ZxFmP7WgAgAlx4TEyoAk4U6ag0j2wIj7b+o8hkyfJWn2VHLyvlC6YIaW0CoPxefzPV55kIYcVXKGBxr/opJD4dGg1AWx9kuW7q/hs6AoRrbzUxQEDJn+fPOD7h9fggCUyYiu52osfDRnZwAuQSnFpeH2/Jl9KJrvb/35GOI69T5fo6nYbhdLZVki2EaftX83IkGmVQGSbXDRi85tHyhMen0Tt/kU7XtivKad2MuFWBVYe7p4rwS1//zyxw1FGRczbHfgOf1wFukcmAA5usy/wxaLBm+1grcZzZOYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmG8B30ew5feRLQBhp3SXn0khtrowCpPDGBe4zv7ISg=;
 b=Sa6811QjYb1pxDDdK7aX5jznyIVduYGCDGAVZqJ25jvapBNscgcT8hbGcCBKuvkfmhv2ZViVkJkfLIeXkfMITf4JtIblZgpeZlHMjDW8/OQagAMFzJtlmLNoUVWCUlc5Jia9Qht6zYr6woau5MQDVVSNpclKHxp0UfWbOXnDUYf+CCHJpdmiH/OMSz1IeO6pE35xbDNsNLS/kDrmRKM1QoEcqs9Z178RF6I7ZetNnkVXDQnvboEvJAp1D3h/ieShKZ7WXvw2JQGgucNF4zssqYGoGenBZsLgTeupuYIv5q3GRYhoWzhhiVDSbRATiqL+YYYJFG9nbHv0qVMvZhgO5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SJ2PR11MB7671.namprd11.prod.outlook.com (2603:10b6:a03:4c4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.14; Tue, 17 Mar
 2026 03:54:39 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9723.014; Tue, 17 Mar 2026
 03:54:39 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>, "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t v4] tests/kms_content_protection: Get HDCP capable
 outputs before modeset
Thread-Topic: [PATCH i-g-t v4] tests/kms_content_protection: Get HDCP capable
 outputs before modeset
Thread-Index: AQHctcBc4ZMQ5iu+3kuGsWbx0pnCAbWyFz9A
Date: Tue, 17 Mar 2026 03:54:39 +0000
Message-ID: <PH7PR11MB679661F4658C20F29EA00D00E541A@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260226164742.1845906-1-santhosh.reddy.guddati@intel.com>
 <20260317034217.37515-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260317034217.37515-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SJ2PR11MB7671:EE_
x-ms-office365-filtering-correlation-id: 2c6a2fb2-8531-4c0e-c697-08de83d8ea21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003|7053199007;
x-microsoft-antispam-message-info: 1HO3QhUbiJSPQqwG4VrlletYFL1ppdRe2py0ybxCRJyrltt5a6az5BLAmTBsyCyk3fxyKUGxKDzJ3BeWVc/QmfhJgTBXqhbkf88HvtfaMFmaFYGYTEuvRW3OsZ5rcmwVnsM4cKkl8khOmWzlqLRf9/YZsPr3tV1j7fFTdA5xolXYn4CI2W5Ccf9d1MXDZzNgwVrA2px5xMnbsxdyWGqf0hMIsoVK+wl6+vrPkXNOgvMVqEoaDk/AEpnW/+PRWGYe8gPd/6vB63UN8ocbh+sxsVPDuVIfw6xcGBvm/WUqM9PSeS8S36O4gHP9uFGlv2n5PubdodIhXVLkti+afqElU0tMu572uZbFkSXDdyiAV+wwBX3qkKdXlGc20BMoxmGtcF28C187BYPiv+2cdps9nTtvG1OAyg+6OgsGg7widBxQzqCb3XOMmnmuI1HX0peyzqi+HvPcLuqTDjvmPm00F52IKt2ztGCEjCm0QFovy2VwSn2zeB6Gcio9+edLbe4H8qI3EvsXubdgmLu1DP8MfTAHTdBO1rDHSp9v5fnLlwoTOegYAPwmNEHQvF5YMQr0uouVpe/TRKcOGeFsD0xn1cZgd2Fk92x5XPx5rHNrv2eEH6AQoydeK85UgdjPEJOc7t5GsPA0MQ5xfaZhFcKTfJcKrwSWX5gAWJwDGQZFrARORbu2Ramodsg0AWh1jDi7mcyK+R79o35flRDPAhyPa2KVxqpfyX/ekK2n2GS3v6tG8Da4dK8uLMo3RW+81YkFlEqvXB2itIZkrTWiKTpz15v+EGV2mIv+eohvCt/VEMk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnhCU0srKy9oYjJrdTBvL3VxRGZYR1FJalh1STE2Z0tzbzQvNzNQcEdzaDJJ?=
 =?utf-8?B?OGJYRy84SW1VQ2NyWjFJcjZ2aSt6ckJCWEJ3WlpZS3lDMGxMV0JDT1Mxdmg1?=
 =?utf-8?B?OHNXY0d6RFFGYllwQTlnRDRNQ2J3UGxMSTV1aUY2NlZubTc5Q2NqdkR0dHlE?=
 =?utf-8?B?ejlXVDdDVWZUc0JOUHFBNmxvNFFUYmg2M1J0eFBlL1YyL255eTd5Q3dDSkIw?=
 =?utf-8?B?dVo4Z3A5Q2hIS1ZISGpaeGptWkNZdlFsbFdIejNJak9hZHpZckVzWmtsTU5L?=
 =?utf-8?B?K0xqdkc2V09yVWRYL3YrMkpGTWR3alpKZXI1OHRaUEV4b01ZdEhGSlZGcW4y?=
 =?utf-8?B?TE95RlFWZzVrMTBHMS9iZWsvaE9UYjFEbmp0VGJRaGRKdlV3N1dXVDlHdGwz?=
 =?utf-8?B?STNCSjNlbzJjZkJVZXpNUUcwQVZla3RMSE1XZ01zWGdvQzNYalhmMHdvbWRN?=
 =?utf-8?B?d2NsRERUZEVMeCtGOFpiejkyTk1XREN4TUQ3QjNyMGlTQ202VXpYbXB2MnEx?=
 =?utf-8?B?TjBnSmpZNW84bnpLbWZiYmExNUVIa3BmZU02MGdIekdLSU9XbEN6T2Z0YVlN?=
 =?utf-8?B?SFArMXEvVXJTUDdSUmExZ25JcXRBK3U5WUUvWjRGVUdmRHA0QmVldzZrLzdh?=
 =?utf-8?B?SHYxYkdBOUR2c1dEZ21RQ2RlWGh0ODQxYTJmc3k2c3dFMjU5UG8zcSt3N3E2?=
 =?utf-8?B?QWFqQ09GMVdIYXV5OExXVnJOcXl5eXdJR3dSMXg2U3gwNFNOc2hTL3Z6bnRi?=
 =?utf-8?B?UXpyQXp3S2RvUThxeGNHVXVkRnlROFNCYTcyeHJzZ25Oc2x2akp6cFc5Z0xz?=
 =?utf-8?B?SnA5SVJud1h6ZWw4Ty8zcnZvcWg5WXhocTI2djhMc01EWUZ2V0gwdS9aOVRD?=
 =?utf-8?B?NDRERGhNaVBQMi9IdjB1QmZldlRqM2RxTUdEOHN2MnpieTROQzkyZXhYMXRo?=
 =?utf-8?B?UDdnKzhwSk1ZNGkzV2phY3cyOTQ3Y1dSQVkxdE5WTXdzS1JCK0VMTElXUXp2?=
 =?utf-8?B?ZGF1cVUvTTVhZXd4RGRmVjFpVzBZVURWMmNxaFdtaHdlU0xFN0dXOXgza1U0?=
 =?utf-8?B?UHg5RVY1TDR3SmxYVDBlaWxFZGYrdmdZUWEwK1hFb0wxUWZTSGNDUEhLREVH?=
 =?utf-8?B?OGZlOW1KOG5vUlZOdVc5SXk0VXlZbENOLzEySXM1SnNvZWNFWHFMdlBFK1Ny?=
 =?utf-8?B?Ynh2NXllR1UvMEhPdWlRYXRKQ1h0bDV1MENnUEw0RnY4TkdyUTBsL3lrcHRw?=
 =?utf-8?B?eHVha2NyeDVPcjdXNzY0M21NT0pVdHJUZzROWHJ6WDlMczVzSEpSUXY1ck4r?=
 =?utf-8?B?bVlkQ0hsajZDWjhZVURyT3FvTmlpd1hSOXF2TCt2ZHlJMmp5bTRjOU1PKzZN?=
 =?utf-8?B?YXlRd2NYV0Zrd3AvNDNqMHJNc3FOeld1bUF0bVlCNmo3Nmt0MG9rYWd4Vk05?=
 =?utf-8?B?OE5xK2tzZmJCY2czbXZyaWNtdjQ2L1VlY3pheTVkWEZxelBlaVh5b0c4QXdn?=
 =?utf-8?B?eEE2ci91clZrQVR5a3I4UkxDRWMrNDdUa2E3MGJ6UEdEYmFYajdMa0dhZzBF?=
 =?utf-8?B?T1NkR0hYbk9VZUgxaFgrNXhxbW5ERHRMamhOLzVmM3E5c3F0WkVLSDdVVUJN?=
 =?utf-8?B?Yk9HamZsdXo5aVFQNHpnRE9SVlBvNU1jRHYvaVFqZWJYdm5UMUFheTNRQzhy?=
 =?utf-8?B?VExGdHNIVUJNTG56eTRsQW10WWV4L2F6WCt1anRTU09rc1AzUDBOU0xPekdu?=
 =?utf-8?B?QzlZejVXZ2NGWWIwV1dMc1JBVG1IWU0wbnF2VlAvTHVvNlc0ci9vR2RjSkx4?=
 =?utf-8?B?amtiM2E2eEUxK3ArdXBubC84bXFQMjJmZkVaNXBob3BBUi95MFRsZ1FRQ1Z2?=
 =?utf-8?B?bElZOWRYNCtOTEpXbE44UnBsL1NHL3ZWZjhYTThMSDlaOHNSZUFvb2E0VHI4?=
 =?utf-8?B?bFpDTmpUenZNNE52NXcwNjlDaGNERFF2eThydW80R2xWUk8yYis0U2NiTWR0?=
 =?utf-8?B?Y2NSQnZFYjhJV0laMTBOUXF4dFNxWkVFTjVpTzRyeU9zSlJ4aUpBQjBWRVNC?=
 =?utf-8?B?alpXNEtIVW9wTjI0UlJzN1Nna2JRVVdpTEJCamRFdHdVVHVINWt6MU8rWmVJ?=
 =?utf-8?B?N3ZoZ2t2Z2lSc1JRcCsyYUdOVEEyalRzMkdWVFdzUnl0ejBzNkkyUUg2cW4r?=
 =?utf-8?B?KzFlVUtGR1FKY1BJdFRWNU9nekttRnlNYVhETjFMYkZyK29DNEdQWlpzUDMr?=
 =?utf-8?B?SkFoUTk1Wktvei93MTV1S2d0dlFxVHp2a1QwSXVVTmZzU1prZjZHTWxka0pQ?=
 =?utf-8?Q?WDsdHkx2/l4rLjOoVn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CDslYDITtaq8LcSFyT8/P6+aFcyo4+So6Ot8M445CZVqs39dWfpuECK+eFYXzeWUJpzmaINCgxdYfEAwF4dJRYygmWBFk+hKpGB7Q4NgmyvJiOD7rQ6kx0Vl+v91Laso3VT2VJkeqnOdo789n5OruorDPPQY/1zK2vFYN+N3JK5EgALg+LfMgq0aVY/bTSO1I5EJ5YcKv2wq5g7Nfj9fWe1bLstVfcMY3fajW5Ain4mmyQ+2gACS1VQu5Dof2r6kzztQrOMV6nYEd+Thj5b6XH+hLLeK9AGi6HhUThuQ7Lza/RdQI2ROW/VuR3tGMioJSTrf1c5PcA8EmhIwgC0bFg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6a2fb2-8531-4c0e-c697-08de83d8ea21
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 03:54:39.7201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5x3eNRe8mBpf13qvYn25ji69S/o1Nj220FU4qjZObTgfXZA4Tak491gQPtpq6u6VDNH4b98Gh2j0Lk4J6pGCpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7671
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

SGkgU2FudGhvc2gsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmVk
ZHkgR3VkZGF0aSwgU2FudGhvc2ggPHNhbnRob3NoLnJlZGR5Lmd1ZGRhdGlAaW50ZWwuY29tPg0K
PiBTZW50OiAxNyBNYXJjaCAyMDI2IDA5OjEyDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiBDYzogS2FuZHBhbCwgU3VyYWogPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPjsg
QiBTLCBLYXJ0aGlrDQo+IDxrYXJ0aGlrLmIuc0BpbnRlbC5jb20+OyBUaGFzbGVlbSwgTW9oYW1t
ZWQNCj4gPG1vaGFtbWVkLnRoYXNsZWVtQGludGVsLmNvbT47IFMsIFNvd21peWEgPHNvd21peWEu
c0BpbnRlbC5jb20+Ow0KPiBSZWRkeSBHdWRkYXRpLCBTYW50aG9zaCA8c2FudGhvc2gucmVkZHku
Z3VkZGF0aUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCB2NF0gdGVzdHMva21z
X2NvbnRlbnRfcHJvdGVjdGlvbjogR2V0IEhEQ1AgY2FwYWJsZQ0KPiBvdXRwdXRzIGJlZm9yZSBt
b2Rlc2V0DQo+IA0KPiBGaWx0ZXIgb3V0IHRoZSBIRENQIGNhcGFibGUgb3V0cHV0cyBmcm9tIHRo
ZSBjb25uZWN0ZWQgb3V0cHV0cyBiZWZvcmUgZG9pbmcNCj4gYSBtb2Rlc2V0LiBUaGlzIHdpbGwg
bWFrZSB0aGUgdGVzdCB0byBleGVjdXRlIG9uIEhEQ1Agc3VwcG9ydGVkIHBhbmVscyBhbmQNCj4g
YXZvaWQgY29tbWl0IGZhaWx1cmVzIGFuZCBpbnZhbGlkIHNraXBzIG9uIEhEQ1Agc3VwcG9ydGVk
IHBhbmVscy4NCj4gDQo+IEEgY29ubmVjdG9yIG5lZWRzIGEgdmFsaWQgQ1JUQyB0byByZWxpYWJs
eSByZWFkIGl0cyBkZWJ1Z2ZzIGNvbnNpc3RlbnRseS4NCj4gVG8gYXZvaWQgdW53YW50ZWQgbW9k
ZXNldHMgYmVmb3JlIGNoZWNraW5nIEhEQ1AgY2FwYWJpbGl0eSBjaGVja3MsIGNvbGxlY3QNCj4g
YWxsIEhEQ1DigJFjYXBhYmxlIG91dHB1dHMgc2VwYXJhdGVseS4NCj4gDQo+IFYyOiBBZGQgY29t
bWVudCBkZXNjcmliaW5nIHJlYXNvbnMgZm9yIGludmFsaWQgc2tpcHMgKFN1cmFqKQ0KPiANCj4g
VjM6IFJlcGxhY2UgaGFyZGNvZGVkIHZhbHVlcyB3aXRoIG1hY3JvcyBmb3IgaGRjcCBvdXRwdXRz
IChTb3dtaXlhKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2FudGhvc2ggUmVkZHkgR3VkZGF0aSA8
c2FudGhvc2gucmVkZHkuZ3VkZGF0aUBpbnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBTdXJhaiBL
YW5kcGFsIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCkxHVE0sDQpSZXZpZXdlZC1ieTogU293
bWl5YSBTIDxzb3dtaXlhLnNAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2ttc19jb250ZW50
X3Byb3RlY3Rpb24uYyB8IDQyICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19jb250ZW50X3Byb3RlY3Rpb24uYyBiL3Rlc3RzL2ttc19j
b250ZW50X3Byb3RlY3Rpb24uYw0KPiBpbmRleCBmMzVjOWZhNzMuLmZmMjQ3ZDE5NyAxMDA2NDQN
Cj4gLS0tIGEvdGVzdHMva21zX2NvbnRlbnRfcHJvdGVjdGlvbi5jDQo+ICsrKyBiL3Rlc3RzL2tt
c19jb250ZW50X3Byb3RlY3Rpb24uYw0KPiBAQCAtMTI3LDYgKzEyNyw3IEBAIHN0cnVjdCBkYXRh
IHsNCj4gICNkZWZpbmUgQ1BfVU5ERVNJUkVECQkJCTANCj4gICNkZWZpbmUgQ1BfREVTSVJFRAkJ
CQkxDQo+ICAjZGVmaW5lIENQX0VOQUJMRUQJCQkJMg0KPiArI2RlZmluZSBNQVhfSERDUF9PVVRQ
VVRTCQkJMTANCj4gDQo+ICAvKg0KPiAgICogSERDUF9DT05URU5UX1RZUEVfMCBjYW4gYmUgaGFu
ZGxlZCBvbiBib3RoIEhEQ1AxLjQgYW5kIEhEQ1AyLjIuDQo+IFdoZXJlIGFzIEBAIC03MDcsMzIg
KzcwOCw1NSBAQCBzdGF0aWMgYm9vbA0KPiBpc19vdXRwdXRfaGRjcF90ZXN0X2V4ZW1wdChpZ3Rf
b3V0cHV0X3QgKm91dHB1dCkNCj4gIAlyZXR1cm4gaWd0X2lzX3BhbmVsX2Jsb2NrZWQoc2lua19u
YW1lLCBoZGNwX2Jsb2NrbGlzdCwNCj4gQVJSQVlfU0laRShoZGNwX2Jsb2NrbGlzdCkpOyAgfQ0K
PiANCj4gK3N0YXRpYyBpbnQgZ2V0X2hkY3Bfb3V0cHV0cyhpZ3RfZGlzcGxheV90ICpkaXNwbGF5
LCBpbnQgY29udGVudF90eXBlLA0KPiArCQkJICAgIGlndF9vdXRwdXRfdCAqKmhkY3Bfb3V0cHV0
cykNCj4gK3sNCj4gKwlpZ3Rfb3V0cHV0X3QgKm91dHB1dDsNCj4gKwlpbnQgY291bnQgPSAwOw0K
PiArDQo+ICsJZm9yX2VhY2hfY29ubmVjdGVkX291dHB1dChkaXNwbGF5LCBvdXRwdXQpIHsNCj4g
KwkJaWYgKGlzX291dHB1dF9oZGNwX3Rlc3RfZXhlbXB0KG91dHB1dCkpIHsNCj4gKwkJCWlndF9p
bmZvKCJTa2lwcGluZyBIRENQIHRlc3Qgb24gJXMsIGFzIHRoZSBwYW5lbCBpcw0KPiBibG9ja2xp
c3RlZFxuIiwNCj4gKwkJCQkgb3V0cHV0LT5uYW1lKTsNCj4gKwkJCWNvbnRpbnVlOw0KPiArCQl9
DQo+ICsNCj4gKwkJaWYgKCFvdXRwdXRfaGRjcF9jYXBhYmxlKG91dHB1dCwgY29udGVudF90eXBl
KSkNCj4gKwkJCWNvbnRpbnVlOw0KPiArDQo+ICsJCWlmIChjb3VudCA8IE1BWF9IRENQX09VVFBV
VFMpDQo+ICsJCQloZGNwX291dHB1dHNbY291bnQrK10gPSBvdXRwdXQ7DQo+ICsJfQ0KPiArDQo+
ICsJcmV0dXJuIGNvdW50Ow0KPiArfQ0KPiArDQo+ICBzdGF0aWMgdm9pZA0KPiAgdGVzdF9jb250
ZW50X3Byb3RlY3Rpb24oZW51bSBpZ3RfY29tbWl0X3N0eWxlIGNvbW1pdF9zdHlsZSwgaW50DQo+
IGNvbnRlbnRfdHlwZSkgIHsNCj4gIAlpZ3RfZGlzcGxheV90ICpkaXNwbGF5ID0gJmRhdGEuZGlz
cGxheTsNCj4gIAlpZ3Rfb3V0cHV0X3QgKm91dHB1dDsNCj4gKwlpZ3Rfb3V0cHV0X3QgKmhkY3Bf
b3V0cHV0c1tNQVhfSERDUF9PVVRQVVRTXTsNCj4gIAlpZ3RfY3J0Y190ICpjcnRjOw0KPiArCWlu
dCBoZGNwX3BhbmVsX2NvdW50Ow0KPiArCWludCBpOw0KPiANCj4gIAlpZiAoZGF0YS5jcF90ZXN0
cyAmIENQX01FSV9SRUxPQUQpDQo+ICAJCWlndF9yZXF1aXJlX2YoaWd0X2ttb2RfaXNfbG9hZGVk
KCJtZWlfaGRjcCIpLA0KPiAgCQkJICAgICAgIm1laV9oZGNwIG1vZHVsZSBpcyBub3QgbG9hZGVk
XG4iKTsNCj4gDQo+ICsJaGRjcF9wYW5lbF9jb3VudCA9IGdldF9oZGNwX291dHB1dHMoZGlzcGxh
eSwgY29udGVudF90eXBlLA0KPiBoZGNwX291dHB1dHMpOw0KPiArCWlndF9za2lwX29uX2YoaGRj
cF9wYW5lbF9jb3VudCA9PSAwLCAiTm8gY29ubmVjdGVkIG91dHB1dCB3aXRoDQo+IEhEQ1ANCj4g
K3N1cHBvcnQgZm91bmRcbiIpOw0KPiArDQo+ICAJaWYgKGRhdGEuY3BfdGVzdHMgJiBDUF9VRVZF
TlQpIHsNCj4gIAkJZGF0YS51ZXZlbnRfbW9uaXRvciA9IGlndF93YXRjaF91ZXZlbnRzKCk7DQo+
ICAJCWlndF9mbHVzaF91ZXZlbnRzKGRhdGEudWV2ZW50X21vbml0b3IpOw0KPiAgCX0NCj4gDQo+
IC0JZm9yX2VhY2hfY29ubmVjdGVkX291dHB1dChkaXNwbGF5LCBvdXRwdXQpIHsNCj4gLQkJZm9y
X2VhY2hfY3J0YyhkaXNwbGF5LCBjcnRjKSB7DQo+IC0JCQlpZiAoIW91dHB1dF9oZGNwX2NhcGFi
bGUob3V0cHV0LCBjb250ZW50X3R5cGUpKQ0KPiAtCQkJCWNvbnRpbnVlOw0KPiAtCQkJaWYgKGlz
X291dHB1dF9oZGNwX3Rlc3RfZXhlbXB0KG91dHB1dCkpIHsNCj4gLQkJCQlpZ3RfaW5mbygiU2tp
cHBpbmcgSERDUCB0ZXN0IG9uICVzLCBhcyB0aGUNCj4gcGFuZWwgaXMgYmxvY2tsaXN0ZWRcbiIs
DQo+IC0JCQkJCSAgb3V0cHV0LT5uYW1lKTsNCj4gLQkJCQljb250aW51ZTsNCj4gLQkJCX0NCj4g
Kwlmb3IgKGkgPSAwOyBpIDwgaGRjcF9wYW5lbF9jb3VudDsgaSsrKSB7DQo+ICsJCW91dHB1dCA9
IGhkY3Bfb3V0cHV0c1tpXTsNCj4gDQo+ICsJCWZvcl9lYWNoX2NydGMoZGlzcGxheSwgY3J0Yykg
ew0KPiAgCQkJaWd0X2Rpc3BsYXlfcmVzZXQoZGlzcGxheSk7DQo+ICAJCQlpZ3Rfb3V0cHV0X3Nl
dF9jcnRjKG91dHB1dCwNCj4gIAkJCQkgICAgICAgICAgICBjcnRjKTsNCj4gLS0NCj4gMi4zNC4x
DQoNCg==
