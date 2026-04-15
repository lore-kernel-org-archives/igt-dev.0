Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40666F43825
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 14:19:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C114710E6F3;
	Wed, 15 Apr 2026 14:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+fwGuYv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14DA10E6F2
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 14:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776262746; x=1807798746;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=OBCki1jJj/p0oEkMzWfkilcAkYfA59nPpRTBluwgojQ=;
 b=B+fwGuYvjr37x+dEirXj3afVddGUZWua+btn9t2+xMEN9T29UG1rvfcJ
 mUke82QMz6nZBfCEy2n9T1TL7Wza9I658+PmisBTEI8Acq/sdiCQoeoGI
 LpBcC4k9TNR3iQf0VIyUEIwCmGWJoMUGRqrcMj3qDrwvKBU29TYlHsAvv
 ohEHYUYMN6EHIuOlv5UPDYrR+LYibKrnIwM6nQwstX1QmdrPEOnIPtJPx
 vTek7HXA6PkGq9IVv8htzBQXfIDoS5mbUCo8qloGaH6ZXWJpOITz7cXp3
 yzSxpA0jr0LwOLTefAmFkEUOdbblHolOzVKJMiGX5LbdOHQSDTVUdWqLX w==;
X-CSE-ConnectionGUID: I+dC3sYKTB66M8Q+jlMYew==
X-CSE-MsgGUID: 5lGPKNOTQGmJgqYROAG6uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="76272591"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="76272591"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 07:19:06 -0700
X-CSE-ConnectionGUID: WIXyRunwTe+HeByaZ+NZAQ==
X-CSE-MsgGUID: xZmpnZeDQ7Cz3FXO7jq2zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="232175282"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 07:19:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 07:19:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 07:19:05 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 07:19:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aH/bqRGPm6EqK2L2dSerSOg0w85q+EIq5av+Vc9mS5KFkiq0M8l5KjlwklnRwPV7XV0U0i9r8Qngs+mYp8hofrwYaJfROodgf3XZPszFT4UuHDc0SlY5xEeFfl1t3R/C+2rkQF8QU8zmrOs7sRJEisQmiaETC4mScX8gfqiM1ZrxuB0nmnyioimSyo3Fx+KRF3rqjMH84PjLWO5I7UwBRElZ8Acx6Ex+8yEJPXwLnGOXhMRxXW1qL7wVo6BGQkzSyNYk0BH8W3+loG3KNKBx2erU4FnFgFfsVuR9PoMFUfqKneH8iYJ50VkSziVif2aE/lGXsV/nvfJ5+EeU7zYbEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBCki1jJj/p0oEkMzWfkilcAkYfA59nPpRTBluwgojQ=;
 b=e1sN26mzEScXH6J96TiheVr3bkgQDIHBfGPRzcLNK8G2KZPSVfVLl1JDRWP4RMLWcUd4iR09efs0UbAYu/Yee08BYRULTixpkFfxs5Hi7MgMK3+2DoKzvipGZ/vuMggoAKZroGirVuTueQz/XfUsrG/z60Gk7KvDrs77/dKAiBqFXE7gRnKYRFykVimWpH2v7V5NDMFwtW/F9wTd0dBVrXCF1PlPcAu8QJ/XRU6W3yC4hRO6TJvdLUhCpLAXRW84A4WMoDwHz2rOe1oOb961aG7jpPR2EpWsoXcEMOvRevst2yd/o8TrU3uSjVtvrvAhyxaSA8ItOls2q5y4yRfP1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 DS0PR11MB8082.namprd11.prod.outlook.com (2603:10b6:8:157::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.21; Wed, 15 Apr 2026 14:19:02 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%3]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 14:19:02 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>, "Thomas, Sobin" <sobin.thomas@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 1/1] test/intel/xe_vm:Add oversubscribe
 concurrent bind stress subtest
Thread-Topic: [PATCH i-g-t v3 1/1] test/intel/xe_vm:Add oversubscribe
 concurrent bind stress subtest
Thread-Index: AQHcyv6wVBwLLfzigkiv20PS0dksTLXe0g0AgAFdkoA=
Date: Wed, 15 Apr 2026 14:19:02 +0000
Message-ID: <ea4feb817a22a5274c99afacf2a1f8da8cb3598f.camel@intel.com>
References: <20260413043318.17931-1-sobin.thomas@intel.com>
 <20260414172752.vjwgjx6ufx7rhpdy@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260414172752.vjwgjx6ufx7rhpdy@kamilkon-DESK.igk.intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|DS0PR11MB8082:EE_
