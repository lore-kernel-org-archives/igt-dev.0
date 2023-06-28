Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE58D10E129
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 09:03:18 +0000 (UTC)
From: "Dec, Katarzyna" <katarzyna.dec@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 28 Jun 2023 09:02:51 +0000
Message-ID: <IA1PR11MB6097007A2137463F6CCB1E9CE224A@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20230628085816.19289-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230628085816.19289-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci/xe-fast-feedback: fix xe_mmap
 tests order
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

TEdUTSDwn5iKDQpBY2tlZC1ieTogS2F0YXJ6eW5hIERlYyA8a2F0YXJ6eW5hLmRlY0BpbnRlbC5j
b20+DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBLYW1pbCBLb25pZWN6bnkg
PGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+IA0KU2VudDogV2VkbmVzZGF5LCBKdW5l
IDI4LCAyMDIzIDEwOjU4IEFNDQpUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNj
OiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+OyBEZWMs
IEthdGFyenluYSA8a2F0YXJ6eW5hLmRlY0BpbnRlbC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggaS1n
LXRdIGludGVsLWNpL3hlLWZhc3QtZmVlZGJhY2s6IGZpeCB4ZV9tbWFwIHRlc3RzIG9yZGVyDQoN
Ckl0IHR1cm5zIG91dCBJIG1hZGUgYW4gZXJyb3IgYW5kIG1lcmdlZCB2MSBvZiBwYXRjaA0KdGVz
dHMvaW50ZWwtY2k6IEFkZCB4ZV9tbWFwICYgeGVfY3JlYXRlIHRlc3RzIHRvIGYtZg0KDQpGaXhl
ZCB0aGlzIHdpdGggY29ycmVjdGluZyBvcmRlciBvZiB0ZXN0cyB0byBiZSBzb3J0ZWQgYWxwaGFi
ZXRpY2FsbHkuDQoNCkNjOiBLYXRhcnp5bmEgRGVjIDxrYXRhcnp5bmEuZGVjQGludGVsLmNvbT4N
ClNpZ25lZC1vZmYtYnk6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4Lmlu
dGVsLmNvbT4NCi0tLQ0KIHRlc3RzL2ludGVsLWNpL3hlLWZhc3QtZmVlZGJhY2sudGVzdGxpc3Qg
fCA2ICsrKy0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pDQoNCmRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1jaS94ZS1mYXN0LWZlZWRiYWNrLnRlc3Rs
aXN0IGIvdGVzdHMvaW50ZWwtY2kveGUtZmFzdC1mZWVkYmFjay50ZXN0bGlzdA0KaW5kZXggYTk1
NmUxMGUwLi45ZDY3MDc2NGIgMTAwNjQ0DQotLS0gYS90ZXN0cy9pbnRlbC1jaS94ZS1mYXN0LWZl
ZWRiYWNrLnRlc3RsaXN0DQorKysgYi90ZXN0cy9pbnRlbC1jaS94ZS1mYXN0LWZlZWRiYWNrLnRl
c3RsaXN0DQpAQCAtMTgyLDEyICsxODIsMTIgQEAgaWd0QHhlX2ludGVsX2JiQHJlbmRlciAgaWd0
QHhlX2ludGVsX2JiQHJlc2V0LWJiICBpZ3RAeGVfaW50ZWxfYmJAc2ltcGxlLWJiICBpZ3RAeGVf
aW50ZWxfYmJAc2ltcGxlLWJiLWN0eA0KK2lndEB4ZV9tbWFwQGJhZC1leHRlbnNpb25zDQoraWd0
QHhlX21tYXBAYmFkLWZsYWdzDQoraWd0QHhlX21tYXBAYmFkLW9iamVjdA0KIGlndEB4ZV9tbWFw
QHN5c3RlbQ0KIGlndEB4ZV9tbWFwQHZyYW0NCiBpZ3RAeGVfbW1hcEB2cmFtLXN5c3RlbQ0KLWln
dEB4ZV9tbWFwQGJhZC1mbGFncw0KLWlndEB4ZV9tbWFwQGJhZC1leHRlbnNpb25zDQotaWd0QHhl
X21tYXBAYmFkLW9iamVjdA0KIGlndEB4ZV9tbWlvQG1taW8tdGltZXN0YW1wDQogaWd0QHhlX21t
aW9AbW1pby1pbnZhbGlkDQogaWd0QHhlX3ByaW1lX3NlbGZfaW1wb3J0QGJhc2ljLXdpdGhfb25l
X2JvDQotLQ0KMi4zOS4yDQoNCg==
