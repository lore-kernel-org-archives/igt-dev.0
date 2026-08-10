Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB737C5AD4E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Aug 2026 06:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CA210E168;
	Mon, 10 Aug 2026 06:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lyrjzcgi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8338210E168
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Aug 2026 06:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786344986; x=1817880986;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yrps/Ne5vdbo3JBipWYZIYgZPnJJVmxq/cDZusV/UjE=;
 b=LyrjzcgirBIbTyZ8bx0Dmm55CXrIc+mR26kpG8oAONhsQljBizbo3m65
 1/KFlx1hyixFpJn6w0n/h7A+m/ECu2CKFNPrJ5jjwGHvpOewxKzY7arhQ
 tLJ43UHdKdhgrcM4Ff9RfwTS7n1Li4v+lWDoAaojfg93XGHDHmuVp5oiv
 WOReYh32sf6IyNjhutLNrvQy4DBueLYv/5E6CI/KzbjVcQy41zWESlJ9a
 +Yl0P5F5DrZyyRuOr8uBblzUscS9ClJcRPlX81qBoDy8dDuDuCRHgws0d
 iI6Pxg+/DQ8RA+IfyWpFPt+qAUkqiIgJq/L46mh4TPN4gioSYtR9GL+d6 w==;
X-CSE-ConnectionGUID: ZNAW0QukQPGE6zNZYays0Q==
X-CSE-MsgGUID: 4jA7VdABSlqhp7eZW6mC+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="104382203"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="104382203"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2026 23:56:25 -0700
X-CSE-ConnectionGUID: QTN3KTloTjqUaihQoTuRkQ==
X-CSE-MsgGUID: 0iN3Ph5kQtu3U2i6YDuU7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="261217304"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2026 23:56:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 9 Aug 2026 23:56:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 9 Aug 2026 23:56:24 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 9 Aug 2026 23:56:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHg0/ATJK0MsYqLFHxl8pQ0EmnFpLReU3AlTVNFqn+mqxckkhDH9QSP2WzKwSmHgc1f/08Ip8I6D7Zi3OTc9EpzDCE2wY1E/2MX+B5Os6oY8ECGEWd8BrGvAMEj8H5k27kjSigvjDXVpYl9Fsm0pzkudgvAgbjzjDNB6ItdBVhizYFRkN72m4qPVvTwYKt8lCfW6sIvdLViZanv3f00c2ZiBFQ2l0DQv4zf7kyjNui2ryqSBwYBHq09X3xIwaAxlKgQCWMnx69Ov82F+5hwP0FhTsBZnE+//FY35ZoIXXoz3vTzsDYhgkk6PNj8scSdw4jbRfV6P71Qp8Jx8meqRJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrps/Ne5vdbo3JBipWYZIYgZPnJJVmxq/cDZusV/UjE=;
 b=sNtgq8BW6wCyw76xQvHxr3iE7R2TWLrSGVc9ZDIn5V797JYIlzthWN9rTJed9eZpqhvSh7a2omMQx2Oop/vfXi8QZq1Kxwoyl8klBG7tTZRlM9OuZaaxVr1Ef3KZfx0qkI57lKSzWGoHU8gqRtSUQMiDmz0IcX/1PKwNCw07qvh6yDLJ+RH+ZDJFel147Pka1at02YYbGcxvLGmBIjmbeGA39riycRHrs42+TKb5Kuy8pRLx0e+IQZdOm1LjlNmWKMF1f6WbYh4t29zJXNIvhUuXBGTyqv2x7Lc/4x2avOJjTglhmb2ZrltqDtJH3mu21KoyJ67RmYwP51dBcUjPTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by DS7PR11MB8828.namprd11.prod.outlook.com (2603:10b6:8:257::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:56:21 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 06:56:21 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v3 2/3] tests/intel/kms_dp_linktrain_fallback: fix
 MST traversal state leak between subtests
Thread-Topic: [PATCH i-g-t v3 2/3] tests/intel/kms_dp_linktrain_fallback: fix
 MST traversal state leak between subtests
Thread-Index: AQHdJLavWNWWvlDHnkSYuVEA3XyA2raWvvUAgAAOUgA=
Date: Mon, 10 Aug 2026 06:56:20 +0000
Message-ID: <PH7PR11MB679609244CA68E54472BD873E5DE2@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260805084428.708501-1-sowmiya.s@intel.com>
 <20260805084428.708501-3-sowmiya.s@intel.com>
 <be0235fb-43d0-4d2d-84a1-d92c0ed94015@intel.com>
