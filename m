Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F6C89850
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2019 08:15:59 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Mon, 13 May 2019 11:15:48 +0300
Message-Id: <20190513081548.31837-9-simon.ser@intel.com>
In-Reply-To: <20190513081548.31837-1-simon.ser@intel.com>
References: <20190513081548.31837-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 8/8] HAX: add {dp,
 hdmi}-audio test to fast-feedback
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
List-ID: <igt-dev@lists.freedesktop.org>

V2FpdGluZyBmb3IgdGhlIHdob2xlIHNlcmllcyB0byBiZSBjb21wbGV0ZSB0byBkZWNpZGUgd2hl
dGhlciBvciBub3Qgd2Ugd2FudAp0aGlzIHRlc3QgaW4gZmFzdC1mZWVkYmFjay4KClNpZ25lZC1v
ZmYtYnk6IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pbnRlbC1j
aS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0IHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxp
c3QgYi90ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0CmluZGV4IDQwNDc1YjFh
YjM2MS4uZDM5YjkyYTg2NmRhIDEwMDY0NAotLS0gYS90ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRi
YWNrLnRlc3RsaXN0CisrKyBiL3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QK
QEAgLTE3NSw5ICsxNzUsMTEgQEAgaWd0QGttc19hZGRmYl9iYXNpY0B1bnVzZWQtcGl0Y2hlcwog
aWd0QGttc19idXN5QGJhc2ljLWZsaXAtYQogaWd0QGttc19idXN5QGJhc2ljLWZsaXAtYgogaWd0
QGttc19idXN5QGJhc2ljLWZsaXAtYworaWd0QGttc19jaGFtZWxpdW1AZHAtYXVkaW8KIGlndEBr
bXNfY2hhbWVsaXVtQGRwLWhwZC1mYXN0CiBpZ3RAa21zX2NoYW1lbGl1bUBkcC1lZGlkLXJlYWQK
IGlndEBrbXNfY2hhbWVsaXVtQGRwLWNyYy1mYXN0CitpZ3RAa21zX2NoYW1lbGl1bUBoZG1pLWF1
ZGlvCiBpZ3RAa21zX2NoYW1lbGl1bUBoZG1pLWhwZC1mYXN0CiBpZ3RAa21zX2NoYW1lbGl1bUBo
ZG1pLWVkaWQtcmVhZAogaWd0QGttc19jaGFtZWxpdW1AaGRtaS1jcmMtZmFzdAotLSAKMi4yMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
