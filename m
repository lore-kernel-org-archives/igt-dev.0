Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6553C5DF88
	for <igt-dev@archiver.kernel.org>; Fri, 21 Aug 2026 03:54:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473F910E250;
	Fri, 21 Aug 2026 03:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UzQofqz5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAAC10E250
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 03:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787284420; x=1818820420;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XNe7YfPeQx/KmaW/WHQmB/CJ79d3TejUjLXUL83/rzA=;
 b=UzQofqz5RI7+jcxLkvVfBjpEXI+IJGs/zrveCjpE4ahYugxgjQeBmm/6
 kOWyXT3RSBbtutuUlt8+ln4XfZfbNTv80Mx6Rb8VPmndAJ/S5zpFYzysw
 +KbSu9YhFWDi4qL9tpsJ/fq/Yto4bTT3NYkUQYczsdD2JOok29/sJk/eT
 CypcjpaGjnrD6BQES8wOQ0SbCfq/0W8HqUigU4f8bukVpI4X6k5qsUzuk
 tzkgEUSHdvbLFX0KoQ6/k//ouWvrfKSSY3OUu7LX+kyICkGRgqU9ljj98
 JFkxbaqc9MM9rbgBU+nrs/Fb4Af/HvFjJJZm/kiNpyxujieiyxZlGbnwL w==;
X-CSE-ConnectionGUID: vHVomC8nQSawfWZqasYfTQ==
X-CSE-MsgGUID: 80CfoQ/SQ8uGIkRnF3d1Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="75362771"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="75362771"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 20:53:39 -0700
X-CSE-ConnectionGUID: wB6cRh7XRlGiF+Xg3k6QeQ==
X-CSE-MsgGUID: RAJmUX8jQKubLzuyS0EuXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="265718936"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 20:53:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 20:53:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 20:53:38 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 20:53:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8/3MZz0Q5fHNTWfIIMGYdEFmJDR8qgTud2ZKf9OMPn9yLhX5VrWSETiDz6sN16TreVTqPN0gvtaT4+L2R1sEDvA7B/MqQSCiggCsmxdWSJxf6+QHteLtZ1zr7ylFMHRGu9qT3Sv5eDzPyh/6BrynsHkjTLAC2AINwZA9OWbtiW25njLopta4nbTvmdhBgSF6bM9l9TbvV049Fqw1B2YhTtR+s0xm/TUelk3xPYyHj8D6BKnTuGnp45MQz6gZym87TeI+CpIpd7f219EpEScUsZVvPCX0xe0M5uPzvWYelv3DEOj7yRp4SGp+VNHwrB+e9y7mSc9nvwveocuSRSj4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNe7YfPeQx/KmaW/WHQmB/CJ79d3TejUjLXUL83/rzA=;
 b=xddnhIakIRs3QhTzNcjZBzvP/iohE1CciIvsigfw2vcUMtDywqSHsWy7P9t7sHGIORCoPf/Qyncf+gGBW8hgt4LnYmDPBD1apabKPa91KXtCPS909NBE0VywJfVWldGzef1E62HEm5xY0bGP2z1AV8u1Sdeackk6wXvhRfKz2uThsz5JRdCD9KMCAqDMBCmlZV7hsT0LeaWd0ZiCiwz6GfaYmDuUl/0VCT5SwKNsvljIJtEvQ+lsoQ22sv+B+WMu+HPrOGmHT/iChsQo54C4tOs0YJukEXYzBuVjHWk4bB8YYcod7ZnjjUF8bfaETqcoG2rfaTxL5q8TcWjyn+Zn8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SN7PR11MB6876.namprd11.prod.outlook.com (2603:10b6:806:2a7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 03:53:30 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0315.011; Fri, 21 Aug 2026
 03:53:30 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: Mark Yacoub <markyacoub@google.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] lib/igt_kms: Do not treat writeback and virtual
 connectors as connected
Thread-Topic: [PATCH] lib/igt_kms: Do not treat writeback and virtual
 connectors as connected