x-ms-office365-filtering-correlation-id: e87004c1-83d6-4eed-5525-08de9af9f1aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: HSu48YoasYom7g40YqNsimpftoNkHtfmfjFmbwCnaoJmPfQwDFFEo8ciZEejWOIueZwFmAw48U2xu3Zm1jmACS3TEFkwxqeJGOCukpOaxtuKksIDEMHEtnnZDnDwD4aU6rdag2jY3h6To1WGLacS2Ak13Pnu4eG40qnga/d+hoS4Y8c+k/HhgYjNDiftGS+lUTcHjkE3EqeD+xO1X1elmn/uyJ4dwjuV9CLkNHu7th0ZC7n6fFp+W6UbIoBPYMH59mkpZxqN1m/5FLjDkn0uNYMWz4KjyfQAf/zfHgdvOaDcofXYbP5HcPw0mnFCHiBxzwdy8IuOo5jCYj6009GIJFbutH1SQJfZ/TbwVkRRP9i0bGWBdS2kuiTdors5lro66Mhv6qM1VTWykCKY3VYaNgqhHonpx2+6udRTFDaXSgYf99kwSpHd/2uE7ptCo5Cqlo8zWiKwuolqfl6lucWenR0FJ8P/KWL+3rSewmcxD5gpzONYMVOQieBxVzGLwl2JfHVdaVitC93Q1eHDE5Fo8YXcmdnxEalr4FtwG99DNzYPmrKQx3QGngk8DMMAL6qp8BuY8h5SVvmRLrX7IYTfUKLtvtnkjRUsGZLjRewhXVNiq1hfMmrDjaMARjh1iL+Jm5mb+hskXQmShxhh51FbEvPeG97cteStfGy+SIC+AtbddnoluLn3PesjSWH8qg3K5r7GtNVdIjjj637RhCYsn2qvNagz8AJIwhqp/xv2g+BzEsCIl9Iz2zRAjYw4IoqMAiEabKIw4QZ2BDpc57ZyzNd1nMj6QXT1WyY+uXWySjY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFR5T3dIUG1NSWZWVjFsZTBad0RBUStNNEh5Z2hYdDR5UjJncm90S1lqN3Nr?=
 =?utf-8?B?UHRrZCtjK2svRnc4U1FSdzl4azdrejl4YXhabFlpQUVMNnhPMmwrUFhER0Q0?=
 =?utf-8?B?VEhOYnh4Szc0R3JGdm9sdHJ0dkNkMllZU09oVnE0Z3JHbHRlYTJGME1uRDJE?=
 =?utf-8?B?enMveDlQbk5NTm1MbExpT0w3cWRUT0cxK0ttNVBhQWE4K3JLV3pyb0toeEs2?=
 =?utf-8?B?YXdzRHF6ODdiY3UzU3MySXdENkdGYjRFUksremVVNDg3NXltTVBCTURCVnpM?=
 =?utf-8?B?WmV4RnJyT1pkay9WV0d5Q1Z2Q0UrdG1kSzdEbWpobm94VHRRLzJveEtYeHAw?=
 =?utf-8?B?YnFxL2c5QTZySWtpaTRidGN0eVI2RlB2UytINlA5Z1BkbURNZW9FTWE0d0s5?=
 =?utf-8?B?cyswQk5qQ0ZDOWYxZnMrdWFWV3pwdUs0MGtYTXoyNnJrTXZOQTVFVGF4NGUw?=
 =?utf-8?B?b1VpTXRMbE53YUY4OFFQSDJqYWtHWUpHaGowbUpnYWREaTBLYkNtZkxyclVw?=
 =?utf-8?B?b1U1b2M3VTkyVHlaSzlhQkZkN2xxSStrVGVGRlIzTUFSMmJCRkQ0Q0tWeEtp?=
 =?utf-8?B?YWJFNkFsRWdwT2YwS1pQelJsOFhKNzN6azgyTDNHak9QVDRuRDl4Tm94Z1dx?=
 =?utf-8?B?VWxNUUY4eDFldzBaTlhLMi9hejFuTi9ISDl4engybnJJYk0zQTN1ZUF4N01l?=
 =?utf-8?B?VTluR3RISktYcE1yN1g3V1lOelF1bzZHVjdRcnJXNVJyY3p1ZEQxckN0VWRs?=
 =?utf-8?B?M0R1aHRJSjhlbjg1Qy8xU0c1dU16YWdFSnArSDUxbHZKeHVnMHhvNWt5bGVB?=
 =?utf-8?B?S2tpSTJHcEMvVnYxb3dGS1B0Qy90MDBZdWhGY0FReHZCR1hOUmswd1pWby9x?=
 =?utf-8?B?VzBSUWI5K1dGVVl3OHVCMUJxd0JGYTQ3UnZtcXpCalBtVW1oQ2QrVjhtRlgx?=
 =?utf-8?B?OS83VVdWWFF4dzN0dTNqUlNjaGl1N0FEK1BYQXFBaWRLeVlwQUNhbzFjcU5V?=
 =?utf-8?B?Z2Y0Wjhlb1FtZ3ZxRU9ld29SMVp2QWRGTHVDNzF4MjRReXFuYUZDNmJmVmZh?=
 =?utf-8?B?a0czYU1UV3BFQ3kwNGJBQnZiNjh3RnJZVHd2UEFRMmlzbXU2bG40ckgrc2U2?=
 =?utf-8?B?UFBTRk11M0lmVkhSOXlmOHRCWmRXVWxoY2h4ZXBUQi9RWGQ5RlY2MGxjUk9W?=
 =?utf-8?B?ZmIwK1BGcGZmSklXZUpEeFNGZU5vT0FVNWc2enJ3aUEwbkVrNVR5YVRlR3dJ?=
 =?utf-8?B?L2d2cS9oTkFObUxCL3g3NkhSL3pvdXRQQmNuMUJQNGhXNDY4V0lidk9VV1oz?=
 =?utf-8?B?SzBQajNWSTFqbEFXS0J6UG0zVzlOeStORk9yMEFQQjVVRGYvUncrU2hzMW5h?=
 =?utf-8?B?dGlIYUt5M2NhSmV5Z1BQMGNBTEF6UG9oMVEwVmNvMncxY2tWZng4OElqVUEv?=
 =?utf-8?B?eXhzcFJMbm5HQlZyczQvTmJ2SngvUGZkL0g2Z1NEQUREaFBYbThPa1ZUbnlB?=
 =?utf-8?B?Ni80MVlzZk0xSmI1QmRvVWhsbnZ1ZTVQT3RwRVpycDZwN3JNRnY3VmhVbU5X?=
 =?utf-8?B?U3hqZURtb0RNblNtcEhhamErMjN0UWYwZlIrMy9ScHR0dTdMY1p3RTVBNjBs?=
 =?utf-8?B?WGx1OXpyczZKY3lqcXpkUitkYm51WURNeTNpbXBybDRERFZ6bGxDNnNuSkVR?=
 =?utf-8?B?blczT2xId0R1d1M4RWdBaTViQmg1eEdabzV2dG93ODBiTkQ3Z2ZhcmQrNUUy?=
 =?utf-8?B?SUJsNUcwRUdYYWg0Q1BQam5SSkJVeWJKQVplQVdGS0RvdmxPRWNCQUlsbXBQ?=
 =?utf-8?B?VWRPQzJaK1ptWlRTT3MzakxxcGs0eWhHSm02TThINWRNWWtReDMxTkJPQ000?=
 =?utf-8?B?Y1lXNGVScnBjM3BYTnNTUE1wWnFaczNnYmNlMDVtUDZiTGIzNU5kbENNdkpi?=
 =?utf-8?B?L3BzR2ZSZzVxdEYrOHUrekJNVzJiKytSdDl6VzNKSUlGWGQ5K1IzbTd4RDZi?=
 =?utf-8?B?OUJzZkZqRCtZSFQ0RGtTTnBDMUhmQUV6a0ZSaDNOejFpdWJrTTJLNmt6SUZG?=
 =?utf-8?B?Nld4R1dvMVRUUWwvNG5nUGRJTUVHZ2E1S05wazNWRi95eHNoT0kwM1hwdThG?=
 =?utf-8?B?V3c3LzlUV1lUL0c1eUVaaXZkeXoyUnZ6QkZtK0UyL0J2M2RuSVYyMlZreFVz?=
 =?utf-8?B?bXhlL3JIYzQxZGExTGZNYUlRNm5uQ1hickJ6ZGc2aU9mOCtPRFpqV0hxVmpa?=
 =?utf-8?B?RkgwRmswc3lVZ0NMdnBndWt1OGFOdE12VFcxbkxXVEtOZ3ZMSlM1UGNrb1ho?=
 =?utf-8?B?R1dkSzZnVGM0OGYrMnBSeGx6VGRnejBsajRqWDZKNHV5WGdDcE80aUthNGtR?=
 =?utf-8?Q?9Gb+YGd3yNtV4HVfiUOZdRT74uUhtza9eRQLXP3AM6HkS?=
