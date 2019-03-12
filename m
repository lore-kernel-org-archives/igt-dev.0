Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A37D89CD9
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2019 11:21:21 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 12 Mar 2019 13:21:14 +0200
Message-Id: <20190312112114.1979-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/ioctl_wrappers: Assert that
 prime_handle_to_fd returns a valid fd
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SWYgdGhlIGlvY3RsIGlzIHN1Y2Nlc3NmdWwsIHRoZSByZXR1cm5lZCBmZCBzaG91bGQgYmUgdmFs
aWQuIENoZWNrCnRoYXQgaXQgaXMsIHRodXMgYWxzbyBoZWxwaW5nIHN0YXRpYyBhbmFseXNpcyBp
biBhbG1vc3QgNzAgY2FsbCBzaXRlcy4KClNpZ25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEgPHBl
dHJpLmxhdHZhbGFAaW50ZWwuY29tPgotLS0KIGxpYi9pb2N0bF93cmFwcGVycy5jIHwgMSArCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9saWIvaW9jdGxfd3Jh
cHBlcnMuYyBiL2xpYi9pb2N0bF93cmFwcGVycy5jCmluZGV4IDM5OTIwZjg3Li4zMTk2OWU3NyAx
MDA2NDQKLS0tIGEvbGliL2lvY3RsX3dyYXBwZXJzLmMKKysrIGIvbGliL2lvY3RsX3dyYXBwZXJz
LmMKQEAgLTEzMzIsNiArMTMzMiw3IEBAIGludCBwcmltZV9oYW5kbGVfdG9fZmQoaW50IGZkLCB1
aW50MzJfdCBoYW5kbGUpCiAJYXJncy5mZCA9IC0xOwogCiAJZG9faW9jdGwoZmQsIERSTV9JT0NU
TF9QUklNRV9IQU5ETEVfVE9fRkQsICZhcmdzKTsKKwlpZ3RfYXNzZXJ0X2ZkKGFyZ3MuZmQpOwog
CiAJcmV0dXJuIGFyZ3MuZmQ7CiB9Ci0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldg==