In-Reply-To: <be0235fb-43d0-4d2d-84a1-d92c0ed94015@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|DS7PR11MB8828:EE_
x-ms-office365-filtering-correlation-id: 7f54740a-e44b-4412-5bc9-08def6ac7c16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|10070799003|22082099003|18002099003|11063799006|5023799004|56012099006|3023799007|38070700021|4143699003|10067099003;
x-microsoft-antispam-message-info: 9CwVDnNps8zrWHXV4GbiIuKqIyQXckDRA9qmEZVIx7adbxbSQIO0tOazgJsDzH8rnBDS/PultEpMzoV5GnTt/kwB/2zSIKBQe5Ajzs7Fezg+mhFvRcuOxrnix52fVMrxdPcYWY/fQoxuEe+TE3MQQ78+C9lIQM5RHOFn2P04veGHofvS9vWkPXAf1LZMUsGgeCsD6Mwsh1tw2/SULL7SF+lLjNgrXmqRdcJYbT43s//3Yi43/NSGo12L4PI6tSyX8g5OICDJDA9S3V35XC1kvjAlI54QTn1i0avSEEo9ZMvmAGzLnvY0RQfQ11DVE0EybpBwJUBl8nJs6ihI04n4kdKK4uKb6cZZxDAuEMEHBSAd7ohHIAMpr94CzAy+EOhTGm5SvFEKtQK9/4SmxeJ0ljXhgSFp1p3fBN3Mh3q1LaaMKKRCctC5EmlPSyG8NiEqwdX8Z17KrOQIrS/xlBbEtszI+OmxfILWEqKaQUJWntFYfTCT+p8yMVOEKwK5eH1YEOm+B2ETss54ALbrxO4cY/+nzCo3kTBld2UBX1E0VQRfAMWz50QRqs1iahXGeC1AoLXcsDQXQDzDgFyTCUdu4k040MHhAcPG3oy6Dy6eIGOZp/2lZVgvLwkSLf26lO0i0Vu2uAqzfdjr1mK1y6lDVJzDp7CiETP4k3a6hlMGERhKccCrqXsPrnsMqBSLnyrvrgcn7r3TbpYGNZgz3jUIZmIp9y+Jkcr2CFF5KsZdrSM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10070799003)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006)(3023799007)(38070700021)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHZwTDF5QXV5MFRnUDFDNG5oLytPNFNucXF1MXA0SEEreVNOQ1dramFjM3Bt?=
 =?utf-8?B?dXVZTVJWYkI3VWdoSEFteE1SbWY5VXNDdlp0KzR0QWNnaHVKUzJla2V1SHg1?=
 =?utf-8?B?QVdJcUExMm85WFJhUW5HZW96bC95akVFMUJtUkNkNmxZaHh5Q0pqVEl3NFJ5?=
 =?utf-8?B?eWVGci9UQjhwYUxOL3ZuN1c1TVZxazFra0QzcVBRRS9wUFdqYVRrSUJPazgr?=
 =?utf-8?B?dzFiaHdjU01Pa0RTWEhyWkpoQWtsRWdjdENlb3BIMm90c2M5SDNXd2VZZDgv?=
 =?utf-8?B?NDRYQVNkRy9kUmJ1djhhbnFRMkhnMCtKK1lPbkVwMUFjNVl6WHE5d3JPSEZL?=
 =?utf-8?B?QlFQQ2FmUTZvSEZmdmVwbjUwb1p4cW9QYjFMV0lWZUY0cGd6RWx4eFNxL1Fs?=
 =?utf-8?B?VmtwR3dibGVTemdod21MbTRwZUxwSjExOUwrRHFrZ2U3Y2NiTlAvK09HRWxV?=
 =?utf-8?B?Y3JFc05ybjVXZWxGUVV3cGxJQTc5bDFBWEhtOEZWYm1DbjJRYmExbi9qVUtP?=
 =?utf-8?B?TU1hVHRLSlFNdUVXK1kzMCtYQTFXM0VIdEk2VHAydDZsbGhZdFpaVEo1UDZR?=
 =?utf-8?B?RlFTcFRJbFBvTlBoM0ZOSE9kV0FKdmhJZmYzd3BWa2NwY2lsUGVxY1paZWdD?=
 =?utf-8?B?bUlsNUtFMjgrRXlIWG1kNk9NaWR2d0dLVmpoMzQ5WFZMM2xNUXgyaWp4eXRC?=
 =?utf-8?B?YVVXQVZYSHFJNkhvbG1HQmMrdlpUZnlzeVp2bEM4TlJremFVZW9aQ3RkZE5a?=
 =?utf-8?B?WGs5WlgxdlN3UkFsWkh1WVFZcEpudDFPSUlQNnkyQzRnVW55cXB1TmM4Z1Vk?=
 =?utf-8?B?TnNXcll6S1dENHFNZkV4SzFDdERILzZ4Wk8xQ05wMFJTSThxVncveXROZDdi?=
 =?utf-8?B?OXROVWNiY3g0YmxTNUlnT3RUdXo2NGQrY0NDUWFTeHhVWG9CRWM2S3ZXcHF4?=
 =?utf-8?B?aFMvbW0yWFpBSDl1MFJlWHBhOHRsZ2M4K0VudzZNSW1TM1lKRmV0cHdpMk42?=
 =?utf-8?B?QVVMZmE4WFVJUXRINi83ZGUyTExaS3FqaElOV2RJRGtiSEhwNGNMQmtmS3po?=
 =?utf-8?B?ZnJoWUdySnhIb0lFM2RINHM0YjNqTEI2b0JZYjZsZXZtUWJxY1FmdzdqUG5k?=
 =?utf-8?B?QnFzdys1ZklBZHdUTnpGN3QxTVFrMS9TS29OWWFEanNNd1ZyQWRoMC9NWU9O?=
 =?utf-8?B?MjY2VDhqeUhDRVN0MklzRXR1L000VSs2dVY3ZDZwYy8xUTlKd09wS1BwRndv?=
 =?utf-8?B?RHlVLzN2ZkkvTFZpUWlnN0tmMWY3bDROcWpZdlVISnFOWGJiUW1DbjNlNElX?=
 =?utf-8?B?RzZrTVdsUitFTW9BK2h4bjJtUmxNVFdObDlqM3FUMXBjZEx4cVRZMmNQUDQy?=
 =?utf-8?B?SzRRbDFpdDVSV0xkeC9nOG5QQzZsVTFXSDk0RXZTR1dqcE9VdGNLYUx6MVpz?=
 =?utf-8?B?ejJubkt0NUhqTG9ObERjRXMxcmtQZ3MrVXMvUWZLZDI4WWpoVkpsNlNXRS81?=
 =?utf-8?B?eUQ5dG43UDBQYnNONC9IRitLUjk0KzFvRjg4SzJOL3NRWVVqZWpEeWdBTUdR?=
 =?utf-8?B?UXZuUXZRZVV4SjJFbENyQmJaaFJjTHdwTnpVYWYwd1o3Z0ZQZ3V2bm5OYWV4?=
 =?utf-8?B?WG9ZRVp0Y3BqOG1uWnlzVDArZGRqNXRmM1cwRUhOcVE5VVlya05ZSExWRmE1?=
 =?utf-8?B?Z2JpcnBmWFFZOUxRRXBNVEMzZXN2VHJYeHhHZ0VSN05QdWF5NFYyUHJZZ1Rh?=
 =?utf-8?B?U0FFaEhkc0ZoVHZUTmlsRUcvZXVwNHRoODNmOWx3Ryt5SDBEQlNTcWVYS1Bu?=
 =?utf-8?B?SHE5eUZjOU1VMDNFMlFldFUvbjh0VCt3WDBBZGdtNkpBQzYweExHbmhTcXpJ?=
 =?utf-8?B?My9jaUVDcy8zM3FiR3QwcW5oUzhrdFZVVEc3WXVmdTJ3QlEzaHJRS2h6Nmda?=
 =?utf-8?B?bWdrZVdpRmcySUNuNk5pWUo4M1RlMUpFUWJlS01ZUlpUd1JzY0J3MGpMU1Bp?=
 =?utf-8?B?WlZiNXRLdXNVYWlQWTY5WGEvZ2R0clV2VVRyMG1IbDB0VUFIKzcxM2l6ekND?=
 =?utf-8?B?MjkxVmJnYnJEa09EdnBHNk8xOEJaNVdZckFPaVF6MkJkWnFRbmdGUTV4OE00?=
 =?utf-8?B?VWorcEw4REY5dU1OMDZQeHhTTkxFUjR4RG1TODltTndmUkZxandFQ3NTbDg3?=
 =?utf-8?B?ZjI1MkRrRTRqMUlXdUtKSmpPRTczUE9YYjFGUnNHdjZZdTZVc0piS0xQdnND?=
 =?utf-8?B?cEdpYWs4RXFid3hFV3hxSUVPYmNSa0JwNkJ1YnRQbFNoUmRIbjhVZk9YalV5?=
 =?utf-8?B?NlB5OE91TlZaV0p1b0MyZ25ObXJtNEl0VSthUlBOY0lZbHZvYmQxakVURWN6?=
 =?utf-8?Q?88/V5KtIY2QQX8BOB71jO0zbFVC13fVsLjqWR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AXE71p+Soe9cezk+PYl0YsRJZtbQhSC2xTLHELq06gwpAXf2LxKKtmtaLpILd/HhvebvNUxx81L5RrY/8+HIBQMXjoq0nXgGFbiRayTKpwVqpCkY3kcDITYpex7Iil4jMRLO67lohYKukERcTJC4bXKCR95FoEJOhbG4V2hGkGmgMSJtNmNgAa///+Xe4yNrM4D+eq9krJXop5deNVT3ANuiJc4fb7pmnahqqXYwhIMLH/diw4vJd+OkI4kHHmPRyoa1+fjwP6+H4npiMvfSvPmX4COWclYpTk25n7L8gWVQf7AWXFwMH1cexuzCFf2ojzTDWIUo7QdMspxqivW+cw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f54740a-e44b-4412-5bc9-08def6ac7c16
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2026 06:56:20.9706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZuEFjkR0hvFVLfIEfGSNJXs6YWVL0JeH1KmN+TNfa/8qmMYqQ8bOnN+p8HjITmBkPURT1pmhGOdvixThrNVBGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8828
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

