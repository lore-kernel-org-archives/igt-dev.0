Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146036EB4E
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2020 19:13:40 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 16 Apr 2020 19:13:39 +0000
Message-ID: <43ec55cff438da038d7c4dd0f5485884a4ae298d.camel@intel.com>
References: <20200415212406.102082-1-jose.souza@intel.com>
 <20200416071027.GU9497@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20200416071027.GU9497@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-ID: <FEA1D48467AC4147B1DECCCCDC0E8DD3@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tools/registers/tgl: Fix
 tigerlake_delta file decode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyMDIwLTA0LTE2IGF0IDEwOjEwICswMzAwLCBQZXRyaSBMYXR2YWxhIHdyb3RlOg0K
PiBPbiBXZWQsIEFwciAxNSwgMjAyMCBhdCAwMjoyNDowNlBNIC0wNzAwLCBKb3PDqSBSb2JlcnRv
IGRlIFNvdXphDQo+IHdyb3RlOg0KPiA+IEl0IHdhcyBtaXNzaW5nIGEgIikiIHRvIGJlIHByb3Bl
cmx5IHBhcnNlZC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNv
dXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBQZXRyaSBMYXR2
YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4NCg0KVGhhbmtzLCBwdXNoZWQuDQoNCj4gDQo+
IA0KPiA+IC0tLQ0KPiA+ICB0b29scy9yZWdpc3RlcnMvdGlnZXJsYWtlX2RlbHRhLnR4dCB8IDIg
Ky0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
ID4gDQo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3JlZ2lzdGVycy90aWdlcmxha2VfZGVsdGEudHh0
DQo+ID4gYi90b29scy9yZWdpc3RlcnMvdGlnZXJsYWtlX2RlbHRhLnR4dA0KPiA+IGluZGV4IGU4
MjA0OWI5OS4uYzdmYzJkYzI0IDEwMDY0NA0KPiA+IC0tLSBhL3Rvb2xzL3JlZ2lzdGVycy90aWdl
cmxha2VfZGVsdGEudHh0DQo+ID4gKysrIGIvdG9vbHMvcmVnaXN0ZXJzL3RpZ2VybGFrZV9kZWx0
YS50eHQNCj4gPiBAQCAtMTEwLDcgKzExMCw3IEBADQo+ID4gICgnUExBTkVfQ09MT1JfQ1RMXzVf
RCcsICcweDczNWNjJywgJycpDQo+ID4gICgnUExBTkVfQ09MT1JfQ1RMXzZfRCcsICcweDczNmNj
JywgJycpDQo+ID4gICgnUExBTkVfQ09MT1JfQ1RMXzdfRCcsICcweDczN2NjJywgJycpDQo+ID4g
LSgnUExBTkVfT0ZGU0VUXzFfRCcsICcweDczMWE0JywgJycNCj4gPiArKCdQTEFORV9PRkZTRVRf
MV9EJywgJzB4NzMxYTQnLCAnJykNCj4gPiAgKCdQTEFORV9PRkZTRVRfMl9EJywgJzB4NzMyYTQn
LCAnJykNCj4gPiAgKCdQTEFORV9PRkZTRVRfM19EJywgJzB4NzMzYTQnLCAnJykNCj4gPiAgKCdQ
TEFORV9PRkZTRVRfNF9EJywgJzB4NzM0YTQnLCAnJykNCj4gPiAtLSANCj4gPiAyLjI2LjENCj4g
PiANCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
PiA+IGlndC1kZXYgbWFpbGluZyBsaXN0DQo+ID4gaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
