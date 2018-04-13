Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67B26EAEF
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Apr 2018 11:22:03 +0000 (UTC)
Date: Fri, 13 Apr 2018 13:22:01 +0200
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20180413112201.GI13079@kdec5-desk.ger.corp.intel.com>
References: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
 <20180411023732.32362-12-dhinakaran.pandiyan@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180411023732.32362-12-dhinakaran.pandiyan@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 12/20] tests/sink_crc_basic: Debug print
 CRC values
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
To: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBBcHIgMTAsIDIwMTggYXQgMDc6Mzc6MjRQTSAtMDcwMCwgRGhpbmFrYXJhbiBQYW5k
aXlhbiB3cm90ZToKPiBUaGUgQ1JDIHZhbHVlcyBhcmUgdXNlZnVsIGFzIGEgcmVmZXJlbmNlIHRv
IGNvbXBhcmUgdGhlbSB3aXRoIHZhbHVlcwo+IGdlbmVyYXRlZCBmcm9tIG90aGVyIGZlYXR1cmUg
KFBTUikgdGVzdHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhp
bmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+CiBSZXZpZXdlZC1ieTogS2F0YXJ6eW5hIERlYyA8
a2F0YXJ6eW5hLmRlY0BpbnRlbC5jb20+Cj4gLS0tCj4gIHRlc3RzL2ttc19zaW5rX2NyY19iYXNp
Yy5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL3Rlc3RzL2ttc19zaW5rX2NyY19iYXNpYy5jIGIvdGVzdHMva21zX3NpbmtfY3JjX2Jh
c2ljLmMKPiBpbmRleCAxNTk2ODNlMi4uMWMzMWUzMGEgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMva21z
X3NpbmtfY3JjX2Jhc2ljLmMKPiArKysgYi90ZXN0cy9rbXNfc2lua19jcmNfYmFzaWMuYwo+IEBA
IC02MywxMSArNjMsMTMgQEAgc3RhdGljIHZvaWQgYXNzZXJ0X2NvbG9yKGludCBkaXIsIGVudW0g
Y29sb3IgY29sb3IpCj4gIAkJaWd0X2Fzc2VydF9sdCgwLCByKTsKPiAgCQlpZ3RfYXNzZXJ0X2Vx
KDAsIGcpOwo+ICAJCWlndF9hc3NlcnRfZXEoMCwgYik7Cj4gKwkJaWd0X2RlYnVnKCJzaW5rIENS
QyBmb3IgcmVkICUuNHglLjR4JS40eFxuIiwgciwgZywgYik7Cj4gIAkJYnJlYWs7Cj4gIAljYXNl
IEdSRUVOOgo+ICAJCWlndF9hc3NlcnRfZXEoMCwgcik7Cj4gIAkJaWd0X2Fzc2VydF9sdCgwLCBn
KTsKPiAgCQlpZ3RfYXNzZXJ0X2VxKDAsIGIpOwo+ICsJCWlndF9kZWJ1Zygic2luayBDUkMgZm9y
IGdyZWVuICUuNHglLjR4JS40eFxuIiwgciwgZywgYik7Cj4gIAkJYnJlYWs7Cj4gIAlkZWZhdWx0
Ogo+ICAJCWlndF9mYWlsKElHVF9FWElUX0ZBSUxVUkUpOwo+IC0tIAo+IDIuMTQuMQo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gaWd0LWRldiBt
YWlsaW5nIGxpc3QKPiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
