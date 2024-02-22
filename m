Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0362C48BEB
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 11:20:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E7C10E8C3;
	Thu, 22 Feb 2024 11:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mjRUfo8c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254B510E35A;
 Thu, 22 Feb 2024 11:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708600841; x=1740136841;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n4RjvoHQiZt/06hIYBLKPN/LixGxn35fU3UiFHhw44Y=;
 b=mjRUfo8ccRxfhxzPPUUOqt5QtLfEUK4I+sPCePDU/v511+xSV5n7RBq/
 GqTcMbhYoVZYGC6JxtJVM1vDrp4bYpGIf9U/Kp+11pNna2Yve0h9hNDTT
 B9AvhTU8n+hiF5gpdFewk9AtspP/dM+ya3MrwYGRfGZbX7d6B195EeUrh
 5Z8y8kjTuuBhlf4cuVT/wdgS0QsrF0K0HVpTL51Bf5YUJSF325jMK6A1V
 fAyF+RLlhQ/mQP1Q1vtcy8pWdEfYS7WKYfnWDgicx1vhNaNOfhUCuhf5Y
 Z9e2JZG1P4j/N7KbTpdlpDS9/5wMup83iqedm/xMBvId683U8WKRBwBpk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2940053"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2940053"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 03:20:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="10101335"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 03:20:35 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 03:20:34 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 03:20:34 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 03:20:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOCuNwC+mBxXxAttSCJI3m1jwGZ150ymR/HFQrlo/J+nnJbAM1+m5kK1Z8PGL8hz2UFU6hdytGcTvkWjL1nt635iC9ichWNJrR4va6j+BiGvXt4Sl+i0vqe+RCm5oSu7a6aXEwKpt1Zc2KnSTj2Iy3T8rsejUuMyooixnvX2DVQoMqLkLnWZ3e+fvenUNcp1EG1twpBwAs9VNY+XkMIFlMTUkhpmkfRp4zswaDbz+ha59qfQah0c7WGzfWrNpFAHKUQvmAZs4LN2XmdgJXNOEWwZlHNltN9IJnL3cfy1Xks55ePLu6tTiFXRxQ+a38U1tYiPY9W/FG2qt2zB7ATNVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4RjvoHQiZt/06hIYBLKPN/LixGxn35fU3UiFHhw44Y=;
 b=m8mW1XXMt9XISL7oG2a54NM2GpmqAo6rivZQxNiZpzwCV4rIkcvSascJt+9OzgvMNxnRbDBisk6KGjd1MPQYltmqaUR7KOLeC47yS/PQeME4WOClpOreS5wui7uomGWzusqCx/7wrBy1yZih9t+mHuMVxFmZSjqOSsG5jvS8DYYmZv9xdkpNRsPGk+ldkecZbz2BqQAbFeqf5rW1slLg5XS6jN+VjGTAx6S4JmlDbMGkYxFNZgElgqP2Hgn19F4jKH6Nlwiba+cG/wYD3RWqaefpP5KZtCuu9q6ZFydUHidI10nalaTYDLfgnpL1wxkXVFVa5MMTm34IMGQsip6ASQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by SJ2PR11MB8470.namprd11.prod.outlook.com (2603:10b6:a03:56f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Thu, 22 Feb
 2024 11:20:31 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::9359:9512:f038:13ae]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::9359:9512:f038:13ae%4]) with mapi id 15.20.7292.036; Thu, 22 Feb 2024
 11:20:31 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "I915-ci-infra@lists.freedesktop.org"
 <I915-ci-infra@lists.freedesktop.org>, LGCI Bug Filing
 <lgci.bug.filing@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBGaS5DSS5JR1Q6IGZhaWx1cmUgZm9yIGxpYi9kcm10ZXN0OiBk?=
 =?utf-8?Q?rop_legacy_check_from_filtered_opens_(rev2)?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2RybXRlc3Q6IGRyb3Ag?=
 =?utf-8?Q?legacy_check_from_filtered_opens_(rev2)?=