x-ms-exchange-antispam-messagedata-1: ppNec5YYMTU+iA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5BCA2BCF6153F44B639C45417F96FB1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: frfA2kR2AqEfVe/AI3dQzYKx2aZjoUxY27RlzHy9PEkAHMCRsg2vsiRY1U9jk/FOaJsUm6o/qijfMHr7j3JVgXxobITHQm/Kn6AV5xL2sPJQqRJI0QS6m7G47QOhlgWY6WvjKa7y7ooZ7INuLziYsHIRN3LJLBW+Wnf7anTFWFzhRhCrZqcPOHzAUYF2h8WkzdE079skVgQjTfbkEUeQoYoMX7gPU+AETvgnvPSyTtalwetVoWJAJNXVPtAKEWUpNtS4Cr8Wz07zV+Xu9HlzgJ1lG7DV6jMaW97RWmYUSAtRcPV4vjwxBN8Wr+bZghJUpw2Anj3qjQ3VQnSOkoCRww==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e87004c1-83d6-4eed-5525-08de9af9f1aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 14:19:02.5124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KYY+RDKu7OjIg+S7uVa6jSv/ZE9wJeOZO1nVOFRw/nCpuAyoBdVvKsmitgthDnwSmK5l/ali57qo8xB8Vai3UGf5/9yLv46r6Ed33SXG7Y4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8082
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