SGkgS3VuYWwsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9zaGks
IEt1bmFsMSA8a3VuYWwxLmpvc2hpQGludGVsLmNvbT4NCj4gU2VudDogMTAgQXVndXN0IDIwMjYg
MTA6MjQNCj4gVG86IFMsIFNvd21peWEgPHNvd21peWEuc0BpbnRlbC5jb20+OyBpZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogQiBTLCBLYXJ0aGlrIDxrYXJ0aGlrLmIuc0BpbnRl
bC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggaS1nLXQgdjMgMi8zXSB0ZXN0cy9pbnRlbC9r
bXNfZHBfbGlua3RyYWluX2ZhbGxiYWNrOiBmaXggTVNUDQo+IHRyYXZlcnNhbCBzdGF0ZSBsZWFr
IGJldHdlZW4gc3VidGVzdHMNCj4gDQo+IEhlbGxvIFNvd21peWEsDQo+IA0KPiBPbiAwNS0wOC0y
MDI2IDE0OjE0LCBTb3dtaXlhIFMgd3JvdGU6DQo+ID4gdHJhdmVyc2VkX21zdF9vdXRwdXRfY291
bnQgaXMgZmlsZS1zdGF0aWMgYW5kIHdhcyBuZXZlciByZXNldCBiZXR3ZWVuDQo+ID4gc3VidGVz
dHMuIEluIGEgZnVsbC1iaW5hcnkgcnVuIHRoZSBjb3VudCBmcm9tIGRwLWZhbGxiYWNrIGNhdXNl
cw0KPiA+IHNldHVwX21zdF9vdXRwdXRzKCkgdG8gc2tpcCBhbGwgTVNUIG91dHB1dHMgaW4gc3Vi
c2VxdWVudCBzdWJ0ZXN0cy4NCj4gPg0KPiA+IFJlc2V0IGl0IGF0IHRoZSB0b3Agb2YgcnVuX2x0
X2ZhbGxiYWNrX3Rlc3QoKS4gVGhlIERTQyBwYXRoIG5ldmVyDQo+ID4gcmVhY2hlcyBzZXR1cF9t
c3Rfb3V0cHV0cygpIHNvIHJ1bl9kc2Nfc3N0X2ZhbGxhYmFja190ZXN0KCkgZG9lcyBub3QNCj4g
PiBuZWVkIHRoZSByZXNldC4NCj4gSW4gdGhlIHRyZWUgdGhpcyBwYXRjaCBhcHBsaWVzIHRvIHRo
ZXJlIGFyZSBleGFjdGx5IHR3byBzdWJ0ZXN0cywgZHAtZmFsbGJhY2sgYW5kDQo+IGRzYy1mYWxs
YmFjay4gc2V0dXBfbXN0X291dHB1dHMoKSBpcyBvbmx5IHJlYWNoYWJsZSBmcm9tIHNldHVwX291
dHB1dHMoKQ0KPiAodGVzdHMvaW50ZWwva21zX2RwX2xpbmt0cmFpbl9mYWxsYmFjay5jOjE4NCks
IHNldHVwX291dHB1dHMoKSBpcyBvbmx5IGNhbGxlZA0KPiBmcm9tIHRlc3RfZmFsbGJhY2soKSAo
OjM2NSksIGFuZCB0ZXN0X2ZhbGxiYWNrKCkgaXMgb25seSBjYWxsZWQgZnJvbQ0KPiBydW5fbHRf
ZmFsbGJhY2tfdGVzdCgpLiBTbyBydW5fbHRfZmFsbGJhY2tfdGVzdCgpIGlzIHRoZSBvbmx5IHBh
dGggdGhhdCBldmVyDQo+IHRvdWNoZXMgdHJhdmVyc2VkX21zdF9vdXRwdXRfY291bnQsIGFuZCBp
Z3RfbWFpbigpIGNhbGxzIGl0IGV4YWN0bHkgb25jZS4gVGhlDQo+IGNvdW50ZXIgc3RhcnRzIGF0
IDAgKGZpbGUtc3RhdGljKSwgYW5kIGFzIHlvdSBzYXkgeW91cnNlbGYgaW4gdGhlIG5leHQgcGFy
YWdyYXBoIHRoZQ0KPiBEU0MgcGF0aCBuZXZlciByZWFjaGVzIHNldHVwX21zdF9vdXRwdXRzKCku
DQo+IA0KPiBTbyAidGhlIGNvdW50IGZyb20gZHAtZmFsbGJhY2sgY2F1c2VzIHNldHVwX21zdF9v
dXRwdXRzKCkgdG8gc2tpcCBhbGwgTVNUDQo+IG91dHB1dHMgaW4gc3Vic2VxdWVudCBzdWJ0ZXN0
cyIgZGVzY3JpYmVzIHNvbWV0aGluZyB0aGF0IGNhbm5vdCBoYXBwZW4sIGFuZA0KPiB0aGlzIHBh
dGNoIGlzIGEgbm8tb3Agc3RhbmRhbG9uZS4gSXQgb25seSBiZWNvbWVzIGxpdmUgaW4gMy8zLCB3
aGVyZQ0KPiBydW5fbHRfZmFsbGJhY2tfdGVzdCgpIGFjcXVpcmVzIGEgc2Vjb25kIGNhbGxlci4N
Cj4gDQo+IFRoYXQgaXMgZmluZSBmb3IgYSBwcmVwIHBhdGNoIC0gcGxlYXNlIGp1c3Qgc2F5IHNv
Og0KPiANCj4gIMKgIMKgIMKgIMKgIHJ1bl9sdF9mYWxsYmFja190ZXN0KCkgdHJhY2tzIHdoaWNo
IE1TVCBvdXRwdXRzIGl0IGhhcyBhbHJlYWR5DQo+ICDCoCDCoCDCoCDCoCB0cmF2ZXJzZWQgaW4g
YSBmaWxlLXN0YXRpYyBjb3VudGVyIHRoYXQgaXMgbmV2ZXIgY2xlYXJlZC4gVG9kYXkgaXQNCj4g
IMKgIMKgIMKgIMKgIGhhcyBhIHNpbmdsZSBjYWxsZXIgc28gdGhlIGNvdW50ZXIgaXMgaW1wbGlj
aXRseSB6ZXJvLCBidXQgYSBzZWNvbmQNCj4gIMKgIMKgIMKgIMKgIGNhbGxlciB3b3VsZCBzaWxl
bnRseSBpbmhlcml0IHRoZSBmaXJzdCBydW4ncyBzdGF0ZSBhbmQgc2tpcCBldmVyeQ0KPiAgwqAg
wqAgwqAgwqAgTVNUIHNpYmxpbmcgYXMgImFscmVhZHkgdmlzaXRlZCIuDQo+IA0KPiAgwqAgwqAg
wqAgwqAgUmVzZXQgdGhlIGNvdW50ZXIgb24gZW50cnkgc28gdGhlIGZ1bmN0aW9uIGlzIHNhZmUg
dG8gY2FsbCBtb3JlIHRoYW4NCj4gIMKgIMKgIMKgIMKgIG9uY2UgcGVyIGJpbmFyeS4gVGhlIERT
QyBwYXRoIG5ldmVyIHJlYWNoZXMgc2V0dXBfbXN0X291dHB1dHMoKSwgc28NCj4gIMKgIMKgIMKg
IMKgIHJ1bl9kc2Nfc3N0X2ZhbGxhYmFja190ZXN0KCkgZG9lcyBub3QgbmVlZCB0aGUgc2FtZSB0
cmVhdG1lbnQuDQo+IA0KPiANCj4gVGhhbmtzIGFuZCBSZWdhcmRzDQo+IEt1bmFsIEpvc2hpDQo+
IA0KDQpJIHdpbGwgY29ycmVjdCB0aGUgY29tbWl0IG1lc3NhZ2UgYXMgdGhpcyBpcyBhIG5vLW9w
IHdpdGhvdXQgMy8zIHBhdGNoLg0KUmVnYXJkcywNClNvd21peWEuDQoNCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFNvd21peWEgUyA8c293bWl5YS5zQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAg
IHRlc3RzL2ludGVsL2ttc19kcF9saW5rdHJhaW5fZmFsbGJhY2suYyB8IDcgKysrKysrKw0KPiA+
ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L3Rlc3RzL2ludGVsL2ttc19kcF9saW5rdHJhaW5fZmFsbGJhY2suYw0KPiBiL3Rlc3RzL2ludGVs
L2ttc19kcF9saW5rdHJhaW5fZmFsbGJhY2suYw0KPiA+IGluZGV4IDExNTE4M2QyZC4uNDRiODc1
YWI5IDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL2ttc19kcF9saW5rdHJhaW5fZmFsbGJh
Y2suYw0KPiA+ICsrKyBiL3Rlc3RzL2ludGVsL2ttc19kcF9saW5rdHJhaW5fZmFsbGJhY2suYw0K
PiA+IEBAIC00MzEsNiArNDMxLDEzIEBAIHN0YXRpYyBib29sIHJ1bl9sdF9mYWxsYmFja190ZXN0
KGRhdGFfdCAqZGF0YSkNCj4gPiAgIAlib29sIHJhbiA9IGZhbHNlOw0KPiA+ICAgCWlndF9vdXRw
dXRfdCAqb3V0cHV0Ow0KPiA+DQo+ID4gKwkvKg0KPiA+ICsJICogUmVzZXQgcGVyIGludm9jYXRp
b24gc28gTVNUIHRyYXZlcnNhbCBzdGF0ZSBmcm9tIGEgcHJldmlvdXMgc3VidGVzdA0KPiA+ICsJ
ICogKGUuZy4gZHAtZmFsbGJhY2sgZm9sbG93ZWQgYnkgZHNjLWZhbGxiYWNrKSBkb2Vzbid0IGxl
YWsgYW5kIGNhdXNlDQo+ID4gKwkgKiBNU1Qgc2libGluZ3MgdG8gYmUgc2lsZW50bHkgc2tpcHBl
ZCBhcyAiYWxyZWFkeSB2aXNpdGVkIi4NCj4gPiArCSAqLw0KPiA+ICsJdHJhdmVyc2VkX21zdF9v
dXRwdXRfY291bnQgPSAwOw0KPiA+ICsNCj4gPiAgIAlmb3JfZWFjaF9jb25uZWN0ZWRfb3V0cHV0
KCZkYXRhLT5kaXNwbGF5LCBvdXRwdXQpIHsNCj4gPiAgIAkJZGF0YS0+b3V0cHV0ID0gb3V0cHV0
Ow0KPiA+DQo=
