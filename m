Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BEA896ED
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jun 2019 11:48:32 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Tue,  4 Jun 2019 14:48:33 +0300
Message-Id: <20190604114836.2830-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/3] Check for audio noise and pops
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
To: igt-dev@lists.freedesktop.org
Cc: martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBzZXJpZXMgaXMgYSBjb250aW51YXRpb24gb2YgIkFkZCBpZ3RfYXVkaW8gc2VsZi10ZXN0
cyBhbmQgY2hlY2sgZm9yCm5vaXNlL3BvcHMiLiBDb21tZW50cyBoYXZlIGJlZW4gYWRkcmVzc2Vk
IG9uIHRoZSBsYXN0IHR3byBwYXRjaGVzIG9mIHRoYXQKc2VyaWVzLCBhbmQgYSBuZXcgY29tbWl0
IGFkZHMgYSBuZXcgcGhhc2VzaGlmdCB0ZXN0LgoKSW4gbXkgcmVhbC13b3JsZCB0ZXN0cyB0aGUg
cG93ZXIgZm9yIHRoZXNlIGxvdyBmcmVxdWVuY2llcyBnbyB1cCB0byAwLjAwMDEgZm9yCkRpc3Bs
YXlQb3J0LiBJbiB0aGUgc2VsZi10ZXN0cyBhIDAuMDAwNSB0aHJlc2hvbGQgZGV0ZWN0cyBhIHBo
YXNlc2hpZnQgb2YgYXQKbGVhc3QgNCBzYW1wbGVzLiBMb3dlcmluZyB0aGUgdGhyZXNob2xkIHRv
IDAuMDAwMiBpc24ndCBlbm91Z2ggdG8gZGV0ZWN0CnBoYXNlc2hpZnRzIHdpdGggYSBsb3dlciBu
dW1iZXIgb2Ygc2FtcGxlcy4gVGh1cyBJIHN0aWxsIHRoaW5rIGEgMC4wMDA1CnRocmVzaG9sZCBp
cyByZWFzb25hYmxlLgoKVGhlIHBoYXNlc2hpZnQgc2VsZi10ZXN0IHRydW5jYXRlcyA4IHNhbXBs
ZXMsIGp1c3Qgc28gdGhhdCB3ZSBoYXZlIHNvbWUgZnJlZWRvbQppZiB3ZSB3YW50IHRvIGNoYW5n
ZSBhdWRpb19zaWduYWxfZGV0ZWN0J3MgbG9naWMuIDggc2FtcGxlcyBpcyBkZWZpbml0ZWx5IGEK
dmVyeSBzbWFsbCBwaGFzZXNoaWZ0LgoKU2ltb24gU2VyICgzKToKICBsaWIvaWd0X2F1ZGlvOiBk
ZXRlY3Qgbm9pc2UgYW5kIHBvcHMKICBsaWIvdGVzdHMvaWd0X2F1ZGlvOiBhZGQgYSBwb3AgdGVz
dAogIGxpYi90ZXN0cy9pZ3RfYXVkaW86IGFkZCBwaGFzZXNoaWZ0IGRldGVjdGlvbiB0ZXN0Cgog
bGliL2lndF9hdWRpby5jICAgICAgIHwgNTggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tCiBsaWIvdGVzdHMvaWd0X2F1ZGlvLmMgfCA1OSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDExMiBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQoKLS0KMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXY=