Thread-Index: AQHdMA4ruuo7Y+lOnkW6/DQDVXXFeLan4HzQ
Date: Fri, 21 Aug 2026 03:53:30 +0000
Message-ID: <PH7PR11MB679695C574AE7A367078CF48E5A32@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260819190740.1392859-1-markyacoub@google.com>
In-Reply-To: <20260819190740.1392859-1-markyacoub@google.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: markyacoub@google.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SN7PR11MB6876:EE_
x-ms-office365-filtering-correlation-id: 0bcd46f2-c206-4398-f90d-08deff37c3cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|3023799007|56012099006|38070700021|5023799004|11063799006|10067099003;
x-microsoft-antispam-message-info: 2ctIPdcNpXq8NyKAxnoA6Ut6GSlQuYbJ+Bvk2uEj1Z4KZsNxHbtOA4NjceP8TQOUU3w8Y7162P3jRUDicBrx3AJSgApd5ubY1nC6uz5DxYL2EiF+F8uK71uLOsOSLcHYbyNeHlDPfpvV8he8I2+/xwdBEDNDw8Y8N5HgmEYzc3U2MWdQ/CVlndPYgpxHHVFzoAObLFxkFv2FIP1IKErNt6ltbRTtJFJ+DxheLUznBQ4Bw/vYIiPEoD7d39LqjsZ0zC/kn6nHsq/IW+u/XzTfJyIluUMZWvKoq2A743YzTu6nYa/Q+9OmT3IQUQXThqRRPdLtakBvMyHIgFODjFcCqm4/l+04s5AYpgIFYgiqofT+R/jFR6rvSh1BwbDLumfeIjAqfOx9XEwFQLny2vqKFj0VUT6iExbdAulbywiq1tWXUVDAO0cr9zPf+UrvH5VFdCSvuVDZ/BegOVaUt8DlfcHEgkqHN1n93dYnxl2BmK3Xbc5bbREqGzm/gE2ilOet4SH0hpudDztGSXj+vtk+S1d9Xkl3/2IY3+HSe1wihFY8Xyb3umdykakHZwZ3CDETi92A+bvQ/SYxWWTE2lzt07JgRfH+laKyaw2lRKEyMBxKb+edYzSK/q2HXgbYYaoyL08Nqtsq8F3rXXJvddx5OFDI8yoi2xQBq9SfzsQvv/Xu0RpUNiyhg7iy6XSVHLnMClQZhegkSrA9q1wljBy/p2k4POHdeDZHf/4a67fmjGg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(3023799007)(56012099006)(38070700021)(5023799004)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wm9DWlN3ODdIWnUyZ3pRSDltbDRaVWsyNlVZK2lZNENteDZscmlHMzVxUTdk?=
 =?utf-8?B?R2s5aVZpcFRlVEdvczBVSVlTZkFhZGI1bnc1bDI1RDZBb3AyNFJYSFZhamlE?=
 =?utf-8?B?WDBwSXhSQU1pdENwZkE1dFdtYWxqMVJIWjZiNHpGOVl5RWlpTDRvUDl1Y3Ra?=
 =?utf-8?B?cXU0LzNIRk1xaVprQStwS0pCU1Vld0M2MHpEVDJMOFhhY2FGS2o2ZVNsSWE0?=
 =?utf-8?B?V0tLQldnaGtFM3Y3a2tlcmN4NU9vckxMcXpQU0ZIcHdGbGMrWHBHazQ5b2pS?=
 =?utf-8?B?N25oUnJsdXkxb291emU5VjNPMG00SnZHR2lsSFlrRFcySEZSWnF0UXlZL1hC?=
 =?utf-8?B?THFORUJtT0Uzb3JDZkk5S1YvR204NGM3RUxneDBPWDQ5dW1kb2ROU0hCcm9w?=
 =?utf-8?B?OXdrTGFnd20zWmRkMjJGb1N5eElSQkU2MTByRStvODhuZnVXVnViS0swcG11?=
 =?utf-8?B?WlE3RGNncGgrQWxwcGREK2ZZZDNCR1F2YkhaaG5mbEFmajN4L2oyNnhnczZC?=
 =?utf-8?B?WXRJeDY2cVlycHhDb3ZDL00rTEh1b2g1SlYzMVNBV3lpb0kwWEhBTDIzcDhT?=
 =?utf-8?B?UzJYcVU0QzlBUFQ2dUU0clpFSjZTUkRqRGhFb2tFK2pScUU3a1BTYUtwMzlD?=
 =?utf-8?B?aldkQ2djTHZwWWdXRWVoakZMSGE3NUl1SEVGZE5lMUNNa054bHI4UitVMmln?=
 =?utf-8?B?NVVDdVlzQzhlWnlQdmVkQk12LzBXdmtNd0U3dHVOY0pmTEFVTUVUS0lPNmdV?=
 =?utf-8?B?cG9pZCt3NFI5RUhtVVNIQWE0SlRtandJWG42Rm13L0UvNDVYTU9jeTdkYlVH?=
 =?utf-8?B?RitBK1QydlRVWUpyNmdFWUE5ZWV3U1FUaGxNSlFmaWdidTd5bkVsdjhlRHJ6?=
 =?utf-8?B?SGwwY0lheG52cVIycnFmZUFrK1p5b2dZOHZtSmE3YUdlbDV2L3R1ZUpJb1Av?=
 =?utf-8?B?T3hrZ0FQMHBmNTFhU2Y0UzVQdXlwYXVhWFFvQmg2Z2pwTFJQSTFGWFdxWmlr?=
 =?utf-8?B?REUzTGtOZTNqOURybUVhd1FoYzRZVmFha3dkUExhVDhiV0Q1WmJjODBybFdk?=
 =?utf-8?B?dHFXR09raXRmQ1hFVjdPeDBpUVdYZUFaM2syTEtlRXRjQ1JzOTI4QkQwYWM5?=
 =?utf-8?B?elg4blRVYWhMUk5JNGlJbU1pbWFrWVVkaXUydDMvWDBkQi9VaDJvQmdMZmoy?=
 =?utf-8?B?WnBPMHlVaU5FRWprd1J4ZHNEeTR1bzVuMUhKaWNnYzA1eG1YNTJ2TVpNOUpY?=
 =?utf-8?B?UHlHbExmOXB0TE1JTXp0WHM2ZS80L21jOWNJMElVak1sak8vMXZ2QVF5SnVl?=
 =?utf-8?B?Y2pxSm0wYk1FQjVQTGdEVFNKZWx0YnJxSjRlODdNNXgyNTVBRkN4WXJqL05Y?=
 =?utf-8?B?NnZZbXpsSE9iZTBnRHFiczY4SFRTck93azNiZ3hmSkhxclNIOEFQbGxza1pH?=
 =?utf-8?B?STg3VzQyb2N3U0hwSUtBQXk4NlZ4NTRPU1MrM1RFbStKMVNvdy9zOE1ySTRD?=
 =?utf-8?B?YVF1bFd4VHpvVmZjckdubTJNVUpHY0hUZFZpOUVkaSswc3o1MjVLN3NRMDE2?=
 =?utf-8?B?dlJaZVZ2MjJ1a2J4WG5sQVFBVWkySjB3Y2dTN05wMzMrbXNsRWdXMmIyczVk?=
 =?utf-8?B?VkppaTBIQXB1L3hLdm9HbHhuMEY4eEZMSlJTeTJwYTA2Y000MWJETnVPOUFM?=
 =?utf-8?B?QWlILzlRQkxtOStCZ2pGWUpSWmxaQXpKMjhXazEyaUlNNzhLblFTNkE3SXRr?=
 =?utf-8?B?M3cxZUtCR0w5OG8vazB5aXV1YnAvTVMrUEZnQmRlNFM0NDFJUHJvYm1LcUI1?=
 =?utf-8?B?ZzNFWXV1ZWp4OHlNSnlHWllGay81U2RDZHZuVlF2Kys1dGNOZ2dPYXp6NmlZ?=
 =?utf-8?B?bG9WdUNzMHNERjBhdTgxTU82SG5VNDFlejlzZjNqWUNRdmRGTGF3Ykw5elJJ?=
 =?utf-8?B?aGhKTCtXTzJvbVlSUWl6WWhRQXZmVmJYZGhsUk1ZakVuL2kveC9JZ0tudGxq?=
 =?utf-8?B?VEZ4UU1SVUNHcCtVT3Z2UHk1TWJYOWVpKzNmQXc5RkF3R2ZvSjB6Z3dsdE92?=
 =?utf-8?B?OS9XeUdBeUNDVGIxdWpzNkhqSm9uVGJvd3RmblFyVTZzVzRtb0l0RFh0a2hR?=
 =?utf-8?B?bUxMMUxhYjNqaU8wMVlDNmp3SFVsSWpNcE5obCtRVlMyaWpzVWpTaXRoQmZR?=
 =?utf-8?B?ZjFHa2wrdkM3MCtDZ2piTmlBckU4TXY4eFpVK3VOS21rMy9uSFZ3cXJpTzZq?=
 =?utf-8?B?WUdWRmNLaWNGY29Nd3B4L1FQOURGUzlROHFEVEZlaHhIaHZ1VEx3ZktqTFZS?=
 =?utf-8?Q?Li1LqbKAh57gNW9Tnd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: kW6V7J2c8GBACIeB0Y0oj5mg3cMy8Dh44v4mOSKVQrJIBga1XeK73a+4l1yjVqXHavWQPQ4VyFEnRHoPUA3oHM0vXQCeUJYqgmCqnhlFndGI/bxcTRmTVL8fseVPcN9Q89dJBGQCnAlejfJ+dkcm148pvBpltHNVnADShSJXLwmEZHbQSDdOAERLBY2sWzYxmFtCbAOpbIH5JNA+lmc/w6U0gR6r1Pc080/wgc0d/0dSFT0+uBZSsrpNhPKi3TTQM4l/KobnKTWchb7EQ4Bf0Jh0mb+ujINww7+t8aou9LJQtfmHnw/CIHJAnlRRFEyK8Cc6mQ3dlvFA+3fYhNDWSw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bcd46f2-c206-4398-f90d-08deff37c3cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2026 03:53:30.6290 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Zg3I7PP+2bF+3MUy8ZiobPOZWYw42rQMtb+B+ELISBAm8Hwfk7+KkpYSbj8cjgnn5w6qSb26u4HnFt2lFeiMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6876
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

