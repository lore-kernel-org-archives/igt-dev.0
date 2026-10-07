Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60001CA6002
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 18:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA31010E474;
	Wed,  7 Oct 2026 18:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R/PqnApp";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012020.outbound.protection.outlook.com [52.101.48.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E50D10E474
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 18:45:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlFeIdnYQ+fugFpLiMj4XD/L5GzjNBoZs5K14zlWpBwKU3gk+v0kAWHvrvoEyJezsjUtE3ft0Z2aioCkcUDVhoSm0Cn0UkgCThjpSp2ZUBYKViymI9NXs6WZ4MRy0/3Q3roS+tzLfpuiJuJsqQf1sfb/im7jICVSV3oPWsNUJR2xVaNgVvxPI9NAtMX2ABUflM1vNxC9MxZGIIpF57C8c336P3nQbXQ/bZ37FRY4dTMW5TIQ+i8byQTwgGiZ8NM560kacBFIJ0s6YqiJ3ARcyArn7x24gLs1kXGoTIaMlO+tbl60ZuT3uhB/61TZ0TjzgkrXKOfligSHwRyq/8HpSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fh+FivT8eh/jXnsDyuCYKQSVowVIKeqoJASHJr0gqQ0=;
 b=QWbM48o6TBBvv4PujCSJ9mrrk0sjn8+hvBPRR9numc742ClNwWV6L7K69dN1I0NHBLokTTgot9yBbGafB8KiIyOYPqF+LXy3gRw0P7jtlzG8gOjHDOJOMvrBQENVby05xul6LKkHd7i+XVorZdxObTh4EkKWc9uVM9iW7Zi9tB+nVucZbzUzBnYdOm4xG2WMrsjtEfNyiG2ZK2Mr2eWvDN4hnRuXQ73t52BsUBLlMawUt8sg7RiAOgljckk3w7gdJDlzOk9Eia4Ld9l0SO04nIYtSJmWfUEqH7LmkaxvNa4EbOYB0mU1VFGRcI+Qouk+HOnFHf7J0G7OJf8yjESrpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fh+FivT8eh/jXnsDyuCYKQSVowVIKeqoJASHJr0gqQ0=;
 b=R/PqnAppObSdR7hHZ1MYR1IBTX0py3KkmSjCJK680CSZYwswO6hz7JJeFDVQhoCyuGUopB4Bf2ToIUOX0S5x08XEj7C1ipQvCKI8ZujTBfzLnx6rgKf0JpqI8JeCJG41fKtRpyndnpYy8ZoTWjYt1h4vkclScyXuyCpow2RXxP0=