Thread-Index: AQHaY6fOnp1OtJI3AUOQ7IPGJrVJ0rETHt4AgAMb7mA=
Date: Thu, 22 Feb 2024 11:20:31 +0000
Message-ID: <PH8PR11MB67532B08A808899E94E4E886F2562@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <20240219173534.38360-1-kamil.konieczny@linux.intel.com>
 <170839748467.108021.3957456089750643653@8e613ede5ea5>
 <20240220115108.rusf4qhxz6atojmj@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240220115108.rusf4qhxz6atojmj@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|SJ2PR11MB8470:EE_
x-ms-office365-filtering-correlation-id: bec81727-18d0-4689-22ae-08dc3398481d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GEPSKHNS9/RwCSWHbTwVTtXy3Q261xt7gkYg01xdU/xk4gNSDQiAnGGrbCeXI+VbnicmcObc4Y7Da2x/eEMqOUUjVEcqQXyaLVpGceDb2qC7Vz06H7eJnNnox3UCjZngSyqJt81ZMZjH0zBQQo+3etH1iMlXyPxjlJWZbySXicC5CQzmSzOvNpnHtvr1XpUxq0wdD2izlc/brbnJn+R9/+BYjjSPk8HGdof9M/2gmzA4VSl3BRP3noLHtDfXaEWVJnycwvBCsIxVl5qyfa9jY9B9TP5xpPmVVL/OVFM0TW3q6L1CsiHTOFU9c4D/fQKMg/dXpqb/ApYFrWV3NgQRW9uXo0TbXXvM+DZEa28vL1MBTlquOvhB+neMtVu+ltI2EGVmQQos26S0l9FIEBUcnEo1c8msK5g3zZsK1Cpo45Tvk1063658HGgofgoplikOthVh4GqVbeLWJLX4ZMuzVw367AhCMsI6lsimZKh2Hn0jthZh+nXgu0bJlBRIWuAO0txApooBv2NswrOyFgmGr1xQTEjLHf6fz9/JUg54Ala9E8KXEwjB//3TnnL57tAwCAe7p/+9ora3u2f4Lk1ujTkgngy/JK3QNP+HZEWsbAs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzA2WEt0cjFad1U2V1AyYkVCZVo2TVRPbk91UHR2YUFVSWNFdys1VzVRY2pR?=
 =?utf-8?B?SWxDcjlxK3BDcmFyRXE3ZVBoUnJxT2xqNy9KUnUrdFI3THhJUEJQK29YOEVU?=
 =?utf-8?B?Yk9RMHRiSTlGOFRhT0J0aHE2VjBETXI5VURJbWlFZXZaenBwQ2lYZUNJTm1E?=
 =?utf-8?B?bERFTTdJQTQxQjdxb3lQZFcxMTNJcFlmclNTRTB5NHpjeWgwclJhdWd5UlB4?=
 =?utf-8?B?bzlFNzI1ckFJMndrU0pmUUU1RG04OENIejVQTG5yVmdYOVorMXBsZGRzaTVU?=
 =?utf-8?B?cUpQQUczRCsxUjRsQmdBdlBQSzRYVVhURDZoZGFxRFhaTVB1Y0lnc2s5MXRk?=
 =?utf-8?B?LzdiTmlQVUhjYnU4RVBqVnBiVDAvT2FGeWlKQm9KSlA4SDUrTDZ2dUpjKzBP?=
 =?utf-8?B?QkdtaVpQN2kzbnRMS011R0pJa0RqZnlISkZnaHI1UHVSQzFxN0hJNFhnclA0?=
 =?utf-8?B?aldRM0ZkdEdoblVCbWRyYjIrRllIQlRMYUVYc2hpYXE1bWlKL0JoZWdjVklm?=
 =?utf-8?B?N0FCNzcyRTRuYzVFSGtzMTZ1dEszbU5zK1R0OExIODV0VGc0UmxNZXo3M2dN?=
 =?utf-8?B?TExVMXBHNk1QK1BxU01HbkdlN3lxNGtpRVBCSTluQ1RuMHF0YXdHVmVIcklL?=
 =?utf-8?B?cXN1TVZZemhESjJ5UUJ6RzZpOEZwTUlzNFZWUk1BZ1RTTXhDZTk2L2Z1Q3ZI?=
 =?utf-8?B?VEwwNFJpd0pFSlRKKzRFaGExS3dPVEZOUGpOTXUvTHo2UW12RHhQemgyMnVx?=
 =?utf-8?B?TUVMMmFVUnhuR0ZhY3J4THg1UkhXYXYxK2NkeGVrWjRnK0htbHV2Umh4c3lo?=
 =?utf-8?B?MHlLTTlKQU9JM0trS3Z2NFpUdGhYa08yWjBseW1vWTJEaDlTK2pJc04zY0Vj?=
 =?utf-8?B?blRkSUR1VGl6UlBFanRhOVdUZ1ppQmpMZDdlL3hoZFF0TVpXQkJzT3dLbEhQ?=
 =?utf-8?B?RUMzM3JiS3orUC9icFpuMktMM2xRekJiWFJQSU4xTmd6a0w5cDNDQTQ1dlh2?=
 =?utf-8?B?ejNmMXVLVVh5MTU4UTRqNmYrdzJSL2c2NWh0SyttY0xKd1Q2Q2o0MmhkNHRL?=
 =?utf-8?B?TXF2dGtjN3VsV0NqdkZEak9ZS1RycThkWS93aEdLTU5pM0xoTXVmL1ZBZzFX?=
 =?utf-8?B?c0VRRVNIWi9SdnEvOGhXTzlMUVhWRXBLZnRpaG5GRnQ4Mm95TytyWTlmaTMy?=
 =?utf-8?B?TjZHWnJOV1BxcG9CUm9hYjlKMndyNUFqV0hDVC9NejYyYkpMUXVZeWo1ZFhr?=
 =?utf-8?B?ajNPOUU0S1ZHdWc3ajRUZHZ5cnBhRWR1T3E5V0ROZUtweFMrbGY0QnRnbmx3?=
 =?utf-8?B?Snp0S0t3bENXV0dESTdzOURCTFh2Y2JGb1hFbnBOK2VzWmt1aXozNlkzRmYz?=
 =?utf-8?B?dTJ6QnFEdDNxTHpOaHdYWFJ1VkZuNWU3ak1yODlYWVovcjM1QUg0ZExaQnFY?=
 =?utf-8?B?M0FVWUVPZ2xud1F1RW9lSTBDQWJrYnRVRFcwTXppZm45MDlzdjNpWVF5NVVl?=
 =?utf-8?B?UkVpdWVrUmRKRmpxYWFVa1lBVnUvVVN4NnAwbys5MFFHRnBGWmFiUDNJUjlH?=
 =?utf-8?B?WUxqQTBMNXVKRk1md1pjd05XazRCUXgva0l4blZzWk9rbjAvMFFxc2xJSGdT?=
 =?utf-8?B?RDhYWW5pb0VJTkZLVHYzazM5SlBBWG5MQnFYWUMwNjZHQmVhbnNpQkhMM1hm?=
 =?utf-8?B?Y3BhaDBUKzdFb2prYUc0ajF5ZndaMkZZOWRqaXdzOVBOblBkVUg5M1hZZENC?=
 =?utf-8?B?bEZ3R04waHM1U1hKYVJqSzR6azdQVzlOZHZ6RmRKUmplSWpKRFR3d3o3TU9H?=
 =?utf-8?B?dTU0L2ZXUWsyY2tsZnlhVVhvZ1Y5Q210VXk5NVhibWpCaW5uRExjTE5RM1VT?=
 =?utf-8?B?ZkxhRCtheC9oS212YUh2ME1oVTduNTFvZGxsRGE1OW8zZzBsS2pzcmE2cVor?=
 =?utf-8?B?TktnKzBBMlZTUVduWG1JclhxTkV2azlpbzZ5anBENFl0ZXRwNmNDcER4RUFF?=
 =?utf-8?B?VUtwWEZFaFZqOGhRWkJpYU4ycGpmck5hdHd1cnljOEcrTmVWRFhacmF5dFc3?=
 =?utf-8?B?L0FuWkE4UjNBMU5KSzMrYnRmTnVkL0RrMTNjMkJ2Ung3L01mMU1ZYlg0NlRj?=
 =?utf-8?B?OVJSdUU5TmhFd3JoUHhHU1RQcmNmL2NqakQ2ZkVtbUVEeVgxNlpjQk5qdjJi?=
 =?utf-8?B?cFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bec81727-18d0-4689-22ae-08dc3398481d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 11:20:31.7419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JONbNnbCLKv+Yp5M04zXbp8VP0oOW2W5OYDxSfYPqNgQ6Ow0OyhPrO22RFWZbIU+1COtcjg7UPtrNYZmnIUDYSuD4ALL4yJhr8ecDb0UOxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8470
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTMwMDI1LyAt
IFJlLXJlcG9ydGVkLg0KDQpUaGFua3MsDQpUZWphc3JlZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50
ZWwuY29tPiANClNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDIwLCAyMDI0IDU6MjEgUE0NClRvOiBp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBMR0NJIEJ1ZyBGaWxpbmcgPGxnY2kuYnVnLmZpbGluZ0BpbnRlbC5jb20+
OyBJbGxpcGlsbGksIFRlamFzcmVlWCA8dGVqYXNyZWV4LmlsbGlwaWxsaUBpbnRlbC5jb20+DQpT
dWJqZWN0OiBSZTog4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2RybXRlc3Q6IGRyb3Ag
bGVnYWN5IGNoZWNrIGZyb20gZmlsdGVyZWQgb3BlbnMgKHJldjIpDQoNCkhpIGlndC1kZXYsDQpP
biAyMDI0LTAyLTIwIGF0IDAyOjUxOjI0IC0wMDAwLCBQYXRjaHdvcmsgd3JvdGU6DQo+ID09IFNl
cmllcyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IGxpYi9kcm10ZXN0OiBkcm9wIGxlZ2FjeSBj
aGVjayBmcm9tIGZpbHRlcmVkIG9wZW5zIChyZXYyKQ0KPiBVUkwgICA6IGh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTMwMDI1Lw0KPiBTdGF0ZSA6IGZhaWx1cmUNCj4g
DQo+ID09IFN1bW1hcnkgPT0NCj4gDQo+IENJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20gQ0lfRFJN
XzE0Mjk3X2Z1bGwgLT4gSUdUUFdfMTA2OThfZnVsbCANCj4gPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiANCj4gU3VtbWFyeQ0KPiAtLS0tLS0t
DQo+IA0KPiAgICoqRkFJTFVSRSoqDQo+IA0KPiAgIFNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNv
bWluZyB3aXRoIElHVFBXXzEwNjk4X2Z1bGwgYWJzb2x1dGVseSBuZWVkIHRvIGJlDQo+ICAgdmVy
aWZpZWQgbWFudWFsbHkuDQo+ICAgDQo+ICAgSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFu
Z2VzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+ICAgaW50cm9kdWNlZCBp
biBJR1RQV18xMDY5OF9mdWxsLCBwbGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2kt
aW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0aGVtDQo+ICAgdG8gZG9jdW1l
bnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2
ZXMgaW4gQ0kuDQo+IA0KPiAgIEV4dGVybmFsIFVSTDogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTA2OTgvaW5kZXguaHRtbA0KPiANCj4gUGFydGlj
aXBhdGluZyBob3N0cyAoOCAtPiA4KQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gDQo+ICAgTm8gY2hhbmdlcyBpbiBwYXJ0aWNpcGF0aW5nIGhvc3RzDQo+IA0KPiBQb3NzaWJs
ZSBuZXcgaXNzdWVzDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUgdGhl
IHVua25vd24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBJR1RQV18x
MDY5OF9mdWxsOg0KPiANCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPiANCj4gIyMjIyBQb3NzaWJs
ZSByZWdyZXNzaW9ucyAjIyMjDQo+IA0KPiAgICogaWd0QGttc19jdXJzb3JfY3JjQGN1cnNvci1z
dXNwZW5kQHBpcGUtYS1oZG1pLWEtMzoNCj4gICAgIC0gc2hhcmQtZGcyOiAgICAgICAgICBbUEFT
U11bMV0gLT4gW0lOQ09NUExFVEVdWzJdDQo+ICAgIFsxXTogaHR0cHM6Ly9pbnRlbC1nZngtY2ku
MDEub3JnL3RyZWUvZHJtLXRpcC9DSV9EUk1fMTQyOTcvc2hhcmQtZGcyLTYvaWd0QGttc19jdXJz
b3JfY3JjQGN1cnNvci1zdXNwZW5kQHBpcGUtYS1oZG1pLWEtMy5odG1sDQo+ICAgIFsyXTogDQo+
IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTA2OTgvc2hh
cmQtZGcyLTEvaWd0QGsNCj4gbXNfY3Vyc29yX2NyY0BjdXJzb3Itc3VzcGVuZEBwaXBlLWEtaGRt
aS1hLTMuaHRtbA0KPiANCj4gICAqIGlndEBrbXNfZnJvbnRidWZmZXJfdHJhY2tpbmdAZmJjLXJn
YjU2NS1kcmF3LWJsdDoNCj4gICAgIC0gc2hhcmQtZGcyOiAgICAgICAgICBbUEFTU11bM10gLT4g
W1RJTUVPVVRdWzRdDQo+ICAgIFszXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUv
ZHJtLXRpcC9DSV9EUk1fMTQyOTcvc2hhcmQtZGcyLTEwL2lndEBrbXNfZnJvbnRidWZmZXJfdHJh
Y2tpbmdAZmJjLXJnYjU2NS1kcmF3LWJsdC5odG1sDQo+ICAgIFs0XTogDQo+IGh0dHBzOi8vaW50
ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTA2OTgvc2hhcmQtZGcyLTYvaWd0
QGsNCj4gbXNfZnJvbnRidWZmZXJfdHJhY2tpbmdAZmJjLXJnYjU2NS1kcmF3LWJsdC5odG1sDQo+
IA0KPiAgICogaWd0QGttc19wbGFuZUBwbGFuZS1wYW5uaW5nLXRvcC1sZWZ0Og0KPiAgICAgLSBz
aGFyZC1kZzI6ICAgICAgICAgIE5PVFJVTiAtPiBbVElNRU9VVF1bNV0gKzIgb3RoZXIgdGVzdHMg
dGltZW91dA0KPiAgICBbNV06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9k
cm0tdGlwL0lHVFBXXzEwNjk4L3NoYXJkLWRnMi02L2lndEBrDQo+IG1zX3BsYW5lQHBsYW5lLXBh
bm5pbmctdG9wLWxlZnQuaHRtbA0KPiANCj4gICANCj4gIyMjIyBXYXJuaW5ncyAjIyMjDQo+IA0K
PiAgICogaWd0QGttc19jY3NAcGlwZS1kLWNyYy1wcmltYXJ5LWJhc2ljLTQtdGlsZWQtbXRsLXJj
LWNjczoNCj4gICAgIC0gc2hhcmQtZGcyOiAgICAgICAgICBbU0tJUF1bNl0gKFtpOTE1IzUzNTRd
KSAtPiBbVElNRU9VVF1bN10NCj4gICAgWzZdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcv
dHJlZS9kcm0tdGlwL0NJX0RSTV8xNDI5Ny9zaGFyZC1kZzItMTAvaWd0QGttc19jY3NAcGlwZS1k
LWNyYy1wcmltYXJ5LWJhc2ljLTQtdGlsZWQtbXRsLXJjLWNjcy5odG1sDQo+ICAgIFs3XTogDQo+
IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTA2OTgvc2hh
cmQtZGcyLTYvaWd0QGsNCj4gbXNfY2NzQHBpcGUtZC1jcmMtcHJpbWFyeS1iYXNpYy00LXRpbGVk
LW10bC1yYy1jY3MuaHRtbA0KPiANCj4gICAqIGlndEBrbXNfZnJvbnRidWZmZXJfdHJhY2tpbmdA
ZmJjLTJwLXNjbmRzY3JuLXByaS1zaHJmYi1kcmF3LW1tYXAtZ3R0Og0KPiAgICAgLSBzaGFyZC1k
ZzI6ICAgICAgICAgIFtTS0lQXVs4XSAoW2k5MTUjODcwOF0pIC0+IFtUSU1FT1VUXVs5XQ0KPiAg
ICBbOF06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvQ0lfRFJNXzE0
Mjk3L3NoYXJkLWRnMi02L2lndEBrbXNfZnJvbnRidWZmZXJfdHJhY2tpbmdAZmJjLTJwLXNjbmRz
Y3JuLXByaS1zaHJmYi1kcmF3LW1tYXAtZ3R0Lmh0bWwNCj4gICAgWzldOiANCj4gaHR0cHM6Ly9p
bnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMDY5OC9zaGFyZC1kZzItNi9p
Z3RAaw0KPiBtc19mcm9udGJ1ZmZlcl90cmFja2luZ0BmYmMtMnAtc2NuZHNjcm4tcHJpLXNocmZi
LWRyYXctbW1hcC1ndHQuaHRtbA0KPiANCj4gICANCg0KQWJvdmUgZXJyL3dhcm5zIGFyZSB1bnJl
bGF0ZWQsDQoNClJlZ2FyZHMsDQpLYW1pbA0KDQo+IA0KDQouLi5jdXQuLi4NCg0KPiANCj4gQnVp
bGQgY2hhbmdlcw0KPiAtLS0tLS0tLS0tLS0tDQo+IA0KPiAgICogQ0k6IENJLTIwMTkwNTI5IC0+
IE5vbmUNCj4gICAqIElHVDogSUdUXzc3MTggLT4gSUdUUFdfMTA2OTgNCj4gICAqIFBpZ2xpdDog
cGlnbGl0XzQ1MDkgLT4gTm9uZQ0KPiANCj4gICBDSS0yMDE5MDUyOTogMjAxOTA1MjkNCj4gICBD
SV9EUk1fMTQyOTc6IDUyYmRjNThiM2IyYmQ3Yjc3NzEwZjBkNjcxMGMxYjlkYmFlZTFhZjkgQCBn
aXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9nZngtY2kvbGludXgNCj4gICBJR1RQV18xMDY5
ODogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMDY5OC9p
bmRleC5odG1sDQo+ICAgSUdUXzc3MTg6IDQwZThiOTEyMjg1M2Y0NTVjODRhZmNmYTU2NDY5YTZi
YzlhMGQ1NjQgQCBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9v
bHMuZ2l0DQo+ICAgcGlnbGl0XzQ1MDk6IGZkYzVhNGNhMTExMjRhYjg0MTNjNzk4ODg5NmVlYzRj
OTczMzY2OTQgQCANCj4gZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvcGlnbGl0DQo+IA0K
PiA9PSBMb2dzID09DQo+IA0KPiBGb3IgbW9yZSBkZXRhaWxzIHNlZTogDQo+IGh0dHBzOi8vaW50
ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTA2OTgvaW5kZXguaHRtbA0K