SGkgQE1hcmsgWWFjb3ViDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
aWd0LWRldiA8aWd0LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxm
IE9mIE1hcmsNCj4gWWFjb3ViDQo+IFNlbnQ6IDIwIEF1Z3VzdCAyMDI2IDAwOjM4DQo+IFRvOiBp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogTWFyayBZYWNvdWIgPG1hcmt5YWNv
dWJAZ29vZ2xlLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBsaWIvaWd0X2ttczogRG8gbm90IHRy
ZWF0IHdyaXRlYmFjayBhbmQgdmlydHVhbCBjb25uZWN0b3JzIGFzDQo+IGNvbm5lY3RlZA0KPiAN
Cj4gV3JpdGViYWNrIGFuZCB2aXJ0dWFsIGNvbm5lY3RvcnMgKGUuZy4gRFJNX01PREVfQ09OTkVD
VE9SX1dSSVRFQkFDSw0KPiBhbmQNCj4gRFJNX01PREVfQ09OTkVDVE9SX1ZJUlRVQUwpIGRvIG5v
dCByZXByZXNlbnQgcGh5c2ljYWwgZGlzcGxheSBzaW5rcw0KPiBhbmQgY2Fubm90IGJlIG1vZGVz
ZXQgdXNpbmcgc3RhbmRhcmQgQ1JUQyAvIGF0b21pYyBjb21taXQgb3BlcmF0aW9ucw0KPiB3aXRo
b3V0IGNvbmZpZ3VyaW5nIGEgd3JpdGViYWNrIG91dHB1dCBmcmFtZWJ1ZmZlciAoV1JJVEVCQUNL
X0ZCX0lEKS4NCj4gDQo+IE9uIGRyaXZlcnMgc3VjaCBhcyBNU00sIHdyaXRlYmFjayBjb25uZWN0
b3JzIChlLmcuIFZpcnR1YWwtMSwgVmlydHVhbC0yKSByZXBvcnQNCj4gY29ubmVjdGVkIHN0YXR1
cyB3aXRoIHZpcnR1YWwgbW9kZXMuIFdoZW4gZ2VuZXJpYyBLTVMgdGVzdHMgaXRlcmF0ZSBvdmVy
DQo+IGNvbm5lY3RlZCBvdXRwdXRzIHZpYSBmb3JfZWFjaF9jb25uZWN0ZWRfb3V0cHV0KCkgb3Ig
ZHVyaW5nIGluaXRpYWwgZGlzcGxheQ0KPiBzZXR1cCBpbiBpZ3RfZGlzcGxheV9pbml0KCksIGF0
dGVtcHRpbmcgc3RhbmRhcmQgbW9kZXNldHMgb24gdGhlc2UgY29ubmVjdG9ycw0KPiBjYXVzZXMg
ZmFpbHVyZXMgKC1FSU5WQUwpIGJlZm9yZSB0ZXN0IGV4ZWN1dGlvbiBjYW4gYmVnaW4uDQo+IA0K
PiBFeGNsdWRlIERSTV9NT0RFX0NPTk5FQ1RPUl9XUklURUJBQ0sgYW5kDQo+IERSTV9NT0RFX0NP
Tk5FQ1RPUl9WSVJUVUFMIGluDQo+IGlndF9vdXRwdXRfaXNfY29ubmVjdGVkKCkgc28gZ2VuZXJp
YyBLTVMgdGVzdHMgb25seSB0YXJnZXQgc3RhbmRhcmQgcGh5c2ljYWwNCj4gZGlzcGxheSBvdXRw
dXRzLCB3aGlsZSBkZWRpY2F0ZWQgd3JpdGViYWNrIHRlc3RzIGNhbiBjb250aW51ZSB0byBpdGVy
YXRlIGFsbA0KPiBvdXRwdXRzIGV4cGxpY2l0bHkgdmlhIGZvcl9lYWNoX291dHB1dCgpLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogTWFyayBZYWNvdWIgPG1hcmt5YWNvdWJAZ29vZ2xlLmNvbT4NCj4g
LS0tDQo+ICBsaWIvaWd0X2ttcy5oIHwgNCArKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9rbXMuaCBiL2xpYi9pZ3Rfa21z
LmggaW5kZXggNTIxYTAzYzAxLi44ZDRkMTQ4NDcgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pZ3Rfa21z
LmgNCj4gKysrIGIvbGliL2lndF9rbXMuaA0KPiBAQCAtNjY4LDYgKzY2OCwxMCBAQCBzdGF0aWMg
aW5saW5lIGJvb2wNCj4gaWd0X291dHB1dF9pc19jb25uZWN0ZWQoaWd0X291dHB1dF90ICpvdXRw
dXQpDQo+ICAJICAgICFvdXRwdXQtPmNvbmZpZy5jb25uZWN0b3ItPmNvdW50X21vZGVzKQ0KPiAg
CQlyZXR1cm4gZmFsc2U7DQo+IA0KPiArCWlmIChvdXRwdXQtPmNvbmZpZy5jb25uZWN0b3ItPmNv
bm5lY3Rvcl90eXBlID09DQo+IERSTV9NT0RFX0NPTk5FQ1RPUl9XUklURUJBQ0sgfHwNCj4gKwkg
ICAgb3V0cHV0LT5jb25maWcuY29ubmVjdG9yLT5jb25uZWN0b3JfdHlwZSA9PQ0KPiBEUk1fTU9E
RV9DT05ORUNUT1JfVklSVFVBTCkNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArDQp3cml0ZWJhY2sg
dGVzdHMgYWxyZWFkeSBieXBhc3MgaWd0X291dHB1dF9pc19jb25uZWN0ZWQoKSBieSBkZXNpZ24g
YW5kIGNvbnRpbnVlIHRvIHdvcmsgdmlhIGZvcl9lYWNoX291dHB1dCgpLCB3aGlsZSBnZW5lcmlj
IHRlc3RzIGNvcnJlY3RseSBzdG9wIHRyeWluZyB0byBtb2Rlc2V0IHdyaXRlYmFjay92aXJ0dWFs
IGNvbm5lY3RvcnMuDQpMR1RNLA0KUmV2aWV3ZWQtYnk6IFNvd21peWEgUyA8c293bWl5YS5zQGlu
dGVsLmNvbT4NCg0KPiAgCWlmIChvdXRwdXQtPmNvbmZpZy5jb25uZWN0b3ItPmNvbm5lY3Rpb24g
PT0NCj4gRFJNX01PREVfQ09OTkVDVEVEKQ0KPiAgCQlyZXR1cm4gdHJ1ZTsNCj4gDQo+IC0tDQo+
IDIuNTUuMC43MzcuZzA4ODY2YTZkMTMtZ29vZw0KDQo=
