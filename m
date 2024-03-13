Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0B0C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 05:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F4910ECDE;
	Wed, 13 Mar 2024 05:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G6C6lhAi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE74910E574
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 05:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710307185; x=1741843185;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JSbLDjihZUPu6W+82QwFF5YqWBt273CqaD7Mn4OUi2A=;
 b=G6C6lhAiMME7qxwJKFUWzCGv9Yp5AXT5XqZOQZp3XNqwebnovYPAA7id
 bMyfGi4nj9DuVAtX2ixoepJutNheuyHQq2BJsnkNWFCsjEgtOJ2GOmJ5Q
 uj3Hrbyonjb/4Ex6VsJY3p/xZfgLyMA5vXfUsxw+kwCCTYQ+71jR+PfUh
 y4swVLc4aeigStMgXWQEMs66K6r9yo1cHWF/tYml8QJGMBszxTWhJqkDV
 RLyC9qd6ChsYLxg8lJyJFxsxHJK5Tx4wG65xE6v1Z8kv/EeWxsCumQ6aM
 R+Ef5FUJQztWov8c4mVCnOUkrLwKt51rra5W0RxjtwCvWkqxKcSLhxnVR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4916405"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4916405"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 22:19:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="49225148"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 22:19:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 22:19:42 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 22:19:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 22:19:42 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 22:19:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+GuAPWOfCJ816m8LWmKuawLhPmV8rpUfT/Y58pvNkrNLOifuQ02gcxENrAZEOOpI6vKFaL2pPKULXtysw43c/NoEm21NJnIFBIIUtTOWc6SRDVglL1uuJoonzeNuj23k3Kl7kUtYeYsiP/5u+5kBJlTtGZPwZvliRIfnjtjH3rS4ByPixq7rFcAnssgto3UmlzB23Z1bXSxbiDCSJ/ijLmW5Dnidfobd+qOMVsQg+ygwqi5KmLOicbxe/wMiOZ+t9lMvEkKDKNGjYf8gRll9gPyVQvsOplWZXyhEj8AGO+RkhY1ZWokNHP69acRn8Ot5ulfCHNApo1zUJD1MAZKkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSbLDjihZUPu6W+82QwFF5YqWBt273CqaD7Mn4OUi2A=;
 b=QvSI3MzYoEqwpFrE7IqZuJ89zltMbh8kDDe4H2b1DkxPkKdvXSJlFGZ5El0tRgeFMt4MH+WrPB16r0R2KGEako3X4M3Y25bt0kfVGb5368Xkpxy3jXqpbBcbagv5oQgqLYVFCtzlQJ5iwh9NIng8SczoBs747QvHPKPINA209xhOvzOG+2zlyYMlH0x75e21GYCsylBBduO+wLdp+tsGxDdlSRu3I1wis3BEurbELvR4XnbXPWGwHgtVfaXwU7A65ioN5cmvTMHSKOvXYzo4I4EJgC9nBKLRx/BteLAocywvYuNZkdYmOulzy37SMHdoXTs5kRBS3oqULhX+s9jk+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by MW4PR11MB7164.namprd11.prod.outlook.com (2603:10b6:303:212::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Wed, 13 Mar
 2024 05:19:39 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::9d1d:68bd:1d3f:901]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::9d1d:68bd:1d3f:901%5]) with mapi id 15.20.7386.015; Wed, 13 Mar 2024
 05:19:39 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_compute_mode: Long running test
 for fix duration of time.
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_compute_mode: Long running
 test for fix duration of time.
Thread-Index: AQHac3+yJUhnjszdRkucwTO2xvnNOrE0TQmAgADXCKA=
Date: Wed, 13 Mar 2024 05:19:39 +0000
Message-ID: <BL3PR11MB57479055CE767B4E53E3C7F0D02A2@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20240311064426.4985-1-sai.gowtham.ch@intel.com>
 <20240312162621.46wilgnxqdc5cpfk@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240312162621.46wilgnxqdc5cpfk@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|MW4PR11MB7164:EE_