T24gVHVlLCAyMDI2LTA0LTE0IGF0IDE5OjI3ICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IEhpIFNvYmluLA0KPiBPbiAyMDI2LTA0LTEzIGF0IDA0OjMzOjE4ICswMDAwLCBTb2JpbiBU
aG9tYXMgd3JvdGU6DQo+IA0KPiBzbWFsbCBuaXQgYWJvdXQgc3ViamVjdCwgYWRkIHNwYWNlIGFm
dGVyICc6JyBzbyBpdCB3aWxsIGJlOg0KPiANCj4gW1BBVENIIGktZy10IHYzIDEvMV0gdGVzdC9p
bnRlbC94ZV92bTogQWRkIG92ZXJzdWJzY3JpYmUgY29uY3VycmVudA0KPiBiaW5kIHN0cmVzcyBz
dWJ0ZXN0DQo+IA0KPiBGZXcgbW9yZSBuaXRzIGJlbG93Lg0KPiANCj4gPiBBZGQgdGVzdCBmb3Ig
b3ZlcnN1YnNjcmliaW5nIFZSQU0gaW4gbXVsdGkgcHJvY2VzcyBlbnZpcm9ubWVudCB0aGF0DQo+
ID4gY3JlYXRlcyBWTSwgYmluZCBsYXJnZSBCT3MgYW5kIHN1Ym1pdCB3b3JrbG9hZHMgbmVhcmx5
DQo+ID4gc2ltdWx0YW5lb3VzbHkuDQo+ID4gDQo+ID4gUHJldmlvdXMgY292ZXJhZ2UgbGFja2Vk
IGEgc2NlbmFyaW8gY29tYmluaW5nIG11bHRpLXByb2Nlc3MgYmluZA0KPiA+IHdpdGggVlJBTSBv
dmVyc3Vic2NyaXB0aW9uLiBUaGlzIGdlbmVyYXRlcyBtZW1vcnkgcHJlc3N1cmUgd2l0aA0KPiA+
IG11bHRpLXByb2Nlc3MgVk0gQmluZCBhY3Rpdml0eSBhbmQgY29uY3VycmVudCBzdWJtaXNzaW9u
LA0KPiA+IGV4ZXJjaXNpbmcNCj4gPiB0aGUgYmluZCBwaXBlbGluZSB1bmRlciBldmljdGlvbiBw
cmVzc3VyZS4NCj4gPiANCj4gPiB2MjogUmVtb3ZlZCBoZWxwZXIgQVBJcyB1c2FnZSBjbG9ja19u
YW5vc2xlZXAgYW5kIGNvbW1lbnRlZA0KPiA+IGNvZGUuKE5pc2hpdCkNCj4gPiANCj4gPiB2Mzog
UmVmYWN0b3JlZCBjb2RlIHRvIHNtYWxsZXIgZnVuY3Rpb25zLg0KPiA+IMKgwqDCoCBBZGRlZCBj
aGVjayBmb3IgYXZhaWxhYmxlIFNSQU0gdXNhZ2UgYW5kIGtlZXAgdGhlIG1heCBwcm9jZXNzDQo+
ID4gdG8gMjAuDQo+ID4gDQo+ID4gdjQ6IFJlbW92ZSBleHBsaWNpdCBtYWNyb3MgZGVmaW5pdGlv
bg0KPiA+IMKgwqDCoCBSZXBsYWNlIEJpbmQgaW9jdGwgd2l0aCBsaWJyYXJ5IGNhbGxzLihUaG9t
YXMpDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogU29iaW4gVGhvbWFzIDxzb2Jpbi50aG9tYXNA
aW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgdGVzdHMvaW50ZWwveGVfdm0uYyB8IDQzMw0KPiA+
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gwqAxIGZp
bGUgY2hhbmdlZCwgNDMzIGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvdGVz
dHMvaW50ZWwveGVfdm0uYyBiL3Rlc3RzL2ludGVsL3hlX3ZtLmMNCj4gPiBpbmRleCBkNzViMDcz
MGQuLjQyZWZmYmQ0OCAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV92bS5jDQo+ID4g
KysrIGIvdGVzdHMvaW50ZWwveGVfdm0uYw0KPiA+IEBAIC0xOSw4ICsxOSwxMDAgQEANCj4gPiDC
oCNpbmNsdWRlICJ4ZS94ZV9pb2N0bC5oIg0KPiA+IMKgI2luY2x1ZGUgInhlL3hlX3F1ZXJ5Lmgi
DQo+ID4gwqAjaW5jbHVkZSAieGUveGVfc3Bpbi5oIg0KPiA+ICsjaW5jbHVkZSA8aW50dHlwZXMu
aD4NCj4gPiDCoCNpbmNsdWRlIDxzdHJpbmcuaD4NCj4gDQo+IENvdWxkIHlvdSBtb3ZlIGJvdGgg
dG8gcHJvcGVyIHBsYWNlPw0KPiANCj4gPiDCoA0KPiA+ICsjZGVmaW5lIEdCKHgpICgxMDI0VUxM
ICogMTAyNFVMTCAqIDEwMjRVTEwgKiAoeCkpDQo+ID4gKyNkZWZpbmUgTUFYX1RIUkVBRFMgMjAN
Cj4gPiArc3RydWN0IGdlbV9ibyB7DQo+ID4gKwl1aW50MzJfdCBoYW5kbGU7DQo+ID4gKwl1aW50
NjRfdCBzaXplOw0KPiA+ICsJaW50ICpwdHI7DQo+ID4gKwl1aW50NjRfdCBhZGRyOw0KPiA+ICt9
Ow0KPiA+ICsNCj4gPiArc3RydWN0IHhlX3Rlc3RfY3R4IHsNCj4gPiArCWludCBmZDsNCj4gPiAr
CXVpbnQzMl90IHZtX2lkOw0KPiA+ICsJdWludDMyX3QgZXhlY19xdWV1ZV9pZDsNCj4gPiArCXVp
bnQxNl90IHNyYW1faW5zdGFuY2U7DQo+ID4gKwl1aW50MTZfdCB2cmFtX2luc3RhbmNlOw0KPiA+
ICsJYm9vbCBoYXNfdnJhbTsNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0cnVjdCBtZW1fYmluZF9z
eW5jIHsNCj4gPiArCXN0cnVjdCBnZW1fYm8gKmJ1ZnM7DQo+ID4gKwlpbnQgbl9idWZzOw0KPiA+
ICsJdWludDY0X3QgKmJpbmRzX3VmZW5jZTsNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyB1
aW50NjRfdCBhbGlnbl90b19wYWdlX3NpemUodWludDY0X3Qgc2l6ZSkNCj4gDQo+IEhlcmUgaW1o
byBhZGQgdGhpcyBhcyBwYXJhbSBvciByZW5hbWUgdG8gZXhwbGljaXQgNEs6DQo+IA0KPiBzdGF0
aWMgdWludDY0X3QgYWxpZ25fdG9fNEtfcGFnZV9zaXplKHVpbnQ2NF90IHNpemUpDQo+IA0KPiBv
cg0KPiANCj4gc3RhdGljIHVpbnQ2NF90IGFsaWduX3RvX3BhZ2Vfc2l6ZSh1aW50NjRfdCBzaXpl
LCB1aW50NjRfdCBwYWdlX3NpemUpDQo+IA0KPiA+ICt7DQo+ID4gKwlyZXR1cm4gKHNpemUgKyA0
MDk1VUwpICYgfjQwOTVVTDsNCj4gPiArfQ0KPiA+ICsNCg0KUGVyaGFwcyB1c2UgdGhlIEFMSUdO
KCkgbWFjcm8/DQovVGhvbWFzDQoNCg0KPiANCj4gUmVnYXJkcywNCj4gS2FtaWwgDQo+IA0KPiBb
Y3V0XQ0K