Received: from DSVPR12MB449095.namprd12.prod.outlook.com (2603:10b6:8:4fe::22)
 by SA1PR12MB8966.namprd12.prod.outlook.com (2603:10b6:806:385::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 7 Oct
 2026 18:45:38 +0000
Received: from DSVPR12MB449095.namprd12.prod.outlook.com
 ([fe80::76a6:7a4f:a0a5:18c0]) by DSVPR12MB449095.namprd12.prod.outlook.com
 ([fe80::76a6:7a4f:a0a5:18c0%4]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 18:45:36 +0000
From: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, Bernd Kuhls <bernd@kuhls.net>
Subject: RE: [PATCH i-g-t] lib/igt_platform_filter: Fix musl build
Thread-Topic: [PATCH i-g-t] lib/igt_platform_filter: Fix musl build
Thread-Index: AQHdVnYrbIxqr+BxME+sJokeZDx577byatyA
Date: Wed, 7 Oct 2026 18:45:36 +0000
Message-ID: <DSVPR12MB44909567DEB8B6338C7FE7A16581942@DSVPR12MB449095.namprd12.prod.outlook.com>
References: <20261007160847.169029-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20261007160847.169029-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-10-07T18:44:32.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DSVPR12MB449095:EE_|SA1PR12MB8966:EE_
x-ms-office365-filtering-correlation-id: 673da7b4-9529-43ca-1d3c-08df24a32d25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|11063799006|56012099006|38070700021|10067099003|3023799007|22082099003|6133799003|18002099003;
x-microsoft-antispam-message-info: LuWh2mQ7jHFdxx5J7MvnG4O4r52WDEeLqgUN1ZMzknNfBhMMILx4zgMnlUWdueFvK1Q2IseF6Kzhpfa0Lu9GkOQjhO3a0AUMHZsbvWxmM7cpRg1o8zy8DTjpNB3MxxlYNrPhP61N7y3KlTXHw447nKYeMVU4Qcaf6kZWREy6QZY9KXpvjA68rz0nbijSQJKzh4Wmd4Co/uPT90vosiwi6eEEcKfkhl/XGhueUbKER9T/VsyGL+WVBureXlCYqG/lQtqZZEtOEt6p0Q+Xy7mr+4nwOu8CPK4gj+1nKQ7f5ZZ7DBvlb4RXeDt59UZ5xue+IeREmOFRBbxfOx/O/kS2xbnpjpOLr5LalRHTzM3U3pWWdxjoPChyH6zbx0tFmeX0RRBqz7Re1zqOhEpd53uaPJx9/A4+xTNVsydMYTmm/6VMwdURolPDH1/Wi1SXn3j2FzI7IUBhqv/Otms2ijesh+he9qisenfmLN3nmXe2S6OTXjl8PKm2JmxMjV1AYFq7vS0DV/6+KI9eBeJbXc8p92XlRWDNdbcOkO9/umQDuvCE2Xic6jpxOCHoqVHn1bahU4t1TJAfT9+iKXS2h1dGeiqgP+Ke+3HWvE8pCUqVVPBXJmYJuBen+IyvTNAl7llCLZzsVndmdiS9ZdZxluwhpdJjH+tFMOHx4vzqe4l/gGQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DSVPR12MB449095.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(56012099006)(38070700021)(10067099003)(3023799007)(22082099003)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTR6M2l3c2pYUmFkQkhHYys4LysrNm9zYk41KzFGcVRGZjFJQmRsWVNiQ0Js?=
 =?utf-8?B?UTBVVVE1TmduV3RzRlQrSkpvOGZjaWh3RjRMbjBKVFhCNWdISlBMV1hsWDRt?=
 =?utf-8?B?dER0cU11QXA3cVFQdysyOEN1TFZmemhUZDBwOHF4bDB1b3IwNldGMUc4TFph?=
 =?utf-8?B?Q212cGNhMzdNaXB2QVhCWG1mZWZzdURFOHE4b1ZvRm45djg2dE55RkVsOEV5?=
 =?utf-8?B?U2lsbFZnc2NNcHpqdkVzUi95TjdqN01JYk1aTTkzcER6elByL1FobjZLUXZh?=
 =?utf-8?B?WXl3WURVU2FQbDZKa1lRbjdKeUFSNnJYRTFqYUZCUXR3cUlIWUNBSWhreWVE?=
 =?utf-8?B?cFRNYm45M3lqZ2czd1NLRTF5SzBCZmNkc2NqNmpid01jVlpHUVBaVjJSblc4?=
 =?utf-8?B?MmdwNUk5ZkM4ZEZ4Y2MzQjdJNlhuT1RFZTFTblI1MDFGMk55eTJiMmpDalVu?=
 =?utf-8?B?NXlZQTF0ZVhTTVlsN2NJOGdEV0NiTkd0RnVCb0VQOU5RMjQ3YTJ5Si9SR1F5?=
 =?utf-8?B?ZG1yUE53RFdMVjJXY0JBUzFVY0U3NE1rVUJ4R29lQ1lkMlpOdTNWcDlzUzN5?=
 =?utf-8?B?bHRkVHFVVnUxNWpWVHBaaiswZ3pjOVZ3OE03WHhDS1pHV1NlQkg3THYyVG5l?=
 =?utf-8?B?OVl1ZkZ1S3lpQ0drbTZiTVZ2TnlLQlo3bGJneFdXV0NvNGNlOFlTMllXODJl?=
 =?utf-8?B?NnByMTR0U05seGNteDF1dnVjMlVNMnRJcHJPV3gwUTlsck9YNU9hN0M4SW1l?=
 =?utf-8?B?dk9NTHdwL212SWJZYWlWa1ZoNHFCcUMxWWtzYWpYU3lkQm1PT2U1ZUY5WW5k?=
 =?utf-8?B?dU83ditacnVWTElucmJNdXJmUHYwZE5WcWprNWRkZHpYZ0dpR1Y2a3U3bnp2?=
 =?utf-8?B?bnBGSzRDbFZzWVBHNDJ1KzQyWmxVSzFVWFhYUTI0RXdGU08vV1hnRFg4K0xC?=
 =?utf-8?B?ZjFYRTljUHpTYkpld09PcU1UOUZMWC8ySEw3eUplZnEzcWp5VVAyem9ZSzBU?=
 =?utf-8?B?V0h3UHIwRjhMWTU0RFpqRkZLWll6cTVaOHdmU1dTSjBtWWVSeDNtb205MlZt?=
 =?utf-8?B?aFFLMnJ0NWIvNEx4OHFXMFZaN29oSWNpbGR6NUpsUHN5ZFlnUlJvblQwMXg0?=
 =?utf-8?B?enJlZC9Pc1YrVGMvNGg2a1RPME5BWXlNWXZRcFZzOVpmYUh4YlNkejFsdlMw?=
 =?utf-8?B?TFpCbE1raTVSSHZZcWsrcTRKK1p2bjVSVWtTem1Ua2RqemM3SFM0YkFsUzZm?=
 =?utf-8?B?U1N5dVFxUThsSmhBeWJiTm43UG9aRGhnOWc2OURpZDFnOVdjRnRBb3Vmc3J2?=
 =?utf-8?B?OHVXdGRoTUNwWkQ4RWxQSEhYQ0ZwT001d0V1SVhQdzNnWEFhb2psTmJtQm5z?=
 =?utf-8?B?UWQ2MXYzRXc1eGNGekdqRUdKblZ4dnNVTW5VcmVFNG95bFkxTVB3Szl2WGRv?=
 =?utf-8?B?eng1YmI5UUlJMlFRak5HYjk5aTVoUnpzMk9kajRqMTVXbWVxalUxbHYxWExx?=
 =?utf-8?B?OE14alZyTnhoYUhvMEVnZUhoRXc3dUFiTjBhZjhITG9uK0JYb3c4SytLQy85?=
 =?utf-8?B?Y1M2Tk5QWUlGaG9NNThaSEFOSzZwVFF2NHhYZWdWbnZJd2M5eGFTZmI1NDBW?=
 =?utf-8?B?YWNrVHVUL2VacithVENIb2dtczZOYjJrbERhWDBac3lPMTBYLzYxUUpRemVy?=
 =?utf-8?B?M2hlaFk0MDRHQmFSSDRTVS9DOUlRRjlHei9QTXhuM0RZYmF3cjhXK09BdFJk?=
 =?utf-8?B?c01LeERvSGxoV0dMWHhpUGZJeUh4c04ycVVFNFVQS0tPNHJON3MxU2xIU3VZ?=
 =?utf-8?B?czZFdC9xUW1oVjhXQXhlZWNQaDFrano4dU1abWYrcmk0dnRBb1U1RVM5cDlF?=
 =?utf-8?B?SDJ3bTdSTUVNSUpHRVpJSmZJcEZ0bmMycE9QbzBnaGVsM1VFMHRrWTl5c280?=
 =?utf-8?B?QUliV2dENnJ5STZQZzJwWm02aXRJOGRESEtqWGwwMGZUMUhEWW40Y3BLancy?=
 =?utf-8?B?YjJrNGNrSC8zTzNzTUwxM0RDYUcydFhRem04aytsNTc5QkQvaVN5aUVab2dJ?=
 =?utf-8?B?VTJReFY2NGlka0p5Y084R3JGZTFnR0FDMkFhWm1wOW4vQzVzR1N5ejdOMEND?=
 =?utf-8?B?L2lOZ09iUUw4QWJQRElReG4xc1BIbE1heTVkOURKbWRUQ3luaTI3L3FVVkpx?=
 =?utf-8?B?MmthR1ZxUCsxVW9ZSi9NRXpFMmE2dTdhTE5adkFPMlllVUJqZzU0aS9RSUIw?=
 =?utf-8?B?WUkva2JNVDhtRFNVVkRaQjRiSXlRcnJseWttdVpsbnd5V1JFYUpadXdHRm85?=
 =?utf-8?Q?pNrzuV26UMT4H+V23q?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DSVPR12MB449095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 673da7b4-9529-43ca-1d3c-08df24a32d25
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 18:45:36.5264 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wK36iODe0NJu7AyV+vguqxluYz3bYiFgH9KOY+H/uJhRZpFXdnv9iFRf+cLDpw9gF7kkvNxDiH5kG8bw+AFnkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8966
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

QU1EIEdlbmVyYWwNCg0KSGkgS2FtaWwsDQoNClNvcnJ5IGZvciBpbnRyb2R1Y2luZyB0aGlzIGJ1
ZywgYW5kIHRoYW5rcyBmb3IgZml4aW5nIHRoZSBtdXNsIGJ1aWxkIGZhaWx1cmUuDQoNCkxvb2tp
bmcgYXQgdGhpcyBhZ2FpbiwgdGhlIGRlc2lnbiBvZiBpZ3RfcGxhdGZvcm1fZmlsdGVyX2R1bXBf
dG9fZmlsZSgpDQp3YXMgaW5jb21wbGV0ZS4gaWd0X3BsYXRmb3JtX2ZpbHRlcl9kdW1wKCkgYWxy
ZWFkeSBlbWl0cyB0aGUgY29uZmlndXJhdGlvbg0KdGhyb3VnaCBpZ3RfaW5mbygpLCBhbmQgSSBm
b3VuZCBubyBjYWxsZXJzIG9mIHRoZSBmaWxlLW91dHB1dCB3cmFwcGVyIGluDQp0aGUgY2hlY2tv
dXQgSSBpbnNwZWN0ZWQuDQoNClBsZWFzZSBmZWVsIGZyZWUgdG8gcmVtb3ZlIGlndF9wbGF0Zm9y
bV9maWx0ZXJfZHVtcF90b19maWxlKCkgZW50aXJlbHksDQphbG9uZyB3aXRoIGl0cyBoZWFkZXIg
ZGVjbGFyYXRpb24sIHRvIGZpeCB0aGUgY29tcGlsYXRpb24gZmFpbHVyZS4gVGhpcw0Kd291bGQg
YXZvaWQgdGhlIGFyY2hpdGVjdHVyZS9jb21waWxlciBndWFyZHMgYW5kIGtlZXBpbmcgYSBmdW5j
dGlvbiB0aGF0DQppZ25vcmVzIGl0cyBmaWxlbmFtZSB3aGlsZSByZXR1cm5pbmcgc3VjY2VzcyBv
biBzb21lIHBsYXRmb3Jtcy4NCg0KSWYgeW91IHdvdWxkIHByZWZlciBtZSB0byBoYW5kbGUgdGhp
cywgSSBjYW4gcHJlcGFyZSB0aGUgcmVtb3ZhbCBwYXRjaA0KaW5zdGVhZC4NCg0KDQpGb3IgdGhl
IHJldmlzZWQgcGF0Y2ggcmVtb3ZpbmcgdGhlIHVudXNlZCBmdW5jdGlvbjoNCg0KUmV2aWV3ZWQt
Ynk6IFZpdGFseSBQcm9zeWFrIHZpdGFseS5wcm9zeWFrQGFtZC5jb20NCg0KVGhhbmtzLA0KVml0
YWx5DQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEthbWlsIEtvbmllY3pu
eSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NClNlbnQ6IFdlZG5lc2RheSwgT2N0
b2JlciA3LCAyMDI2IDEyOjA5IFBNDQpUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
CkNjOiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+OyBQ
cm9zeWFrLCBWaXRhbHkgPFZpdGFseS5Qcm9zeWFrQGFtZC5jb20+OyBaaGFuZywgSmVzc2UoSmll
KSA8SmVzc2UuWmhhbmdAYW1kLmNvbT47IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+DQpT
dWJqZWN0OiBbUEFUQ0ggaS1nLXRdIGxpYi9pZ3RfcGxhdGZvcm1fZmlsdGVyOiBGaXggbXVzbCBi
dWlsZA0KDQpXaGVuIHVzaW5nIG11c2wgQyBsaWJzLCBzdGRvdXQvc3RkZXJyIGFyZSByZWFkLW9u
bHkgdmFycyBhbmQgY29tcGlsYXRpb24gcmVwb3J0cyBlcnJvcnMsIGZvciBleGFtcGxlOg0KDQou
Li9saWIvaWd0X3BsYXRmb3JtX2ZpbHRlci5jOiBJbiBmdW5jdGlvbiDigJhpZ3RfcGxhdGZvcm1f
ZmlsdGVyX2R1bXBfdG9fZmlsZeKAmToNCi4uL2xpYi9pZ3RfcGxhdGZvcm1fZmlsdGVyLmM6NTUx
OjE2OiBlcnJvcjogYXNzaWdubWVudCBvZiByZWFkLW9ubHkgdmFyaWFibGUg4oCYc3Rkb3V04oCZ
DQogIDU1MSB8ICAgICAgICAgc3Rkb3V0ID0gZjsNCg0KRml4IGl0IG9uIHN1Y2ggcGxhdGZvcm1z
IGJ5IGR1bXBpbmcgcGxhdGZvcm0gZmlsdGVycyB0byBzdGRvdXQuDQoNCkNjOiBWaXRhbHkgUHJv
c3lhayA8dml0YWx5LnByb3N5YWtAYW1kLmNvbT4NCkNjOiBKZXNzZSBaaGFuZyA8amVzc2Uuemhh
bmdAYW1kLmNvbT4NClJlcG9ydGVkLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0Pg0K
Q2xvc2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMv
LS93b3JrX2l0ZW1zLzIxMQ0KU2lnbmVkLW9mZi1ieTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5r
b25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KLS0tDQogbGliL2lndF9wbGF0Zm9ybV9maWx0ZXIu
YyB8IDYgKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0t
Z2l0IGEvbGliL2lndF9wbGF0Zm9ybV9maWx0ZXIuYyBiL2xpYi9pZ3RfcGxhdGZvcm1fZmlsdGVy
LmMgaW5kZXggMTViNGU5NjkwLi5jMmMyOGU3ZjAgMTAwNjQ0DQotLS0gYS9saWIvaWd0X3BsYXRm
b3JtX2ZpbHRlci5jDQorKysgYi9saWIvaWd0X3BsYXRmb3JtX2ZpbHRlci5jDQpAQCAtNTM3LDYg
KzUzNyw3IEBAIHZvaWQgaWd0X3BsYXRmb3JtX2ZpbHRlcl9kdW1wKHZvaWQpDQogICovDQogaW50
IGlndF9wbGF0Zm9ybV9maWx0ZXJfZHVtcF90b19maWxlKGNvbnN0IGNoYXIgKmZpbGVuYW1lKSAg
ew0KKyNpZiBkZWZpbmVkKF9feDg2XzY0X18pICYmICFkZWZpbmVkKF9fY2xhbmdfXykgJiYgZGVm
aW5lZChfX0dMSUJDX18pICYmDQorIWRlZmluZWQoX19VQ0xJQkNfXykNCiAgICAgICAgRklMRSAq
b2xkX3N0ZG91dDsNCiAgICAgICAgRklMRSAqZjsNCg0KQEAgLTU0OSwxNCArNTUwLDE5IEBAIGlu
dCBpZ3RfcGxhdGZvcm1fZmlsdGVyX2R1bXBfdG9fZmlsZShjb25zdCBjaGFyICpmaWxlbmFtZSkN
CiAgICAgICAgLyogUmVkaXJlY3Qgc3Rkb3V0IHRvIGZpbGUgKi8NCiAgICAgICAgb2xkX3N0ZG91
dCA9IHN0ZG91dDsNCiAgICAgICAgc3Rkb3V0ID0gZjsNCisjZW5kaWYNCg0KICAgICAgICBpZ3Rf
cGxhdGZvcm1fZmlsdGVyX2R1bXAoKTsNCg0KKyNpZiBkZWZpbmVkKF9feDg2XzY0X18pICYmICFk
ZWZpbmVkKF9fY2xhbmdfXykgJiYgZGVmaW5lZChfX0dMSUJDX18pICYmDQorIWRlZmluZWQoX19V
Q0xJQkNfXykNCiAgICAgICAgLyogUmVzdG9yZSBzdGRvdXQgKi8NCiAgICAgICAgc3Rkb3V0ID0g
b2xkX3N0ZG91dDsNCiAgICAgICAgZmNsb3NlKGYpOw0KDQogICAgICAgIGlndF9pbmZvKCJQbGF0
Zm9ybSBmaWx0ZXIgY29uZmlndXJhdGlvbiBkdW1wZWQgdG86ICVzXG4iLCBmaWxlbmFtZSk7DQor
I2Vsc2UNCisgICAgICAgaWd0X2luZm8oIlBsYXRmb3JtIGZpbHRlciBjb25maWd1cmF0aW9uIGR1
bXBlZFxuIik7ICNlbmRpZg0KICAgICAgICByZXR1cm4gMDsNCiB9DQoNCi0tDQoyLjU1LjANCg0K