x-ms-office365-filtering-correlation-id: 7ed637dd-019b-447c-2928-08dc431d2ec1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rnSXPVZJvOpEQfTvLHVO7D7y+RNzZ1zeafZa7mEuuZEquOU08KORBTyIw9Mb3+QeKYoVblMtxAUv09NZhZTZuDpKjoSeAMV8plgHfB/Nu7LPQlgA5T1s+2d83j0pPH3YIVaiTQSbWg5rx8OsXqDTQlr35AzpgJx3vxzViTzOXk168B4KYyxzU5velKNosM7M4fPCsELRh/rjvm2xG7yi30ZPw+8g/EFjBWQ5GlaGV3RmbiteWEIFkGCoUaYhMXzm8b9USoanRKAxSQxX63Dw+ehuY70LhmoHIg3C0ibDoWtpkhJyGS1nLSjy9pgA5qswWIqcdOTf8OtT9x3fZzLloCMo3P4uL2lwccldXMD+3yzopDw8q2bE0hwYWjnAT8sEyNWA1OXM4lcguCr3ZuMnKAfaXVNRRTU/G9NUmV1OtXa1/1J2xC9nkFp7I23XUCYW+vz7VAKKwKfNXGeBRRl6BtszZl58gYHuTAfCoX+maHl2tWsGL6+NQu0b7roNTmKom5kfrE8wez03YMfnonELl/UMH802VRxRHWRQMbso9ww6V5gV33Inq3Q7FBXAcNKiR20dJtlNebggq7OLaKmJ21VQlhD1ncAVtL6fLQ0JdCakV3gDGwcT4aGQoBYSouIi4J14TF7SDvZbDjE8wtNkzjgNXFwhBZHCP1QDAZXMmmeGfbi2696FiQnBtSqPAVHAcmJ4yWpt8a40cBQQzTvMwUjLcypmRbQzg3MerVWjAGk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTlod2J5NndzQ3pseTZnem5Eamp5TzZWYkJXZEt6ZmQ5dW9kcFd6dFVxV2ly?=
 =?utf-8?B?VkJKT2J2NlY1WjhhNVZGcnNvQUl6Snl1bk5kRTNZVjBlU2Z1cklWQUViTWg0?=
 =?utf-8?B?MDZSdGVJMStvQWVINlI3NkRFTnlzWWpVRGxzUmxpQzgzNy9jZlpDUk94OFdt?=
 =?utf-8?B?TlVnOWxmNmVNRDVtVTZOQ0N5eDhqMkY1TzRuQUIxQUtZY0E4bzBGWHZZNVhx?=
 =?utf-8?B?N3FNT2lDeEVlWWpBSVFRaXJNTFMrWkNnc1ZMRU5zUW10bFZNUm02ckJOdUpQ?=
 =?utf-8?B?R1cyMG00bnRVdEJ1ang1dDN0UUtRNUJJZ1AwNDB4cEZERm1nSThpZERpajJO?=
 =?utf-8?B?S2QxV212NzhhUlhmdkpnd0NFeDhuUzBxbWxDWWtUeDhzRlpPeEptQTYzYlcz?=
 =?utf-8?B?S0NnUUQ1dk5mRzNoTDdNSUplN2lPeS9wZzVNei93UW16YWRBWHFGUWlQbzFG?=
 =?utf-8?B?Rm9DOWVhTlVZa0NUYkY0WkZqUzVmTlVEc2lTemVmbXhVTitQNXhSVDB1VUFX?=
 =?utf-8?B?bDltcUNmU1N0Y0ozajFqMWZiQ0oyeTE1STRKWWd0bTZOa0VYUmUxbDk3Vk4r?=
 =?utf-8?B?bEtXOVJOQTNhbGFuMGtDOUtnYktUbk0rL3p1MktNVWc0WWtQR0V2RVduanVa?=
 =?utf-8?B?OFFiTnlPNEt3b3ZBQmN6bkQ1UE9QRzFic3NHRGVUUTlrUE9SU3FkWFlvclJx?=
 =?utf-8?B?RmNMMkJBcmpjWEJrZTlFamxLQUlHRGFaVnJUdXFNVFNOb2szM0xML1QzZGNx?=
 =?utf-8?B?VGVVYWVZazdndU5VWVdLYk10Z1FWREhkNVRLdjdhSDBPVlgzRG9lVWZ4bG80?=
 =?utf-8?B?N01ELzFXMEZGcHpZY0d6SVBQL09iL3A2NXpzVkJUVzIzRStQdjMyd3RvT1RR?=
 =?utf-8?B?V3FVRVRkb3h2OWNZSjhSdUEzSXdzU01TRTdGaWpaWXRQY0t2cFFWNVlmNS9N?=
 =?utf-8?B?OVRKZXMxVksrOTdnRll0WXNPRGczZzU5cExtSWNDZ0Nnc2tvMmdtU3E4TGFW?=
 =?utf-8?B?anpySUhqYTl1RTBFSEFZZmZxWGJYeXNBYmhVZS9MZjhFUWhYSVAwejJFU2Fu?=
 =?utf-8?B?SldrbHg2bHNwaDBITVRPY3cyQ0lVbmF4RFc5bkExTHQrcmNPT2dQdzZlMTVN?=
 =?utf-8?B?YzlxWGZoV1ErQVhXYUllYnRRMDM1UThEeVlab0tEVFhWaWVMc2NLcGpQcnhV?=
 =?utf-8?B?VkVDbm1SdFRyZkNQNTgzcEY1YXgxUnVtYUxCSzVEMllQNnc3QlZ4RkkvbEtQ?=
 =?utf-8?B?TUtuN29jOEFKRzVUeTcreFBBOE1RUHF3YTNrZmJOOU40V0t5ZWs5SUFGYnBY?=
 =?utf-8?B?WENocThLZzdqVjlaT1VPNEloWGRsMUdQNnc5cWtrZGdXTmRhb3pwVzZYNFpw?=
 =?utf-8?B?SmR5NjlIQURFM1dHd1JxNG9qTzZuUHdrZEFGcHcwLzg3aVRUT2REdTZKOG5h?=
 =?utf-8?B?WG9HQy9JTDVUTk92V05PVkllR2ZxTnd1OFdYcng2SVVjVUp3MXRCNlphTHpY?=
 =?utf-8?B?YVhKZDFTaVUvbnp0bUxTV1d0cUlFRHNBZTRTYVhGbEdSTy9GQzNWQkMzb3lx?=
 =?utf-8?B?WXRUUytIdVpSSTF0bFhFajdQaGk3WG5wM3VISGNLamZNRTU3eTZoK0plUy8x?=
 =?utf-8?B?SXVNMEVZblViRzhxQmNVOS9ZdjBCRnJxL215KzBLbCs5WC81OGEyVW9sTjEy?=
 =?utf-8?B?bnNWR01kR1FWTDRIVENKRVdaZVAzUXZadzlDUThCVXJlN29DZUp2Q0U2YzBr?=
 =?utf-8?B?SjRVSGczeEJGblVpUVE2Q2ZSaVpJOGVOM0FPdVdRR3V5VjZjNElXQ1JHb205?=
 =?utf-8?B?WTFXaTR0TjdFQlFwaVgyeDRPbzJLZlFWU2dDZWNmZk8vc1YvVHJhYmxGSW03?=
 =?utf-8?B?WXpOYzVrV1hRRkVvUUwvNlBwQjFTNWxFNVBTOFpyeHZjNUE3OHQ3d3BuWFZ2?=
 =?utf-8?B?NTFzTzF1RnFyWWNiVk1pSU84Sm5XTXd5MWVZcUNHdWNJWTZzN09yN21aMjl6?=
 =?utf-8?B?Y0VtMWxUYkkrdkd2SjJ5SUJiSVA1RlJWaVpoQ2d0TktGVmZMRHFZcnNqelRH?=
 =?utf-8?B?NXpSeVliYkRpQklDUWxsOVIrazc0ODZGZDFwcXF5NjNRNVhFekxiTmtRYnZ2?=
 =?utf-8?Q?r68mPkQn63267AMkxuxRB7YZQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed637dd-019b-447c-2928-08dc431d2ec1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 05:19:39.7268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PZ2PNh1Mkr0cGMcA6ttPZnb+xyjT0qnjHnfbW0qTSsxRSlZoZWyBaSZwugDlUKM4oeZbitCb/2hw+cbaO6v5cmQdLJSQjFVNFaw16h48OQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7164
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEthbWlsIEtvbmllY3pueSA8
a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCj5TZW50OiBUdWVzZGF5LCBNYXJjaCAx
MiwgMjAyNCA5OjU2IFBNDQo+VG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Q2M6
IENoLCBTYWkgR293dGhhbSA8c2FpLmdvd3RoYW0uY2hAaW50ZWwuY29tPg0KPlN1YmplY3Q6IFJl
OiBbUEFUQ0ggaS1nLXRdIHRlc3RzL2ludGVsL3hlX2V4ZWNfY29tcHV0ZV9tb2RlOiBMb25nIHJ1
bm5pbmcgdGVzdA0KPmZvciBmaXggZHVyYXRpb24gb2YgdGltZS4NCj4NCj5IaSBpZ3QtZGV2LA0K
Pk9uIDIwMjQtMDMtMTEgYXQgMTI6MTQ6MjYgKzA1MzAsIHNhaS5nb3d0aGFtLmNoQGludGVsLmNv
bSB3cm90ZToNCj4+IEZyb206IFNhaSBHb3d0aGFtIENoIDxzYWkuZ293dGhhbS5jaEBpbnRlbC5j
b20+DQo+DQo+UGxlYXNlIHJlbW92ZSBkb3QgZnJvbSBlbmQgb2Ygc3ViamVjdDoNCj5bUEFUQ0gg
aS1nLXRdIHRlc3RzL2ludGVsL3hlX2V4ZWNfY29tcHV0ZV9tb2RlOiBMb25nIHJ1bm5pbmcgdGVz
dCBmb3IgZml4DQo+ZHVyYXRpb24gb2YgdGltZS4NCj4NCj5zL3RpbWVcLi90aW1lLw0KPg0KPj4N
Cj4+IFRlc3QgdG8gdmFsaWRhdGUgTFIgbW9kZSBmbGFnIGZvciBmaXhlZCBkdXJhdGlvbiBvZiB0
aW1lLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFNhaSBHb3d0aGFtIENoIDxzYWkuZ293dGhhbS5j
aEBpbnRlbC5jb20+DQo+PiAtLS0NCj4+ICB0ZXN0cy9pbnRlbC94ZV9leGVjX2NvbXB1dGVfbW9k
ZS5jIHwgNzUNCj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gIDEgZmlsZSBj
aGFuZ2VkLCA3NSBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVs
L3hlX2V4ZWNfY29tcHV0ZV9tb2RlLmMNCj4+IGIvdGVzdHMvaW50ZWwveGVfZXhlY19jb21wdXRl
X21vZGUuYw0KPj4gaW5kZXggN2RhZDcxNTA5Li4wMTg1MGQyYjcgMTAwNjQ0DQo+PiAtLS0gYS90
ZXN0cy9pbnRlbC94ZV9leGVjX2NvbXB1dGVfbW9kZS5jDQo+PiArKysgYi90ZXN0cy9pbnRlbC94
ZV9leGVjX2NvbXB1dGVfbW9kZS5jDQo+PiBAQCAtNDAwLDYgKzQwMCw3OCBAQCBzdGF0aWMgdm9p
ZCBub25fYmxvY2soaW50IGZkLCBpbnQgZXhwZWN0KQ0KPj4gIAl4ZV92bV9kZXN0cm95KGZkLCB2
bSk7DQo+PiAgfQ0KPj4NCj4+ICsjZGVmaW5lIERVUkFUSU9OX05TICgodW5zaWduZWQgaW50KTMw
MDAwKk5TRUNfUEVSX1NFQykNCj4tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gXl5eXl5eXl5eXl5e
Xg0KPldoeSBub3QgMzBVTEwgKiBOU0VDX1BFUl9TRUMNCj4NCj5BbHNvIG1heWJlIGNoYW5nZSBu
YW1lPyBXaGF0IGFib3V0Og0KPg0KPiNkZWZpbmUgRFVSQVRJT05fMzBfU0VDICgzMFVMTCAqIE5T
RUNfUEVSX1NFQykNCj4NCj5vciBqdXN0IG11bHRpcGx5IGF0IGFzc2lnbm1lbnQ/DQpXaWxsIG1h
a2UgdGhpcyBjaGFuZ2UsIHRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24gaXQgbG9va3MgYmV0dGVy
Lg0KPg0KPj4gKy8qKg0KPj4gKyAqIFNVQlRFU1Q6IGxyLXdpdGgtZHVyYXRpb24NCj4+ICsgKiBE
ZXNjcmlwdGlvbjogU3RyZXNzIExSIG1vZGUgd29ya2xvYWQgZm9yIDMwcy4NCj4+ICsgKiBUZXN0
IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QNCj4+ICsgKi8NCj4+ICtzdGF0aWMgdm9pZCBs
cl93aXRoX2R1cmF0aW9uKGludCBmZCkNCj4+ICt7DQo+PiArCXVpbnQ2NF90IGFkZHIgPSAweDFh
MDAwMDsNCj4+ICsJc3RydWN0IGRybV94ZV9zeW5jIHN5bmNbMV0gPSB7DQo+PiArCQl7LnR5cGUg
PSBEUk1fWEVfU1lOQ19UWVBFX1VTRVJfRkVOQ0UsDQo+PiArCQkgLmZsYWdzID0gRFJNX1hFX1NZ
TkNfRkxBR19TSUdOQUwsDQo+PiArCQkgLnRpbWVsaW5lX3ZhbHVlID0gVVNFUl9GRU5DRV9WQUxV
RX0sDQo+PiArCX07DQo+PiArCXN0cnVjdCBkcm1feGVfZXhlYyBleGVjID0gew0KPj4gKwkJLm51
bV9iYXRjaF9idWZmZXIgPSAxLA0KPj4gKwkJLm51bV9zeW5jcyA9IDEsDQo+PiArCQkuc3luY3Mg
PSB0b191c2VyX3BvaW50ZXIoJnN5bmMpLA0KPj4gKwl9Ow0KPj4gKwlzdHJ1Y3QgIHsNCj4+ICsJ
CXN0cnVjdCB4ZV9zcGluIHNwaW47DQo+PiArCQl1aW50NjRfdCB2bV9zeW5jOw0KPj4gKwkJdWlu
dDMyX3QgZGF0YTsNCj4+ICsJCXVpbnQ2NF90IGV4ZWNfc3luYzsNCj4+ICsJfSAqZGF0YTsNCj4+
ICsJc3RydWN0IHhlX3NwaW5fb3B0cyBzcGluX29wdHM7DQo+PiArCWNvbnN0IHVpbnQ2NF90IGR1
cmF0aW9uX25zID0gRFVSQVRJT05fTlM7DQo+PiArCXN0cnVjdCBkcm1feGVfZW5naW5lICplbmdp
bmU7DQo+PiArCXNpemVfdCBib19zaXplOw0KPj4gKwl1aW50MzJfdCB2bTsNCj4+ICsJdWludDMy
X3QgZXhlY19xdWV1ZTsNCj4+ICsJdWludDMyX3QgYm87DQo+PiArDQo+PiArCXZtID0geGVfdm1f
Y3JlYXRlKGZkLCBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTFJfTU9ERSwgMCk7DQo+PiArCWJvX3Np
emUgPSBzaXplb2YoKmRhdGEpOw0KPj4gKwlib19zaXplID0geGVfYmJfc2l6ZShmZCwgYm9fc2l6
ZSk7DQo+PiArDQo+PiArCWVuZ2luZSA9IHhlX2VuZ2luZShmZCwgMSk7DQo+PiArCWJvID0geGVf
Ym9fY3JlYXRlKGZkLCB2bSwgYm9fc2l6ZSwgdnJhbV9pZl9wb3NzaWJsZShmZCwNCj4+ICtlbmdp
bmUtPmluc3RhbmNlLmd0X2lkKSwgMCk7DQo+PiArDQo+PiArCWRhdGEgPSB4ZV9ib19tYXAoZmQs
IGJvLCBib19zaXplKTsNCj4+ICsJbWVtc2V0KGRhdGEsIDAsIGJvX3NpemUpOw0KPj4gKwlleGVj
X3F1ZXVlID0geGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIHZtLCAmZW5naW5lLT5pbnN0YW5jZSwg
MCk7DQo+PiArCXNwaW5fb3B0cy5hZGRyID0gYWRkciArIChjaGFyICopJmRhdGFbMF0uc3BpbiAt
IChjaGFyICopZGF0YTsNCj4+ICsNCj4+ICsJc3luY1swXS5hZGRyID0gdG9fdXNlcl9wb2ludGVy
KCZkYXRhWzBdLnZtX3N5bmMpOw0KPj4gKwl4ZV92bV9iaW5kX2FzeW5jKGZkLCB2bSwgZW5naW5l
LT5pbnN0YW5jZS5ndF9pZCwgYm8sIDAsDQo+PiArCQkJCXNwaW5fb3B0cy5hZGRyLCBib19zaXpl
LCBzeW5jLCAxKTsNCj4+ICsJeGVfd2FpdF91ZmVuY2UoZmQsICZkYXRhWzBdLnZtX3N5bmMsIFVT
RVJfRkVOQ0VfVkFMVUUsIDAsDQo+T05FX1NFQyk7DQo+PiArCWRhdGFbMF0udm1fc3luYyA9IDA7
DQo+PiArDQo+PiArCXNwaW5fb3B0cy5jdHhfdGlja3MgPSBkdXJhdGlvbl90b19jdHhfdGlja3Mo
ZmQsIDAsIGR1cmF0aW9uX25zKTsNCj4+ICsJeGVfc3Bpbl9pbml0KCZkYXRhWzBdLnNwaW4sICZz
cGluX29wdHMpOw0KPj4gKwlzeW5jWzBdLmFkZHIgPSBhZGRyICsgKGNoYXIgKikmZGF0YVswXS5l
eGVjX3N5bmMgLSAoY2hhciAqKWRhdGE7DQo+PiArCWV4ZWMuZXhlY19xdWV1ZV9pZCA9IGV4ZWNf
cXVldWU7DQo+PiArCWV4ZWMuYWRkcmVzcyA9IHNwaW5fb3B0cy5hZGRyOw0KPj4gKwl4ZV9leGVj
KGZkLCAmZXhlYyk7DQo+PiArCXhlX3NwaW5fd2FpdF9zdGFydGVkKCZkYXRhWzBdLnNwaW4pOw0K
Pj4gKw0KPj4gKwl4ZV9zcGluX2VuZCgmZGF0YVswXS5zcGluKTsNCj4+ICsJeGVfd2FpdF91ZmVu
Y2UoZmQsICZkYXRhWzBdLmV4ZWNfc3luYywgVVNFUl9GRU5DRV9WQUxVRSwgMCwNCj4+ICtPTkVf
U0VDKTsNCj4+ICsNCj4+ICsJc3luY1swXS5hZGRyID0gdG9fdXNlcl9wb2ludGVyKCZkYXRhWzBd
LnZtX3N5bmMpOw0KPj4gKwl4ZV92bV91bmJpbmRfYXN5bmMoZmQsIHZtLCAwLCAwLCBhZGRyLCBi
b19zaXplLCBzeW5jLCAxKTsNCj4+ICsJeGVfd2FpdF91ZmVuY2UoZmQsICZkYXRhWzBdLnZtX3N5
bmMsIFVTRVJfRkVOQ0VfVkFMVUUsIDAsDQo+T05FX1NFQyk7DQo+PiArCW11bm1hcChkYXRhLCBi
b19zaXplKTsNCj4+ICsJZ2VtX2Nsb3NlKGZkLCBibyk7DQo+PiArDQo+PiArCXhlX2V4ZWNfcXVl
dWVfZGVzdHJveShmZCwgZXhlY19xdWV1ZSk7DQo+PiArCXhlX3ZtX2Rlc3Ryb3koZmQsIHZtKTsN
Cj4+ICt9DQo+PiArDQo+PiAgaWd0X21haW4NCj4+ICB7DQo+PiAgCXN0cnVjdCBkcm1feGVfZW5n
aW5lX2NsYXNzX2luc3RhbmNlICpod2U7IEBAIC00NjAsNiArNTMyLDkgQEANCj4+IGlndF9tYWlu
DQo+PiAgCWlndF9zdWJ0ZXN0KCJub24tYmxvY2tpbmciKQ0KPj4gIAkJbm9uX2Jsb2NrKGZkLCBF
V09VTERCTE9DSyk7DQo+Pg0KPj4gKwlpZ3Rfc3VidGVzdCgibHItd2l0aC1kdXJhdGlvbiIpDQo+
PiArCQlscl93aXRoX2R1cmF0aW9uKGZkKTsNCj4+ICsNCj4NCj5Ib3cgYXJlIHlvdSB2ZXJpZmlu
ZyBpdCB0b29rIDMwc2Vjb25kcyB0byBydW4/DQo+QWxzbywgaG93IGFyZSB5b3UgdmVyaWZpbmcg
dGhhdCBpdCB3YXMgcnVubmluZyBkdXJpbmcgdGhhdCBwZXJpb2Q/DQo+DQpXZSBoYXZlIGEgY29u
ZGl0aW9uYWwgYmF0Y2ggYnVmZmVyIGluIHhlX3NwaW5faW50aSBjb2RlIHdoaWNoIGl0IGJyZWFr
cyB0aGUgbG9vcCBvbmNlIHRpbWVfZWxhcHNlZCBleGNlZWRzIG1vcmUgdGhhdCBjdHhfdGlja3Mu
IA0KDQpJdCBzaG91bGQgYmUgaGFuZGxlZCBmcm9tIHRoZSB4ZV9zcGluX2luaXQgaXRzZWxmLiAN
Cg0KVGhhbmtzLA0KR293dGhhbQ0KPlJlZ2FyZHMsDQo+S2FtaWwNCj4NCj4+DQo+PiAgCWlndF9m
aXh0dXJlDQo+PiAgCQlkcm1fY2xvc2VfZHJpdmVyKGZkKTsNCj4+IC0tDQo+PiAyLjM5LjENCj4+
DQo=
