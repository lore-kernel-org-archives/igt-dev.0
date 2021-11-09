Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB556E5A3
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Nov 2021 17:40:31 +0000 (UTC)
From: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Date: Tue, 9 Nov 2021 17:00:37 +0000
Message-ID: <836037356a9641b8ac6e5b5dffb86134@intel.com>
References: <20211104142212.3098989-1-Rodrigo.Siqueira@amd.com>
 <YD9g7MincmSpHKokI9Hxv8LRxCcqmJieUwB_QqxG3lDLAAo8dqQTt0POThWwrYYVIlXby4q2S7CfuTsTgB6WlureHfe_Irct-a41bKvxzIk=@emersion.fr>
 <04b490f7-edbb-f536-995d-5b185a62181a@amd.com>
In-Reply-To: <04b490f7-edbb-f536-995d-5b185a62181a@amd.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] Revert "test/kms_atomic: Skip plane
 overlay test for amdgpu"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Siqueira Jordao <rjordrigo@amd.com>, Simon Ser <contact@emersion.fr>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Hayden Goodfellow <Hayden.Goodfellow@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

SGksDQoNCldlIGhhdmUgYW4gaXNzdWUgYWxyZWFkeSBmb3IgdGhlIHJlZ3Jlc3Npb24gZmFpbHVy
ZS4gSnVzdCByZS1yZXBvcnRlZCB0aGUgcmVzdWx0cy4NCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9kcm0vaW50ZWwvLS9pc3N1ZXMvMjg2Nw0KQWxsIHRlc3RzIC0gZG1lc2ctd2FybiAt
ICpFUlJPUiogcG93ZXIgd2VsbCBBVVggKEcpPyBUQlRcZCBzdGF0ZSBtaXNtYXRjaCAocmVmY291
bnQgMS9lbmFibGVkIDApDQoNClRoYW5rcywNCkxha3NobWkuDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogUm9kcmlnbyBTaXF1ZWlyYSBKb3JkYW8gPHJqb3Jkcmlnb0BhbWQuY29t
PiANClNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDksIDIwMjEgNzo1MiBBTQ0KVG86IFNpbW9uIFNl
ciA8Y29udGFjdEBlbWVyc2lvbi5mcj47IFJvZHJpZ28gU2lxdWVpcmEgPFJvZHJpZ28uU2lxdWVp
cmFAYW1kLmNvbT47IFZ1ZHVtLCBMYWtzaG1pbmFyYXlhbmEgPGxha3NobWluYXJheWFuYS52dWR1
bUBpbnRlbC5jb20+DQpDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEhhcnJ5IFdl
bnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPjsgTmljaG9sYXMgQ2hvaSA8TmljaG9sYXMu
Q2hvaUBhbWQuY29tPjsgSGF5ZGVuIEdvb2RmZWxsb3cgPEhheWRlbi5Hb29kZmVsbG93QGFtZC5j
b20+OyBNYXJrIFlhY291YiA8bWFya3lhY291YkBjaHJvbWl1bS5vcmc+DQpTdWJqZWN0OiBSZTog
W1BBVENIIGktZy10XSBSZXZlcnQgInRlc3Qva21zX2F0b21pYzogU2tpcCBwbGFuZSBvdmVybGF5
IHRlc3QgZm9yIGFtZGdwdSINCg0KSGkgTGFrc2htaW5hcmF5YW5hLA0KDQpJdCBsb29rcyBsaWtl
IHRoYXQgSSBnb3QgYSBmYWxzZS1wb3NpdGl2ZSBmcm9tIHRoZSBDSS4gSGVyZSBpcyB0aGUgcGF0
Y2h3b3JrIGxpbms6DQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMv
OTY1NzMvDQoNCk5vdGljZSB0aGF0IHRoaXMgcGF0Y2ggaXMgc3BlY2lmaWMgdG8gQU1ELg0KDQpP
biAyMDIxLTExLTA0IDEwOjM4IGEubS4sIFNpbW9uIFNlciB3cm90ZToNCj4gUmV2aWV3ZWQtYnk6
IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4NCj4gDQoNClRoYW5rcyBTaW1vbiA6KQ0K
DQpCZXN0IFJlZ2FyZHMNClNpcXVlaXJhDQoNCg==
